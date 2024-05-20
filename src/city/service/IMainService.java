package city.service;

import java.util.List;

import city.vo.AllVO;
import city.vo.MCityVO;
import city.vo.MComVO;
import city.vo.MLandVO;
import city.vo.MPlanVO;

public interface IMainService {
	
	public List<MCityVO> getcitynum();
	
	/**
	 * 주요도시 홈에 도시 이름
	 * @param city_num
	 * @return
	 */
	public List<MCityVO> getlistcity(int city_num);
	
	/**
	 * 주요도시 홈에 여행 일정
	 * @param city_name
	 * @return
	 */
	public List<MPlanVO> getlistPlan(int city_num);
	
	/**
	 * 주요도시 홈에 랜드마크
	 * @param city_name
	 * @return
	 */
	public List<MLandVO> getlistLand(int city_num);

	/**
	 * 주요도시 홈에 커뮤니티
	 * @param city_name
	 * @return
	 */
	public List<MComVO> getlistCom(int city_num);

	/**
	 * 검색 시 
	 * @param city_num
	 * @return
	 */
	public List<AllVO> allList(int city_num);

	

	


	



}
