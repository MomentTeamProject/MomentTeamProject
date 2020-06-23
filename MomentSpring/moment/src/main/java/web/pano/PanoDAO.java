package web.pano;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PanoDAO implements PanoService {
	@Autowired private SqlSession sql;
	
	@Override
	public PanoPage pano_list(PanoPage page) {
		page.setTotalList((Integer)sql.selectOne("pano.mapper.total_list"));
		
		page.setList(sql.selectList("pano.mapper.list", page));
		return page;
	}

}
