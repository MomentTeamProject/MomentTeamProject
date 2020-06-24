package web.controller;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import web.board.WebBoardVO;
import web.email.CommonService;
import web.pano.PanoPage;
import web.pano.PanoServiceImpl;
import web.user.WebUserVO;

@Controller
public class PanoBoardController {
	@Autowired PanoServiceImpl service;
	@Autowired PanoPage page;
	@Autowired private CommonService common;
	
	private String key = "AIzaSyDrfll4QoaTNLPA3Zhpd0P_72bmSVjqNYk";	
	private String map_url = "https://maps.googleapis.com/maps/api/geocode/json?address=";
	
	@RequestMapping("/panolist.pa")
	public String panoPhotoList(@RequestParam(defaultValue = "1") int curPage
								, @RequestParam(defaultValue = "10") int pageList
								, Model model) {
		
		return "";
	}
	
	//파노라마게시판 이동
	@RequestMapping("/list.pa")
	public String panoList(HttpSession session
							, @RequestParam(defaultValue = "1") int curPage
							, @RequestParam(defaultValue = "20") int pageList , Model model) {
		
		session.setAttribute("category", "pa");
		page.setCurPage(curPage);
		page.setPageList(pageList);
		model.addAttribute("page",service.pano_list(page));
		model.addAttribute("first",page.getList().get(0));
		System.out.println("begin: "+page.getBeginList());
		System.out.println("end: "+page.getEndList());
		return "pano/list";
	} 
	
	
		//파노라마 글쓰기 페이지 요청
		@RequestMapping("/new.pa")
		public String board_new() {
			
			
			return "pano/new";		
		}
		
		//파노라마 게시글 저장
		@RequestMapping(value="/insert.pa", produces="text/html; charset=utf-8")
		public String insert(WebBoardVO vo, MultipartFile file, HttpSession session) {
		
			if ( !file.isEmpty()) {
				vo.setB_imgpath(common.uploadpic("background", file, session));
			}
				
			System.out.println("dkdkdkdkdkdk"+vo.toString());
			vo.setB_userid( ((WebUserVO)session.getAttribute("login_info")).getU_userid());
			//System.out.println("새 글 : " + vo.toString());
			service.pano_insert(vo); 
			
			return "redirect:list.pa";		
		}
		
		
		
		//파노라마 글쓰기 지도 검색
		@ResponseBody @RequestMapping(value="/search_map", produces="application/json; charset=utf-8")
		public JSONObject search_location(String address) {
			System.out.println(address);
			StringBuilder url = new StringBuilder( map_url + address);
			url.append("&key=" + key);		
			url.append("&language=ko");		

				
			return common.json_list(url);
		}
	
}
