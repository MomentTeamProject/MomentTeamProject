package web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import web.board.WebBoardPage;
import web.board.WebBoardServiceImpl;

@Controller
public class WebBoardController {
	
	@Autowired private WebBoardServiceImpl service;
	@Autowired private WebBoardPage page;
	
	@RequestMapping("/list.bo")
	public String board(Model model, HttpSession session, String search, String keyword, @RequestParam(defaultValue = "1") int curPage, @RequestParam(defaultValue = "10") int pageList, @RequestParam(defaultValue = "list") String viewType) {
		System.out.println("======== 사진 카테고리 이동 ========");
		session.setAttribute("category", "bo");
		
		page.setCurPage(curPage);
		page.setSearch(search);
		page.setKeyword(keyword);
		page.setPageList(pageList);
		page.setViewType(viewType);
		
		model.addAttribute( "page", service.board_list(page) );
		System.out.println(page.getList());
		return "pictures/list";
	}
	
}
