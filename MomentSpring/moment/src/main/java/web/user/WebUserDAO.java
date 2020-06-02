package web.user;


import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
@Repository
public class WebUserDAO implements WebUserService {
	@Autowired @Qualifier("moment")private SqlSession sql;
	WebUserVO vo = new WebUserVO();
	
	@Override
	public boolean user_insert(WebUserVO vo) {
		// TODO Auto-generated method stub
			System.out.println(vo.getU_username()+"getUsername");
			System.out.println(vo.getU_userid()+"getUserid");
			System.out.println(vo.getU_usernick()+"getUsernick");
			System.out.println(vo.getU_userpw()+"getUserpw");
		
		return sql.insert("web.user.mapper.insert",vo) > 0 ? true:false;
	}

	@Override
	public WebUserVO user_login(HashMap<String, String> map) {
		// TODO Auto-generated method stub		
		System.out.println(map+"dao");
		return sql.selectOne("web.user.mapper.login", map);
	}
	@Override
	public boolean user_nick_check(String usernick) {
		// TODO Auto-generated method stub
		return (Integer)sql.selectOne("web.user.mapper.nick_check", usernick)==0 ? true: false;
	}

	@Override
	public boolean user_id_check(String userid) {
		// TODO Auto-generated method stub
		return (Integer)sql.selectOne("web.user.mapper.idcheck", userid)==0 ? true : false;
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
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("userid", userid);
		map.put("authKey", authKey);

		sql.selectOne("web.user.mapper.createAuthKey", map);	
	}

	@Override
	public void userAuth(String userid, String authkey) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("userid", userid);
		map.put("authKey", authkey);
		
		sql.update("web.user.mapper.userAuth", map);
	}

	
}
