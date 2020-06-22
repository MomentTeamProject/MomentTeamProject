package web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class PanoBoardController {
	
	@RequestMapping("/panolist.pa")
	public String panoPhotoList(@RequestParam(defaultValue = "1") int curPage, @RequestParam(defaultValue = "10") int pageList) {
		
		
		
		
		return "";
	}
	
	//파노라마게시판 이동
	@RequestMapping("/list.pa")
	public String panoList(HttpSession session) {
		session.setAttribute("category", "pa");
		return "pano/list";
	}
	
}
