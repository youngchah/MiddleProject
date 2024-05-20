package member.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import member.dao.IMemberDao;
import member.dao.MemberDaoImpl;
import member.vo.MemberVO;

public class MemberServiceImpl implements IMemberService {

	private IMemberDao memDao;
	private static IMemberService service;
	//1
	private MemberServiceImpl() {
		 memDao = MemberDaoImpl.getInstance();
	}
	//2
	public static IMemberService getInstance() {
		if(service == null) service = new MemberServiceImpl();
		return service;
	}
	
	@Override
	public String loginChk(Map<String, Object> map) {
	
		//dao가 넘겨주는 자료를 받아서 controller로 넘겨줘야 함..
		String memId = "";
		try {
			memId = memDao.loginChk(map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return memId;
	}
	@Override
	public int registMember(MemberVO mv) {
		
		int cnt = memDao.insertMember(mv);
		//System.out.println(cnt);
		return cnt;
	}

	@Override
	public int modifyMember(MemberVO mv) {
		
		int cnt = memDao.updateMember(mv);
		
		return cnt;
	}

	@Override
	public boolean checkMember(String memId) {
		
		boolean isExist = memDao.checkMember(memId);
		
		return isExist;
	}


	@Override
	public List<MemberVO> displayAllMember() {
		
		List<MemberVO> memList = memDao.selectAll();
		
		return memList;
	}

	@Override
	public List<MemberVO> searchMember(MemberVO mv) {
		
		List<MemberVO> memList = memDao.searchMember(mv);
		
		return memList;
	}
	
	@Override
	public MemberVO getMember(String memId) {
		
		MemberVO mv = memDao.getMember(memId);
		
		return mv;
	}
	
	@Override
	public MemberVO getLoginInfo(MemberVO loginInfo) {
		MemberVO mv = memDao.getLoginInfo(loginInfo);
		
		return mv;
	}

	@Override
	public String findId(String memName, String memEmail) {

		MemberVO mv = new MemberVO();
		mv.setMem_Name(memName);
		mv.setMem_Email(memEmail);
		
		String memId = memDao.findId(mv);
		
		return memId;
	}
	
	@Override
	public int countMember() {

		int countMember = 0;
		
		try {
			countMember = memDao.countList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return countMember;
	}
	@Override
	public List<MemberVO> memberList(Map<String, Object> map) {

		List<MemberVO>list = null;
		try {
			list = memDao.memList(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public int deleteMember(MemberVO mv) {
		
		int cnt = memDao.deleteMember(mv);
		
		return cnt;
	}

	
	
	
}
