package web.controller;


import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import web.email.CommonService;
import web.user.WebUserServiceImpl;
import web.user.WebUserVO;

@Controller
public class WebUserController {
	@Autowired private WebUserServiceImpl service;
	@Autowired private CommonService common;
	
	//이메일 인증 처리
	@RequestMapping(value = "/user/useremailConfirm", method = RequestMethod.GET)
	public String emailConfirm(@RequestParam("userid")String userid, @RequestParam("key")String authkey) throws Exception { // 이메일 인증 확인창
			service.userAuth(userid, authkey);
			
			return "user/emailconfirm"; // emailConfirm.jsp
	}
	
	//회원가입 처리
		@ResponseBody@RequestMapping(value="/userjoin", produces="text/html; charset=utf-8")
		public String join(WebUserVO vo, HttpServletRequest request, HttpSession session) throws Exception {
			String msg = "<script>";
//			String key = new TempKey().getKey(50, false); // 인증키 생성

			if(service.user_insert(vo)) {
				System.out.println(vo.getU_username()+"getUsername");

				//축하 이메일 전송
//				service.createAuthKey(vo.getUserid(), key);
				common.sendHtml(vo, session);
//				common.sendemail(vo.getEmail(), vo.getName(), session);
				msg+= "alert('회원가입 성공 감사 '); location='" + request.getContextPath() +"'";
			}else {
				msg+= "alert('회원가입 실패 ㅠㅠ'); history.go(-1); ";
			}
			msg+= "</script>";


			return msg;
		}
	
	
	//닉네임 중복체크
	@ResponseBody@RequestMapping("/usernick_check")
	public boolean usernick_check(String usernick) {
		System.out.println( "진입nick-------------");
		return service.user_nick_check(usernick);
	}
	//아이디 중복체크
	@ResponseBody@RequestMapping("/userid_check")
	public boolean userid_check(String userid) {
		System.out.println( "진입id-------------");
		return service.user_id_check(userid);
	}
	
	//회원가입 화면 요청
	@RequestMapping("/joinuser")
	public String user(HttpSession session) {
		return "user/join";
	}
	//로그인 화면 요청
	@RequestMapping("/loginuser")
	public String userlogin(HttpSession session) {
		return "user/login";
	}
	
	//로그아웃
		@ResponseBody @RequestMapping("/userlogout")
		public void logout(HttpSession session) {
			session.removeAttribute("login_info");
		}
		
	//로그인
	@ResponseBody @RequestMapping("/userlogin")
	public boolean login(String userid, String userpw, HttpSession session) {
		//DB에서 입력한 아이디/ 비밀번호가 일치하는 회원 정보가 조회한 후 
		
		HashMap<String, String>map = new HashMap<String, String>();
		map.put("userid", userid);
		map.put("userpw", userpw);
		System.out.println(userid+"controller");
		System.out.println(map);
		WebUserVO vo  = service.user_login(map);
		System.out.println(vo.toString());
		if(vo != null) {
			if(vo.getU_admin().equals("N")) {
				vo = null;
				return false;
			}else {
				//세션에 로그인한 회원 정보를 담는다.
				session.setAttribute("login_info", vo);
				return true;
			}
		} else return false;
//		// 회원존재여부를 반환
//		return vo == null ? false: true;
	}
}
