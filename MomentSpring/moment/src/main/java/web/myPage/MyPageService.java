package web.myPage;

import java.util.List;


public interface MyPageService {

	
	//내가 쓴글 리스트 
	Page myList(Page page);
	
	//내가 쓴글 상세보기 
	MyPageVO myList_detail(int id);	
	
	//내가 쓴글 삭제
	void myList_delete(int id);
		
	//즐겨 찾기 리스트 	
	List<MyPageVO> myFavorite(String userid);
	
	//좋아요한 리스트
	Page myDdabong(Page page);
		
	
}
