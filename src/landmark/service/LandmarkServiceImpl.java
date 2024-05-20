package landmark.service;

import java.util.List;

import landmark.dao.ILandmarkDao;
import landmark.dao.LandmarkDaoImpl;
import landmark.vo.LandmarkVO;

public class LandmarkServiceImpl implements ILandmarkService{

	//인터페이스 기반 객체변수 선언
	private static ILandmarkService landSer;
	
	private ILandmarkDao landDao;
	
	public static ILandmarkService getInstance() {
		if(landSer == null) {
			landSer = new LandmarkServiceImpl();
		}
		return landSer;
	}
	
	public LandmarkServiceImpl() {
		landDao = LandmarkDaoImpl.getInstance();
	}
	
	
	@Override
	public List<LandmarkVO> selectfour() {
		List<LandmarkVO> landList = landDao.selectfour();
		return landList;
	}

	@Override
	public List<LandmarkVO> selectAll() {
		System.out.println("landmarkserall");
		
		List<LandmarkVO> landList = landDao.selectAll();
		
//		System.out.println("시스템에서 landList!"+landList);
		return landList;
	}

	@Override
	public LandmarkVO selectDetail(LandmarkVO landVo) {
		LandmarkVO lv = landDao.selectDetail(landVo);
		return lv;
	}
	
	@Override
	public List<LandmarkVO> selectCityList(int cityNum) {
		System.out.println("landmarkserall");
		
		List<LandmarkVO> landList = landDao.selectCityList(cityNum);
		
//		System.out.println("시스템에서 landList!"+landList);
		return landList;
	}

	

}
