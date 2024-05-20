package city.dao;

import java.util.List;

import city.vo.AllVO;
import city.vo.MCityVO;
import city.vo.MComVO;
import city.vo.MLandVO;
import city.vo.MPlanVO;

public interface IMainDao {
	
	public List<MCityVO> getcitynum();
	
	/**
	 * 주요도시 홈에 도시 이름
	 * @param city_name
	 * @return
	 */
	public List<MCityVO> getcity(int city_num);
	
	/**
	 * 주요도시 홈에 여행 일정
	 * @param city_name
	 * @return
	 */
	public List<MPlanVO> getplan(int city_num);
	
	/**
	 * 주요도시 홈에 랜드마크
	 * @param city_name
	 * @return
	 */
	public List<MLandVO> getLand(int city_num);

	/**
	 * 주요도시 홈에 커뮤니티
	 * @param city_name
	 * @return
	 */
	public List<MComVO> getCom(int city_num);

	
	public List<AllVO> alllist(int city_num);

	

	

	

	

}
