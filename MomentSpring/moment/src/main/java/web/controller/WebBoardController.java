package web.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import web.board.WebBoardPage;
import web.board.WebBoardServiceImpl;
import web.board.WebBoardVO;

@Controller
public class WebBoardController {
	
	@Autowired private WebBoardServiceImpl service;
	@Autowired private WebBoardPage page;
	
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
	
}
