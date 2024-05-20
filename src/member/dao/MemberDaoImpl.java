package member.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import common.MyBatisDao;
import member.vo.MemberVO;
import util.MyBatisUtil;

public class MemberDaoImpl extends MyBatisDao implements IMemberDao {

	//dao객체 생성하기 - 싱글톤 방식으로
	private static IMemberDao dao;
	//1. private constructor
	private MemberDaoImpl () {}
	
	//2. static method
	public static IMemberDao getInstance() {
		if(dao == null) dao = new MemberDaoImpl();
		return dao;
	}
	
	@Override
	public String loginChk(Map<String, Object> map) throws SQLException {
		
		return selectOne("member.loginChk",map);
	}

	@Override
	public int insertMember(MemberVO mv) {

		SqlSession sqlSession = MyBatisUtil.getInstance();

		int cnt = 0;
		
		try {
			cnt = sqlSession.insert("member.insertMember",mv);
			
			if(cnt > 0) {
				sqlSession.commit();
			}
			
		}catch(PersistenceException ex) {
			sqlSession.rollback();
			ex.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		System.out.println(cnt);
		return cnt;
	}

	@Override
	public int updateMember(MemberVO mv) {
		
		SqlSession sqlSession = MyBatisUtil.getInstance();

		int cnt = 0;
		
		try {
			cnt = sqlSession.update("member.updateMember",mv);
			
			if(cnt > 0) {
				sqlSession.commit();
			}
			
		}catch(PersistenceException ex) {
			ex.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return cnt;
	}

	@Override
	public boolean checkMember(String memId) {
		
		boolean isExist = false;
		
		SqlSession sqlSession = MyBatisUtil.getInstance(true); // <=true는 오토커밋

		
		try {
			int cnt = sqlSession.selectOne("member.checkMember",memId);
			
			if(cnt >0) {
				isExist = true;
			}
		
		}catch(PersistenceException ex) {
			ex.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return isExist;
	}

	@Override
	public int deleteMember(MemberVO mv) {
		
		SqlSession sqlSession = MyBatisUtil.getInstance();

		int cnt = 0;
		
		try {
			cnt = sqlSession.update("member.deleteMember", mv);
			
			if(cnt > 0) {
				sqlSession.commit();
			}
			
		}catch(PersistenceException ex) {
			ex.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return cnt;
	}

	@Override
	public List<MemberVO> selectAll() {

		List<MemberVO> memList = new ArrayList<MemberVO>();
		
		SqlSession sqlSession = MyBatisUtil.getInstance(true); // <=true는 오토커밋
		
		try {
			memList = sqlSession.selectList("member.selectAll");
			
		}catch(PersistenceException ex) {
			ex.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return memList;
	}

	@Override
	public List<MemberVO> searchMember(MemberVO mv) {
		
		List<MemberVO> memList = new ArrayList<MemberVO>();
		
		SqlSession sqlSession = MyBatisUtil.getInstance(true); // <=true는 오토커밋
		
		try {
			memList = sqlSession.selectList("member.searchMember", mv);
			
		}catch(PersistenceException ex) {
			ex.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return memList;
	}

	@Override
	public MemberVO getMember(String memId) {
		
		SqlSession sqlSession = MyBatisUtil.getInstance(true);
		
		MemberVO mv = null;
		
		try {
			
			mv = sqlSession.selectOne("member.getMember", memId);
			
		} catch (PersistenceException e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return mv;
	}

	@Override
	public MemberVO getLoginInfo(MemberVO loginInfo) {

		
		SqlSession sqlSession = MyBatisUtil.getInstance(true);
		
		MemberVO mv = null;
		
		try {
			
			mv = sqlSession.selectOne("member.getLoginInfo", loginInfo);
		
		} catch (PersistenceException e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return mv;
		
	}

	@Override
	public String findId(MemberVO mv) {
		
		System.out.print("DAO>>> ");
		System.out.println(mv.getMem_Name());
		System.out.println(mv.getMem_Email());
		
		MemberVO m = new MemberVO();
		SqlSession sqlSession = MyBatisUtil.getInstance(true);
		
		try {
			m = sqlSession.selectOne("member.findId", mv);
			
			/*
			 * if(mv != null ) { memId = mv.getMem_Id(); }
			 */
		} catch (Exception e) {
			sqlSession.close();
		}
		
		
		String findId = m.getMem_Id();
		//System.out.println(findId);
		
		return findId;
	}

	@Override
	public int countList() {
		
		System.out.print("다오 카운터 리스트"+(int)selectOne("member.countMember"));
		return selectOne("member.countMember");
	}

	@Override
	public List<MemberVO> memList(Map<String, Object> map) {
		return selectList("member.memberList",map);
		
	}

	
	
	
}
