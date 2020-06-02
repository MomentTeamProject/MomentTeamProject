package web.user;

import java.util.HashMap;

public interface WebUserService {

	
	boolean user_insert(WebUserVO vo);
	WebUserVO user_login(HashMap<String, String> map);
	boolean user_id_check(String userid);
	boolean user_nick_check(String usernick);
	boolean user_update(WebUserVO vo);
	boolean user_delete(String userid);
	void createAuthKey(String userid, String authKey)throws Exception;
	void userAuth(String userid, String authKey)throws Exception;
}
