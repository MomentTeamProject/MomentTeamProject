package web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WebQnaController {
	
	@RequestMapping("list.qa")
	public String qna() {
		
		return "qna/list";
	}

}
