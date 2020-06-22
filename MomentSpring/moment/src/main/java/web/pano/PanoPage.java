package web.pano;

import java.util.List;

import android.board.BoardVO;
import web.common.PageVO;

public class PanoPage extends PageVO {
	private List<BoardVO> list;
	public List<BoardVO> getList() {
		return list;
	}

	public void setList(List<BoardVO> list) {
		this.list = list;
	}
	
}
