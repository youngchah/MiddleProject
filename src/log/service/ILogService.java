package log.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import log.vo.LogComVO;
import log.vo.LogVO;

public interface ILogService {

	
	// 로그 리스트
	public List<LogVO> selectAllLog();

	public List<LogVO> detailLogList(int logNum);

	
	
	
	// 테스트 
	public List<LogVO> LogList();
	
	
	


/**
	 * 로그 등록
	 * @param logVO
	 * @return
	 */
	public int registerLog(LogVO logVO);

	
	/**
	 * 로그 임시저장
	 * @param logVO
	 * @return
	 */
	public int temporyLog(LogVO logVO);

	public int insertLogComment(LogComVO lcv);

	public List<LogComVO> selectLogComment(int logNum);

	public int deleteLog(LogVO lgv);

	public List<LogVO> searchLog(LogVO lgv);
	
	//여행기록 업데이트 메서드 
	public int updateLog(LogVO logVO);

	//댓글 수 세기
	public int countComment(int logNum);
	
    public int countAllComments(List<LogVO> logList);
    
    //city별 여행기록 리스트 
	public List<LogVO> selectLogByCity(int cityNum);
	
	/**
	 * 회원 본인의 여행기록 리스트
	 * @return
	 */
	public List<LogVO> selectMemberLogList(String memId);

	// 게시물 갯수 
	public int logCount(String memId) throws SQLException;

	
}

