package web.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import web.util.FileUpload;


/**
 * Handles requests for the application home page.
 */


@Controller
public class HomeController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, HttpSession session) {
		session.setAttribute("category", "home");
		return "home";
	}
	
	@ResponseBody @RequestMapping("/iotData")
	public String file_upload1(HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("라즈베리 파이  사진파일 전송 완료");
		try {
			FileUpload.upload(request, response);
			System.out.println("파일 전송 완료");
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return "ok";
	}
	
}
