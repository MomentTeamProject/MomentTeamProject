package web.pano;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.board.WebBoardVO;

@Service
public class PanoServiceImpl implements PanoService {
	@Autowired PanoDAO dao;
	
	@Override
	public PanoPage pano_list(PanoPage page) {
		return dao.pano_list(page);
	}

	@Override
	public int pano_insert(WebBoardVO vo) {
		// TODO Auto-generated method stub
		return dao.pano_insert(vo);
	}
	
	
	
}
