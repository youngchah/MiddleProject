package city.dao;

import java.util.List;

import community.vo.ComVO;

public interface ICcomDao {

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
	public int insertCom(ComVO cv);

	/**
	 * 상세정보를 가저오기 위한 메서드
	 * @param com_num
	 * @return
	 */
	public ComVO getCom(String com_title);


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
	public int deleteCom(String com_title);


	/**
	 * 검색을 위한 메서드
	 * @param cv
	 * @return
	 */
	public List<ComVO> searchCom(String com_title);
}
