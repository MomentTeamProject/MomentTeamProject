package web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import web.pano.PanoPage;
import web.pano.PanoServiceImpl;

@Controller
public class PanoBoardController {
	@Autowired PanoServiceImpl service;
	@Autowired PanoPage page;
	
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
	
}
