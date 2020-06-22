package web.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WebBoardServiceImpl implements WebBoardService {

	@Autowired private WebBoardDAO dao;
	
	@Override
	public int board_insert(WebBoardVO vo) {
		// TODO Auto-generated method stub
		return dao.board_insert(vo);
	}

	@Override
	public WebBoardPage board_list(WebBoardPage page) {
		return dao.board_list(page);
	}

	@Override
	public WebBoardVO board_detail(int id) {
		return dao.board_detail(id);
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
