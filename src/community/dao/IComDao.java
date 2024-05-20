package community.dao;

import java.util.List;

import community.vo.ComVO;
import community.vo.CombineComVO;

public interface IComDao {

	/**
	 * 모든 커뮤니티 정보를 조회하는 메서드
	 * @return
	 */
	public List<ComVO> selectAll();

	
	/**
	 * 등록하기 위한 메서드
	 * @param cv
	 * @return
	 */
	public int insertCom(ComVO commuVO);

	/**
	 * 상세정보를 가저오기 위한 메서드
	 * @param com_num
	 * @return
	 */
	public ComVO getCom(int com_num);


	/**
	 * 수정을 하기위한 메서드
	 * @param cv
	 * @return
	 */
	public int updateCom(ComVO cv);

	
	/**
	 * 삭제를 위한 메서드
	 * @param com_num
	 * @return
	 */
	public int deleteCom(int com_num);


	/**
	 * 검색을 위한 메서드
	 * @param cv
	 * @return
	 */
	public List<ComVO> searchCom(String com_title);
	
	/**
	 * 
	 * @param chv
	 * @return
	 */
	public int fileInsert(CombineComVO chv);
	
	
	public List<ComVO> selectMyCommuAll(String memId);


	public int comCount(String memId);
	
}
