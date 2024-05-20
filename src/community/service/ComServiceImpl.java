package community.service;

import java.util.List;

import community.dao.ComDaoImpl;
import community.dao.IComDao;
import community.vo.ComVO;
import community.vo.CombineComVO;

public class ComServiceImpl implements IComService{

	private static IComService comService;
	
	private IComDao comDao;
	
	private ComServiceImpl() {
		comDao = ComDaoImpl.getInstance();
	}
	
	public static IComService getInstance() {
		if(comService == null) {
			comService = new ComServiceImpl();
		}
		return comService;
	}
	
	
	/**
	 * 모든 커뮤니티 정보를 조회하는 메서드
	 * @return
	 */
	@Override
	public List<ComVO> displayAllCom() {
		
		List<ComVO> comList = comDao.selectAll();
		return comList;
	}

	
	/**
	 * 커뮤니티 등록을 위한 메서드
	 * @param cv
	 * @return
	 */
	@Override
	public int registCom(ComVO commuVO) {
		int cnt = comDao.insertCom(commuVO);
		return cnt;
	}

	@Override
	public ComVO getCom(int com_num) {
		
		ComVO cv = comDao.getCom(com_num);
		
		System.out.println("service " + cv);
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

	@Override
	public int fileInsert(CombineComVO chv) {
		
		return comDao.fileInsert(chv);
	}

	@Override
	public List<ComVO> selectMyCommuAll(String memId) {
		return comDao.selectMyCommuAll(memId);
	}

	@Override
	public Integer comCount(String memId) {
		int cnt = 0;
		cnt = comDao.comCount(memId);
		return cnt;
	}

	

}
