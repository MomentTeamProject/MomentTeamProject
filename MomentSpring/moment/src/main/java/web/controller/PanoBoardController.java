package web.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import web.common.Common;
import web.pano.PanoPage;
import web.pano.PanoServiceImpl;

@Controller
public class PanoBoardController {
	@Autowired PanoServiceImpl service;
	@Autowired PanoPage page;
	
	//안드로이드 리스트 뿌리는 작업
	@ResponseBody @RequestMapping("/panoAndroidList.pa")
	public JSONArray panoPhotoList() {
		JSONArray list = service.pano_android_list();
		return list;
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
	
	//안드로이드에서 파노라마 글 작성시
	@ResponseBody @RequestMapping(value = "/PanoWrite.mo", produces = "application/json; charset=UTF-8")
	public JSONObject panoWrite(@RequestBody HashMap<String, Object> params) {
		System.out.println("PanoWrite 받은 데이터 : "+params.get("b_local"));
		JSONObject result = service.pano_write(params);
		return result;
	}
	
	//iot 파일 업로드
	@ResponseBody @RequestMapping("/iotData")
	public String file_upload(MultipartHttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("라즈베리 파이  사진파일 전송");
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} 

		String userid = request.getParameter("userid");
		MultipartFile file = request.getFile("image");
		
		if(file != null) {
			String fileName = file.getOriginalFilename();
			System.out.println(fileName);
			
			if(file.getSize() > 0){			
				System.out.println( "fileSize : " + file.getSize());					
												
			 	try {
			 		// 이미지파일 저장
					file.transferTo(new File(Common.IMAGE_PATH_BACKGROUND + fileName));
					System.out.println("사진파일 저장 완료");
					
					//DB에 정보 저장
					service.pano_fileUpload(userid, fileName);
				} catch (Exception e) {
					e.printStackTrace();
				} 
									
			}else{
				// 이미지파일 실패시
				System.out.println("라즈베리파이 이미지 업로드 실패");
			}			
		}
		return "ok";
	}
	
}
