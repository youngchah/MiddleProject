package log.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import common.MyBatisDao;
import log.vo.LogComVO;
import log.vo.LogVO;
import util.MyBatisUtil;

public class LogDaoImpl extends MyBatisDao implements ILogDao {

	//싱글톤
	private static ILogDao logDao;
	
	public LogDaoImpl() {}
	
	
	public static ILogDao getInstance() {
		if (logDao == null)
			logDao = new LogDaoImpl();
		
		return logDao;
	}


	@Override
	public List<LogVO> selectAllLog() throws SQLException {
		
		return selectList("log.selectAllLog");
	}


	@Override
	public List<LogVO> detailLogList(int logNum) throws SQLException {
		
		return selectList("log.detailLogList", logNum);
	}


	
	@Override
	public List<LogVO> LogList() throws SQLException {
		
		return selectList("log.LogList");
	}
	
		@Override
	public int registerLog(LogVO logVO) {
		SqlSession sqlSession = MyBatisUtil.getInstance();
		
		int cnt = 0;
		
		try {
			cnt = sqlSession.insert("log.registerLog", logVO);
			
			if(cnt>0) {
				sqlSession.commit();
			}
			
		} catch (PersistenceException e) {
			sqlSession.rollback();
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return cnt;
	}


	/**
	 * 여행기록 임시저장
	 */
	@Override
	public int temporyLog(LogVO logVO) {
		SqlSession sqlSession = MyBatisUtil.getInstance();
		
		int cnt = 0;
		
		try {
			cnt = sqlSession.insert("log.temporyLog", logVO);
			
			if(cnt>0) {
				sqlSession.commit();
			}
			
		} catch (PersistenceException e) {
			sqlSession.rollback();
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return cnt;
	}


		@Override
		public int insertLogComment(LogComVO lcv) {
			
			
			return insert("log.insertLogComment", lcv);
		}


		@Override
		public List<LogComVO> selectLogComment(int logNum) {
			
			
			return selectList("log.selectLogComment", logNum);
		}


		@Override
		public int deleteLog(LogVO lgv) throws SQLException {
			
			return delete("log.deleteLog", lgv);
		}


		@Override
		public List<LogVO> searchLog(LogVO lgv) {
			
			
			return selectList("log.searchLog", lgv);
		}


		@Override
		public int updateLog(LogVO logVO) {
			
			return update("log.updateLog", logVO);
		}


		@Override
		public int countComment(int logNum) throws SQLException{
			
			return selectOne("log.countComment", logNum);
		}


		@Override
		public List<LogVO> selectLogByCity(int cityNum) {
			
			return selectList("log.selectLogByCity", cityNum);
		}


		@Override
		public List<LogVO> selectMemberLogList(String memId) {
			return selectList("log.selectMemberLogList", memId);
		}


		@Override
		public int logCount(String memId) {
			// TODO Auto-generated method stub
			return selectOne("log.logCount", memId);
		}
	
	
}
