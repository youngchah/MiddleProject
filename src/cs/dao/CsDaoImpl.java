package cs.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.swing.plaf.multi.MultiViewportUI;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import common.MyBatisDao;
import cs.vo.FaqVO;
import cs.vo.NoticeVO;
import cs.vo.QnaVO;
import member.vo.AdminVO;
import member.vo.MemberVO;
import util.MyBatisUtil;

public class CsDaoImpl extends MyBatisDao implements ICsDao {

	// dao객체 생성하기 - 싱글톤 방식으로
	private static ICsDao csDao;

	// 1. private constructor
	public CsDaoImpl() {
	}

	// 2. static method
	public static ICsDao getInstance() {
		if (csDao == null)
			csDao = new CsDaoImpl();
		return csDao;
	}

	@Override
	public List<NoticeVO> displayNotice(Map<String, Object> map) throws SQLException {
		return selectList("cs.displayNotice", map);
	}

	@Override
	public int countList() throws SQLException {
		return selectOne("cs.countList");

	}

	@Override
	public int countQnaList() throws SQLException {
		return selectOne("cs.countQnaList");
	}

	@Override
	public List<FaqVO> displayFaq() throws SQLException {
		return selectList("cs.displayFaq");
	}

	@Override
	public NoticeVO getNotiDetail(String notiNum) {
		return selectOne("cs.getNotiDetail", notiNum);
	}

	@Override
	public int insertQna(QnaVO qna) throws SQLException {
		return insert("cs.insertQna", qna);
	}

	@Override
	public List<QnaVO> qnaCusList(MemberVO memId) throws SQLException {
		return selectList("cs.qnaCusList", memId);
	}

	@Override
	public QnaVO getQnaDetail(int qnaNum) {
		return selectOne("cs.getQnaDetail", qnaNum);
	}

	@Override
	public int updateQnaCus(QnaVO qv) throws SQLException {
		return insert("cs.updateQnaCus", qv);

	}

	@Override
	public int insertNoti(NoticeVO nv) {

		SqlSession sqlSession = MyBatisUtil.getInstance();

		int cnt = 0;

		try {
			cnt = sqlSession.insert("cs.insertNoti", nv);

			sqlSession.commit();
		} catch (Exception e) {
			sqlSession.rollback();
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return cnt;
	}

	@Override
	public int updateNotice(NoticeVO nv) {

		SqlSession sqlSession = MyBatisUtil.getInstance();

		int cnt = 0;

		try {
			cnt = sqlSession.update("cs.updateNotice", nv);

			if (cnt > 0) {
				sqlSession.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}

		return cnt;
	}

	@Override
	public NoticeVO getnotiNum(int notiNum) {

		SqlSession sqlSession = MyBatisUtil.getInstance();

		NoticeVO nv = null;

		try {
			nv = sqlSession.selectOne("cs.getnotiNum", notiNum);

			System.out.println(">>>>>!@$@!$!>>>>>>>>>>" + nv);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}

		return nv;
	}

	@Override
	public int deleteNotice(NoticeVO nv) {
		SqlSession sqlSession = MyBatisUtil.getInstance();

		int cnt = 0;

		try {
			cnt = sqlSession.update("cs.deleteNotice", nv);

			if (cnt > 0) {
				sqlSession.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}

		return cnt;
	}

	@Override
	public QnaVO getQnaNum(int qnaNum) {

		SqlSession sqlSession = MyBatisUtil.getInstance();

		QnaVO qv = null;

		try {
			qv = sqlSession.selectOne("cs.getqnaNum", qnaNum);

			System.out.println(">>>>>!@$@!$!>>>>>>>>>>" + qv);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}

		return qv;
		
	}

	@Override
	public int insertAns(QnaVO qv) {
		
		SqlSession sqlSession = MyBatisUtil.getInstance();
		
		int cnt = 0;
		
		try {
			cnt = sqlSession.update("cs.insertAns",qv);
			
			if(cnt > 0) {
				sqlSession.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}

		return cnt;
	}

	@Override
	public int deleteQna(QnaVO qv) {
		
		return delete("cs.deleteQna", qv);
		
	}

	@Override
	public List<QnaVO> qnaAllList(AdminVO admin) {
		return selectList("cs.qnaAllList", admin);
	}

//	@Override
//	public String AdloginChk(Map<String, Object> map) throws SQLException {
//		
//		//admin.xml 만들어서 로그인체크 넣을것
//		return selectOne("admin.adloginChk", map);
//	}
//
//	@Override
//	public List<NoticeVO> displayNotice(){
//		
//		List<NoticeVO> notiList = new ArrayList<NoticeVO>();
//		
//		SqlSession sqlSession = MyBatisUtil.getInstance(true);
//		
//		try {
//			notiList = sqlSession.selectList("cs.displayNotice");
//
//		} catch (PersistenceException ex) {
//			ex.printStackTrace();
//		} finally {
//			sqlSession.close();
//		}
//		return notiList;
//	}

}
