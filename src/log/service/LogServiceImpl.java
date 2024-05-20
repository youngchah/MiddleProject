package log.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import log.dao.ILogDao;
import log.dao.LogDaoImpl;
import log.vo.LogComVO;
import log.vo.LogVO;

public class LogServiceImpl implements ILogService{
	
	private ILogDao logDao;
	private static ILogService logService;
	//1
	private LogServiceImpl() {
		logDao = LogDaoImpl.getInstance();
	}
	//2
	public static ILogService getInstance() {
		if(logService == null) logService = new LogServiceImpl();
		return logService;
	}
	
	
	
	//로그리스트
	@Override
	public List<LogVO> selectAllLog(){
		List<LogVO> logList = null;

		try {
			logList = logDao.selectAllLog();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		
		return logList;
		
	}
	@Override
	public List<LogVO> detailLogList(int logNum) {
		List<LogVO> logDetailList = null;
		
		try {
			logDetailList=logDao.detailLogList(logNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return logDetailList;
	}
	
	//테스트 ///////////
	@Override
	public List<LogVO> LogList() {
		
		List<LogVO> loglist = null;
		
		try {
			loglist=logDao.LogList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return loglist;
	}
	
	/**
	 * 여행기록 등록
	 */
	@Override
	public int registerLog(LogVO logVO) {
		int cnt = logDao.registerLog(logVO);
		return cnt;
	}
	@Override
	public int insertLogComment(LogComVO lcv) {
		int cnt = logDao.insertLogComment(lcv);
		return cnt;
	}
	@Override
	public List<LogComVO> selectLogComment(int logNum) {
		List<LogComVO> LogComList = null;
		
		try {
			LogComList=logDao.selectLogComment(logNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return LogComList;
		
		
	}
	@Override
	public int deleteLog(LogVO lgv) {
		
		int cnt = 0;
		try {
			cnt = logDao.deleteLog(lgv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	@Override
	public List<LogVO> searchLog(LogVO lgv) {
		List<LogVO> searchList = null;
		
		searchList=logDao.searchLog(lgv);
		
		return searchList;
	}
	
	
	/**
	 * 여행기록 임시저장
	 */
	@Override
	public int temporyLog(LogVO logVO) {
		int cnt = logDao.temporyLog(logVO);
		return cnt;
	}
	@Override
	public int updateLog(LogVO logVO) {
		
		int cnt = logDao.updateLog(logVO);
		return cnt;
		
	}
	//댓글 수 세기 메서드
	@Override
	public int countComment(int logNum) {
		
		int cnt = 0;
		try {
			cnt = logDao.countComment(logNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	//게시글마다..댓글조회..
	@Override
	public int countAllComments(List<LogVO> logList) {
		int totalCount = 0;
		for (LogVO log : logList) {
	        int logNum = log.getLogNum();
	        int count = 0;
			try {
				count = logDao.countComment(logNum);
			} catch (SQLException e) {
				e.printStackTrace();
			}
	        totalCount += count;
	    }
		return totalCount;
	}
	@Override
	public List<LogVO> selectLogByCity(int cityNum) {
		
		List<LogVO> CityLogList = null;
		
		CityLogList=logDao.selectLogByCity(cityNum);
		
		return CityLogList;
		
	}
	@Override
	public List<LogVO> selectMemberLogList(String memId) {
		List<LogVO> memberLogList = null;
		
		memberLogList = logDao.selectMemberLogList(memId);
		
		
		
		return memberLogList;
		
	}
	
	
	@Override
	public int logCount(String memId) throws SQLException {
		
		int cnt = 0;
		cnt = logDao.logCount(memId);
		return cnt;
	}
	
	
	
}
