package web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import web.myPage.MyPageServiceImpl;
import web.myPage.Page;

@Controller
public class myPageController {
	
	@Autowired private MyPageServiceImpl service;
	@Autowired private Page page;
	
		

	//내가 쓴 게시물 리스트  
	@RequestMapping("/mypostlist.moment")
	public String mylist(@RequestParam(defaultValue = "1") int curPage,	String userid,  Model model,HttpSession session) {

		String userid1 = "zxc@naver.com";
		//session.getAttribute(userid);
		page.setUserid(userid1);
		page.setCurPage(curPage);		
		model.addAttribute("page",service.myList(page));		
		return "/myPage/mypostlist";
		
	}

	
	//좋아요 게시판
	@RequestMapping("/myddabong.moment")
	public String myDdabong(@RequestParam(defaultValue="1") int curPage, String userid, Model model, HttpSession session) {
		
		userid = "admin@gmail.com";
		//session.getAttribute(userid);
		page.setUserid(userid);
		page.setCurPage(curPage);		
		model.addAttribute("page", service.myDdabong(page));	
	
		return "/myPage/myddabonglist";		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	//내가 쓴 게시글 삭제
	@ResponseBody	
	@RequestMapping(value = "/delete.moment" , method = RequestMethod.POST)	
	public String mylistdelete(@RequestParam(value = "ckbox[]") List<String> chArr){
		
		for(String i : chArr) {   
			   int id  = Integer.parseInt(i);	
			   service.myList_delete(id);
		}   		
		
		return "redirect:mylist.moment";
	}
	
	
	
	
	
	//내가 쓴 게시물 상세화면 연결
	@RequestMapping("/mylist_detail.moment")
	public String myliSst_detail(@RequestParam int id) {
	
		return "/myList/detail";
	}
	
	
	//즐겨찾기 게시판 리스트 화면
	@RequestMapping("/myfavorite.moment")
	public String myFavorite(String userid, Model model, HttpSession session) {
		userid = "admin@gmail.com";
		session.getAttribute(userid);
		model.addAttribute("list", service.myFavorite(userid));	
	
		return "/myPage/myfavoritelist";		
	}
	
	

	
	
	
	
	
	
	
}
