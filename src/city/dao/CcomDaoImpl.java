package city.dao;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import community.vo.ComVO;
import util.MyBatisUtil;

public class CcomDaoImpl implements ICcomDao {

	private static ICcomDao comDao;

	private CcomDaoImpl() {

	}

	public static ICcomDao getInstance() {
		if (comDao == null) {
			comDao = new CcomDaoImpl();
		}
		return comDao;
	}

	@Override
	public List<ComVO> selectAll() {
		List<ComVO> comList = new ArrayList<ComVO>();

		SqlSession sqlSession = MyBatisUtil.getInstance();

		try {
			comList = sqlSession.selectList("community.selectAll");
		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
		return comList;
	}

	@Override
	public int insertCom(ComVO cv) {
		
		SqlSession sqlSession = MyBatisUtil.getInstance();
		
		int cnt = 0;
		
		//System.out.println("asdasdasdasdasd" + cnt);
		
		try {
			cnt = sqlSession.insert("community.insertCom", cv);	
			
			if(cnt > 0) {
				sqlSession.commit();
			}
		}catch(PersistenceException ex) {
			sqlSession.rollback();
			ex.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return cnt;
	}

	@Override
	public ComVO getCom(String com_title) {
		
		SqlSession sqlSession = MyBatisUtil.getInstance(true);
		
		ComVO cv = null;
		
		try {
			cv = sqlSession.selectOne("community.getCom", com_title);  
		}catch(PersistenceException ex) {
			ex.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		//System.out.println("dao " + cv);
		
		return cv;
	}

	@Override
	public int updateCom(ComVO cv) {
		
		SqlSession sqlSession = MyBatisUtil.getInstance();
		
		int cnt = 0;
		
		try {
			cnt = sqlSession.update("community.updateCom", cv);		//고쳐!
			
			if(cnt > 0) {
				sqlSession.commit();
			}
		}catch(PersistenceException ex) {
			ex.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return cnt;
	}

	@Override
	public int deleteCom(String com_title) {
		
		SqlSession sqlSession = MyBatisUtil.getInstance();
		
		int cnt = 0;
		
		try {
			cnt = sqlSession.delete("community.deleteCom", com_title);	//고쳐
			
			if(cnt > 0) {
				sqlSession.commit();
			}
		}catch(PersistenceException ex) {
			ex.printStackTrace();
		}finally {
			sqlSession.close();
		}
		// System.out.println("dao " + cnt);
		return cnt;
	}

	@Override
	public List<ComVO> searchCom(String com_title) {
		
		List<ComVO> comList = new ArrayList<ComVO>();
		System.out.println("dao" + comList);
		
		SqlSession sqlSession = MyBatisUtil.getInstance();
		
		try {
			comList = sqlSession.selectList("community.searchCom", com_title);
			
		}catch(PersistenceException ex) {
			ex.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return comList;
	}

}


















