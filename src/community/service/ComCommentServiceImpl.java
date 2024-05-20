package community.service;

import community.dao.ComCommentDaoImpl;
import community.dao.IComCommentDao;
import community.vo.ComCommentVO;

public class ComCommentServiceImpl implements IComCommentService{

	private static IComCommentService comCommentService;
	
	private IComCommentDao comCommentDao;
	
	private ComCommentServiceImpl() {
		comCommentDao = ComCommentDaoImpl.getInstance();
	}
	
	public static IComCommentService getInstance() {
		if(comCommentService == null) {
			comCommentService = new ComCommentServiceImpl();
		}
		return comCommentService;
	}

	@Override
	public int registComComment(ComCommentVO ccv) {
		int cnt = comCommentDao.insertComComment(ccv);
		return cnt;
	}
	
}
