package web.pano;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PanoServiceImpl implements PanoService {
	@Autowired PanoDAO dao;
	
	@Override
	public PanoPage pano_list(PanoPage page) {
		return dao.pano_list(page);
	}
	
	
	
}
