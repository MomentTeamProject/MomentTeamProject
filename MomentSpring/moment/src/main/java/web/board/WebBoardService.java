package web.board;


public interface WebBoardService {
	
		//CRUD
		int board_insert( WebBoardVO vo );			//방명록 글 저장
		
		WebBoardPage board_list( WebBoardPage page );	//방명록 페이지목록 조회
		
		WebBoardVO board_detail( int id );			//방명록 상세조회
		
		int board_read( int id );				//방명록 조회 카운트
		
		int board_update( WebBoardVO vo );			//방명록 수정
		
		int board_delete( int id );				//방명록 삭제
}
