package web.pano;

import java.util.HashMap;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;


public interface PanoService {
	PanoPage pano_list(PanoPage page);
	void pano_fileUpload(String userid, String imgpath);
	JSONObject pano_write(HashMap<String, Object> param);
	JSONArray pano_android_list();
}
