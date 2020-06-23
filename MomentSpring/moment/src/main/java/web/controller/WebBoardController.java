package web.controller;


import java.io.File;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ResourceLoaderAware;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import android.board.FavoriteVO;
import web.board.WebBoardPage;
import web.board.WebBoardServiceImpl;
import web.board.WebBoardVO;
import web.board.WebFavoriteVO;
import web.common.Common;
import web.email.CommonService;
import web.user.WebUserVO;

@Controller
public class WebBoardController {
	
	@Autowired private WebBoardServiceImpl service;
	@Autowired private WebBoardPage page;
	@Autowired private CommonService common;
	@Autowired private ResourceLoader resourceLoader;

	private String key = "AIzaSyDrfll4QoaTNLPA3Zhpd0P_72bmSVjqNYk";	
	private String map_url = "https://maps.googleapis.com/maps/api/geocode/json?address=";
	
	//디테일에서 로그인한 사용자가 추천버튼 클릭시
	@ResponseBody @RequestMapping("/ddabong.bo")
	public void ddabong(int no, String userid, String ddabong, String fav) {
		if(ddabong.equals("N")) {
			System.out.println(no + " 번 글 추천 요청 / 추천한 사용자 ID : " + userid);
		} else {
			System.out.println(no + " 번 글 추천 취소 요청 / 추천한 사용자 ID : " + userid);
		}
		
		//쿼리문 처리에 사용할 fVo 객체생성
		WebFavoriteVO fVo = new WebFavoriteVO();
		fVo.setF_bno(no);
		fVo.setF_userid(userid);
		fVo.setF_ddabong(ddabong);
		fVo.setF_favorites(fav);
		service.boardDdabong(fVo);
		service.boardDdabongUpdate(fVo);
		
		System.out.println("변경된 추천정보 : " + fVo.getF_ddabong());
	}
	
	//사진디테일  클릭시
	@ResponseBody @RequestMapping("/detail.bo")
	public WebBoardVO detail(int no, @RequestParam(defaultValue = "bLogin") String userid) {
		System.out.println("======== " + no + "번 게시물 상세정보 요청 ========");
		
		System.out.println("조회한 사용자 id : " + userid);
		WebBoardVO vo =  service.board_detail(no, userid);
		System.out.println(vo);
		return vo;
	}
	
	//더보기 이벤트 ajax 통신시 다음페이지 14개 출력
	@ResponseBody @RequestMapping("/more.bo")
	public List<WebBoardVO> more(Model model, String search, String keyword, @RequestParam(defaultValue = "1") int curPage, @RequestParam(defaultValue = "10") int pageList, @RequestParam(defaultValue = "lately") String viewType ) {
		System.out.println("======== 다음페이지("+page.getCurPage()+") 출력 ========");
		System.out.println(curPage);
		page.setCurPage(page.getCurPage()+curPage);
		page.setSearch(search);
		page.setKeyword(keyword);
		page.setPageList(pageList);
		
		System.out.println();
		
		WebBoardPage dbLoadPage = service.board_list(page);
		WebBoardPage resultPage = existsImgTest(dbLoadPage);
		
		List<WebBoardVO> list = resultPage.getList();
		
		System.out.println("다음페이지 출력" + list);
		return list;
	}
	
	//POST 카테고리로 이동
	@RequestMapping("/list.bo")
	public String board(Model model, HttpSession session, String search, String keyword, @RequestParam(defaultValue = "1") int curPage, @RequestParam(defaultValue = "10") int pageList, @RequestParam(defaultValue = "lately") String viewType) {
		System.out.println("======== 사진 카테고리 이동 ========");
		session.setAttribute("category", "bo");
		
		if(viewType.equals("lately")) {
			System.out.println("최신순 목록 출력");
		} else {
			System.out.println("추천순 목록 출력");
		}
		
		page.setCurPage(curPage);
		page.setCurPage(2);
		page.setSearch(search);
		page.setKeyword(keyword);
		page.setPageList(pageList);
		page.setViewType(viewType);
		
		WebBoardPage dbLoadPage = service.board_list(page);
		
		WebBoardPage resultPage = existsImgTest(dbLoadPage);
		
		
		model.addAttribute( "page", resultPage );
		System.out.println("1페이지 목록출력" + resultPage.getList());
		
		return "pictures/list";
	}
	
	//글쓰기 페이지 요청
	@RequestMapping("/new.bo")
	public String board_new() {
		
		
		return "pictures/new";		
	}
	
	//새로운 게시글 저장
	@RequestMapping(value="/insert.bo", produces="text/html; charset=utf-8")
	public String insert(WebBoardVO vo, MultipartFile file, HttpSession session) {
	
		if ( !file.isEmpty()) {
			vo.setB_imgpath(common.uploadpic("background", file, session));
		}
			

		vo.setB_userid( ((WebUserVO)session.getAttribute("login_info")).getU_userid());
		System.out.println("새 글 : " + vo.toString());
		service.board_insert(vo); 
		
		return "redirect:list.bo";		
	}
	
	
	
	//새글 지도 검색
	@ResponseBody @RequestMapping(value="/search_location", produces="application/json; charset=utf-8")
	public JSONObject sigungu(String address) {
		System.out.println(address);
		StringBuilder url = new StringBuilder( map_url + address);
		url.append("&key=" + key);		
		url.append("&language=ko");		

			
		return common.json_list(url);
	}
	
	private WebBoardPage existsImgTest(WebBoardPage page) {
		//db에 저장된 imgpath가 서버에 없을경우 default 이미지로 변경해주는 로직
		//가져온 배열 10번돔
		for(int i=0; i<page.getList().size(); i++) {
			//10개의배열들의 imgpath 추출해서 바꿔줘야함
			//(1) 각배열의 img
			System.out.println("getImgpath : "+page.getList().get(i).getB_imgpath());
			String filePath = Common.IMAGE_PATH_BACKGROUND + page.getList().get(i).getB_imgpath();
			
			System.out.println("resource ["+i+"] : "+filePath);
			try {
				//resource path를 getFile메소드를통해 불러와서 File객체 img에 담아줌
				File img = new File(filePath);
				System.out.println("img 객체["+i+"] : "+img);
				//img 객체가 존재하지않는다면
				if(!img.exists())
					page.getList().get(i).setB_imgpath("404e.png");
			} catch (Exception e) {
				System.out.println("path load error!");
			}
		}
			
		for(int i=0; i<page.getList().size(); i++) {
			System.out.println("수정 후 이미지패스["+i+"] : " + page.getList().get(i).getB_imgpath());
		}
		return page;
	}

	
	
	
	
	
	
	
	
	
	
}
