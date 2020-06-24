package web.pano;

import web.board.WebBoardVO;

public interface PanoService {
	PanoPage pano_list(PanoPage page);
	
	int pano_insert( WebBoardVO vo );			//파노라마 글 저장
}
