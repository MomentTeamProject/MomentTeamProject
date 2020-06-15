package web.user;

import org.springframework.stereotype.Repository;

@Repository
public class WebUserVO {
	private String u_userid, u_userpw, u_name, u_nick, u_local, u_profileimg,u_admin, u_authkey;

	public String getU_userid() {
		return u_userid;
	}

	public void setU_userid(String u_userid) {
		this.u_userid = u_userid;
	}

	public String getU_userpw() {
		return u_userpw;
	}

	public void setU_userpw(String u_userpw) {
		this.u_userpw = u_userpw;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public String getU_nick() {
		return u_nick;
	}

	public void setU_nick(String u_nick) {
		this.u_nick = u_nick;
	}

	public String getU_local() {
		return u_local;
	}

	public void setU_local(String u_local) {
		this.u_local = u_local;
	}

	public String getU_profileimg() {
		return u_profileimg;
	}

	public void setU_profileimg(String u_profileimg) {
		this.u_profileimg = u_profileimg;
	}

	public String getU_admin() {
		return u_admin;
	}

	public void setU_admin(String u_admin) {
		this.u_admin = u_admin;
	}

	public String getU_authkey() {
		return u_authkey;
	}

	public void setU_authkey(String u_authkey) {
		this.u_authkey = u_authkey;
	}

	@Override
	public String toString() {
		return "WebUserVO [u_userid=" + u_userid + ", u_userpw=" + u_userpw + ", u_name=" + u_name + ", u_nick="
				+ u_nick + ", u_local=" + u_local + ", u_profileimg=" + u_profileimg + ", u_admin=" + u_admin
				+ ", u_authkey=" + u_authkey + "]";
	}

	

	
}
