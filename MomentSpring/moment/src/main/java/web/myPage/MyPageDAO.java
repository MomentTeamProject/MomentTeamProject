package web.myPage;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyPageDAO implements MyPageService {

	@Autowired private SqlSession sql;


	@Override
	public Page myList(Page page) {

		page.setTotalList((Integer)sql.selectOne("mypage.mapper.total", page));		
		page.setList(sql.selectList("mypage.mapper.mylist",page));
		return page;
	}


	@Override
	public Page myDdabong(Page page) {
		page.setTotalList((Integer)sql.selectOne("mypage.mapper.ddabongtotal", page));	
		System.out.println(page.getTotalList());
		page.setList(sql.selectList("mypage.mapper.myddabong",page));
		return page;
	}



	@Override
	public MyPageVO myList_detail(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void myList_delete(int id) {
		sql.delete("mypage.mapper.mylistdelete", id);
		
	}

	@Override
	public List<MyPageVO> myFavorite(String userid) {
		
		return sql.selectList("mypage.mapper.myfavorite", userid);
		
	}





}
