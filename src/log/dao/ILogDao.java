package log.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import log.vo.LogComVO;
import log.vo.LogVO;

public interface ILogDao {

	
	//로그 리스트 
	public List<LogVO> selectAllLog() throws SQLException;

	public List<LogVO> detailLogList(int logNum) throws SQLException;

	
	//테스트 
	public List<LogVO> LogList() throws SQLException;
	
	/**
	 * 여행기록 등록
	 * @param lgVO
	 * @return
	 */
	public int registerLog(LogVO lgVO);

	
	/**
	 * 여행기록 임시저장
	 * @param logVO
	 * @return
	 */
	public int temporyLog(LogVO logVO);

	public int insertLogComment(LogComVO lcv);

	public List<LogComVO> selectLogComment(int logNum) throws SQLException;

	public int deleteLog(LogVO lgv) throws SQLException;

	public List<LogVO> searchLog(LogVO lgv);

	/**
	 * 여행기록 업데이트 메서드
	 * @param logVO
	 * @return
	 */
	public int updateLog(LogVO logVO);

	public int countComment(int logNum) throws SQLException;

	public List<LogVO> selectLogByCity(int cityNum);
	
	/**
	 * 회원 본인의 여행기록 리스트
	 * @return
	 */
	public List<LogVO> selectMemberLogList(String memId);

	
	// 여행기록 카운트
	public int logCount(String memId);
	
	
}
