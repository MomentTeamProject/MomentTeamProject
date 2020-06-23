package web.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import web.board.WebBoardPage;
import web.board.WebBoardServiceImpl;
import web.board.WebBoardVO;
import web.email.CommonService;
import web.user.WebUserVO;

@Controller
public class WebBoardController {
	
	@Autowired private WebBoardServiceImpl service;
	@Autowired private WebBoardPage page;
	@Autowired private CommonService common;

	private String key = "AIzaSyDrfll4QoaTNLPA3Zhpd0P_72bmSVjqNYk";	
	private String map_url = "https://maps.googleapis.com/maps/api/geocode/json?address=";
	
	
	//파노라마게시판 이동
	@RequestMapping("/list.pa")
	public String panoList(HttpSession session) {
		session.setAttribute("category", "pa");
		return "pano/list";
	}
	
	//사진디테일  클릭시
	@ResponseBody @RequestMapping("/detail.bo")
	public WebBoardVO detail(int no) {
		System.out.println("======== " + no + "번 게시물 상세정보 요청 ========");
		WebBoardVO vo =  service.board_detail(no);
		System.out.println(vo);
		
		return vo;
	}
	
	//더보기 이벤트 ajax 통신시 다음페이지 10개 출력
	@ResponseBody @RequestMapping("/more.bo")
	public List<WebBoardVO> more(Model model, String search, String keyword, @RequestParam(defaultValue = "1") int curPage, @RequestParam(defaultValue = "10") int pageList ) {
		System.out.println("======== 다음페이지 출력 ========");
		System.out.println(curPage);
		page.setCurPage(page.getCurPage()+curPage);
		page.setSearch(search);
		page.setKeyword(keyword);
		page.setPageList(pageList);
		
		System.out.println(page.getCurPage());
		
		List<WebBoardVO> list = service.board_list(page).getList();
		System.out.println("다음페이지 출력" + list);
		return list;
	}
	
	//POST 카테고리로 이동
	@RequestMapping("/list.bo")
	public String board(Model model, HttpSession session, String search, String keyword, @RequestParam(defaultValue = "1") int curPage, @RequestParam(defaultValue = "10") int pageList) {
		System.out.println("======== 사진 카테고리 이동 ========");
		session.setAttribute("category", "bo");
		
		page.setCurPage(curPage);
		page.setSearch(search);
		page.setKeyword(keyword);
		page.setPageList(pageList);
		
		model.addAttribute( "page", service.board_list(page) );
		System.out.println("1페이지 목록출력" + page.getList());
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
	
	

	
	
	
	
	
	
	
	
	
	
}
