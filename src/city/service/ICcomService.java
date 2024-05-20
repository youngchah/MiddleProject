package city.service;

import java.util.List;

import community.vo.ComVO;
import community.vo.CombineComVO;

public interface ICcomService {
	
	/**
	 * 모든 커뮤니티 정보를 조회하는 메서드
	 * @return
	 */
	public List<ComVO> displayAllCom();
	
	/**
	 * 커뮤니티 등록을 위한 메서드
	 * @param cv
	 * @return
	 */
	public int registCom(CombineComVO cv);

	/**
	 * 커뮤니티 상세정보를 가져오기 위한 메서드
	 * @param com_num
	 * @return
	 */
	public ComVO getCom(int com_num);

	/**
	 * 커뮤니티 수정을 위한 메서드
	 * @param cv
	 * @return
	 */
	public int modifyCom(ComVO cv);

	/**
	 * 커뮤니티 삭제를 위한 메서드
	 * @param com_num
	 * @return
	 */
	public int removeCom(int com_num);
	
	/**
	 * 검색을 위한 메서드
	 * @param cv
	 * @return
	 */
	public List<ComVO> searchCom(String com_title);
	
	
	

}
