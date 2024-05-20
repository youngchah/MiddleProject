package landmark.dao;

import java.util.List;

import landmark.vo.LandmarkVO;

public interface ILandmarkDao {
	
	/**
	 * 주요도시 선택 or 도시명 검색 후 도시번호 받아와서 4개 보여주는 페이지 
	 * @return
	 */
	public List<LandmarkVO> selectfour();
	
	
	/**
	 * 4개 보여주는 페이지에서 더보기 or 여행장소 메뉴 클릭 후 전체 리스트 페이지
	 * @return
	 */
	public List<LandmarkVO> selectAll();
	
	
	
	
	//신하림 코드
	public List<LandmarkVO> selectCityList(int cityNum);
	
	
	/**
	 * 랜드마크 1개 상세페이지
	 * @param cityNum 주요도시 탭에서 선택한 도시명의 도시번호
	 * @return
	 */
	public LandmarkVO selectDetail(LandmarkVO landVo);
	
}
