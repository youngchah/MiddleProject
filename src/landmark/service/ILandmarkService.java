package landmark.service;

import java.util.List;

import landmark.vo.LandmarkVO;

/**
 * 랜드마크 관련 서비스를 위한 인터페이스
 * @author PC-25
 *
 */
public interface ILandmarkService {
	// 접근제한자 반환타입 메소드명(매개변수)
	
	/**
	 * 주요도시 선택 or 도시명 검색 후 도시번호 받아와서 4개 보여주는 페이지 
	 * @return
	 */
	public List<LandmarkVO> selectfour();
	
	
	/**
	 * 4개 보여주는 페이지에서 더보기 or 랜드마크 메뉴 클릭 후 페이지
	 * @return
	 */
	public List<LandmarkVO> selectAll();
	
	/**
	 * 랜드마크 1개 상세페이지
	 * @param cityNum 주요도시 탭에서 선택한 도시명의 도시번호
	 * @return
	 */
	public LandmarkVO selectDetail(LandmarkVO landVo);
	
	
	
	public List<LandmarkVO> selectCityList(int cityNum);
	
}
