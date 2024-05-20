package city.service;

import java.util.List;

import community.dao.ComDaoImpl;
import community.dao.IComDao;
import community.vo.ComVO;
import community.vo.CombineComVO;

public class CcomServiceImpl implements ICcomService{

	private static ICcomService comService;
	
	private IComDao comDao;
	
	private CcomServiceImpl() {
		comDao = ComDaoImpl.getInstance();
	}
	
	public static ICcomService getInstance() {
		if(comService == null) {
			comService = new CcomServiceImpl();
		}
		return comService;
	}
	

	@Override
	public List<ComVO> displayAllCom() {
		
		List<ComVO> comList = comDao.selectAll();
		return comList;
	}

	@Override
	public int registCom(CombineComVO cv) {
//		int cnt = comDao.insertCom(cv);
		return 0;
	}

	@Override
	public ComVO getCom(int com_num) {
		
		ComVO cv = comDao.getCom(com_num);
		
		//System.out.println("service " + cv);
		return cv;
	}

	@Override
	public int modifyCom(ComVO cv) {
		int cnt = comDao.updateCom(cv);
		return cnt;
	}

	@Override
	public int removeCom(int com_num) {
		int cnt = comDao.deleteCom(com_num);
		return cnt;
	}

	@Override
	public List<ComVO> searchCom(String com_title) {
		List<ComVO> comList = comDao.searchCom(com_title);
		System.out.println(com_title);
		System.out.println("서비스"+comList);
		return comList;
	}

	

}
