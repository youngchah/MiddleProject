package community.dao;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import community.vo.ComCommentVO;
import util.MyBatisUtil;

public class ComCommentDaoImpl implements IComCommentDao{
	
	private static IComCommentDao comCommentDao;
	
	private ComCommentDaoImpl() {
		
	}
	
	public static IComCommentDao getInstance() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertComComment(ComCommentVO ccv) {
		
		SqlSession sqlSession = MyBatisUtil.getInstance();
		
		int cnt = 0;
		
		try {
			cnt = sqlSession.insert("community.detail", ccv);
			
			if(cnt > 0) {
				sqlSession.close();
			}
		}catch(PersistenceException ex) {
			ex.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return cnt;
	}
	

}
