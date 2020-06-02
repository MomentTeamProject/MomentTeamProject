package web.myPage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MyPageServiceImpl implements MyPageService {

	@Autowired private MyPageDAO dao;
	
	@Override
	public Page myList(Page page) {
		// TODO Auto-generated method stub
		return dao.myList(page);
	}
	


	@Override
	public MyPageVO myList_detail(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void myList_delete(int id) {
		dao.myList_delete(id);
		
	}

	@Override
	public List<MyPageVO> myFavorite(String userid) {
		// TODO Auto-generated method stub
		return dao.myFavorite(userid);
	}



	@Override
	public Page myDdabong(Page page) {
		// TODO Auto-generated method stub
		return dao.myDdabong(page);
	}





}
