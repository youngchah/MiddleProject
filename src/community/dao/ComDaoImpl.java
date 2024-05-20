package community.dao;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import common.MyBatisDao;
import community.vo.ComVO;
import community.vo.CombineComVO;
import util.MyBatisUtil;

public class ComDaoImpl extends MyBatisDao implements IComDao {

	private static IComDao comDao;

	private ComDaoImpl() {

	}

	public static IComDao getInstance() {
		if (comDao == null) {
			comDao = new ComDaoImpl();
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
	public ComVO getCom(int com_num) {
		
		SqlSession sqlSession = MyBatisUtil.getInstance(true);
		
		ComVO cv = null;
		
		try {
			cv = sqlSession.selectOne("community.getCom", com_num);  
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
	public int deleteCom(int com_num) {
		
		SqlSession sqlSession = MyBatisUtil.getInstance();
		
		int cnt = 0;
		
		try {
			cnt = sqlSession.delete("community.deleteCom", com_num);	//고쳐
			
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

	@Override
	public int fileInsert(CombineComVO chv) {
		
		SqlSession sqlSession= MyBatisUtil.getInstance();
		
		int pass = 0;
		
		try {
			pass = sqlSession.insert("community.insertComPhoto", chv);
			
			
			if(pass > 0) {
				sqlSession.commit();
			}
		}catch(PersistenceException ex) {
			ex.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return pass;
	}

	@Override
	public List<ComVO> selectMyCommuAll(String memId) {
		
		List<ComVO> myCommuList = new ArrayList<ComVO>();

		SqlSession sqlSession = MyBatisUtil.getInstance();

		try {
			myCommuList = sqlSession.selectList("community.selectMyCommuAll", memId);
		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
		return myCommuList;
	}

	@Override
	public int comCount(String memId) {
		return selectOne("community.comCount", memId);
	}

}


















