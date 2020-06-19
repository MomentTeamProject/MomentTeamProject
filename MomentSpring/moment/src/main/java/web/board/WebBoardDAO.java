package web.board;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class WebBoardDAO implements WebBoardService {

	@Autowired private SqlSession sql; 
	
	@Override
	public int board_insert(WebBoardVO vo) {
		// TODO Auto-generated method stub
		return sql.insert("webBoard.mapper.insert", vo);
	}

	@Override
	public WebBoardPage board_list(WebBoardPage page) {
		page.setTotalList( sql.selectOne("webBoard.mapper.total", page) );
		page.setList( sql.selectList("webBoard.mapper.list", page));
		return page;
	}

	@Override
	public WebBoardVO board_detail(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int board_read(int id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int board_update(WebBoardVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int board_delete(int id) {
		// TODO Auto-generated method stub
		return 0;
	}

}
