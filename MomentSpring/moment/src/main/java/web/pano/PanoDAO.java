package web.pano;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import web.board.WebBoardVO;

@Repository
public class PanoDAO implements PanoService {
	@Autowired private SqlSession sql;
	
	@Override
	public PanoPage pano_list(PanoPage page) {
		page.setTotalList((Integer)sql.selectOne("pano.mapper.total_list"));
		
		page.setList(sql.selectList("pano.mapper.list", page));
		return page;
	}

	@Override
	public int pano_insert(WebBoardVO vo) {
		// TODO Auto-generated method stub
		return sql.insert("pano.mapper.insert",vo);
	}

}
