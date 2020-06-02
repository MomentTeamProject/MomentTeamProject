package web.user;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class WebUserServiceImpl implements WebUserService {
	@Autowired private WebUserDAO dao;
	
	@Override
	public boolean user_insert(WebUserVO vo) {
		// TODO Auto-generated method stub
		return dao.user_insert(vo);
	}

	@Override
	public WebUserVO user_login(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return dao.user_login(map);
	}
	@Override
	public boolean user_nick_check(String usernick) {
		// TODO Auto-generated method stub
		return dao.user_nick_check(usernick);
	}

	@Override
	public boolean user_id_check(String userid) {
		// TODO Auto-generated method stub
		return dao.user_id_check(userid);
	}

	@Override
	public boolean user_update(WebUserVO vo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean user_delete(String userid) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void createAuthKey(String userid, String authKey) throws Exception {
		// TODO Auto-generated method stub
		dao.createAuthKey(userid, authKey);
	}

	@Override
	public void userAuth(String userid, String authKey) throws Exception {
		// TODO Auto-generated method stub
		dao.userAuth(userid, authKey);
	}

}
