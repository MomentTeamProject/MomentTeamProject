package android.common;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import android.board.BoardVO;

public class Common {
	public static final String IMAGE_FILE_SAVE_PATH = "C:\\Users\\SEC\\Desktop\\TeamProject\\MomentTeamProject\\MomentSpring\\moment\\src\\main\\webapp\\resources\\uploadFile";
	public static final String IMAGE_FILE_PATH = "http://192.168.0.128:80/moment/img/background/";
	public static final String PROFILE_IMG_SAVE_PATH = "D:\\Study_Android\\androidServlet\\moment\\WebContent\\images\\profileimg";
	public static final String PROFILE_IMG_PATH = "http://192.168.0.128:80/moment/img/profileimg/";
	public static final String IMAGE_PATH_BACKGROUND_128 = "C:\\Users\\SEC\\Desktop\\TeamProject\\MomentTeamProject\\MomentSpring\\moment\\src\\main\\webapp\\resources\\image\\background\\";
	
	
	//쿼리조회 후 list 반환값을 jsonArray로 파싱
	public static JSONArray boardListParser(List<BoardVO> list) {
		JSONArray datas = new JSONArray();
		JSONObject data = null;
		for(BoardVO dto : list) {
			data = new JSONObject();
			data.put("b_no", dto.getB_no());
			data.put("b_title", dto.getB_title());
			data.put("b_userid", dto.getB_userid());
			data.put("b_coment", dto.getB_coment());
			data.put("b_local", dto.getB_local());
			data.put("b_ddabong", dto.getB_ddabong());
			data.put("b_tag", dto.getB_tag());
			data.put("b_readcnt", dto.getB_readcnt());
			data.put("b_writedate", dto.getB_writedate());
			data.put("b_latitude", dto.getB_latitude());
			data.put("b_longitude", dto.getB_longitude());
			data.put("b_nick", dto.getB_nick());
			data.put("b_imgpath", Common.IMAGE_FILE_PATH+dto.getB_imgpath());
			data.put("b_profileimg", Common.PROFILE_IMG_PATH+dto.getB_profileimg());
			datas.add(data);
			
			System.out.println(data.toString());
		}
		return datas;
	}
}
