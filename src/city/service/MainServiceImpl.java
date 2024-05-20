package city.service;

import java.util.List;

import city.dao.IMainDao;
import city.dao.MainDaoImpl;
import city.vo.AllVO;
import city.vo.MCityVO;
import city.vo.MComVO;
import city.vo.MLandVO;
import city.vo.MPlanVO;

public class MainServiceImpl  implements IMainService{
	
	private static IMainService mainService;
	
	private IMainDao mainDao;
	
	private MainServiceImpl() {
		mainDao = MainDaoImpl.getInstance();
	}
	
	public static IMainService getInstance() {
		if(mainService == null) {
			mainService = new MainServiceImpl();
		}
		return mainService;
	}
	
	@Override
	public List<MCityVO> getlistcity(int city_num) {
		List<MCityVO> civ = mainDao.getcity(city_num);
		return civ;
	}
	
	@Override
	public List<MPlanVO> getlistPlan(int city_num) {
		List<MPlanVO> pv = mainDao.getplan(city_num);
		return pv;
	}
	
	@Override
	public List<MLandVO> getlistLand(int city_num) {
		
		List<MLandVO> lv = mainDao.getLand(city_num);
		
		return lv;
	}

	@Override
	public List<MComVO> getlistCom(int city_num) {
		List<MComVO> cv = mainDao.getCom(city_num);
		return cv;
	}

	@Override
	public List<AllVO> allList(int city_num) {
		System.out.println("service에서 city_num = "+city_num);
		
		List<AllVO> av = mainDao.alllist(city_num);
		
		System.out.println("service에서 av = "+av);
		
		return av;
	}

	@Override
	public List<MCityVO> getcitynum() {
		List<MCityVO> mcv = mainDao.getcitynum();
		return mcv;
	}

	

	

	

}
