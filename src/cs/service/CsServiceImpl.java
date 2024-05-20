package cs.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import cs.controller.Notice;
import cs.dao.CsDaoImpl;
import cs.dao.ICsDao;
import cs.vo.FaqVO;
import cs.vo.NoticeVO;
import cs.vo.QnaVO;
import member.vo.AdminVO;
import member.vo.MemberVO;

public class CsServiceImpl implements ICsService {
	
	private ICsDao csDao;
	private static ICsService csService;
	//1
	private CsServiceImpl() {
		 csDao = CsDaoImpl.getInstance();
	}
	//2
	public static ICsService getInstance() {
		if(csService == null) csService = new CsServiceImpl();
		return csService;
	}
	
	private static final Logger SQL_LOGGER = 
			LogManager.getLogger("log4jexam.sql.Query");
	private static final Logger PARAM_LOGGER = 
			LogManager.getLogger("log4jexam.sql.Parameter");
	private static final Logger RESULT_LOGGER = 
			LogManager.getLogger(CsServiceImpl.class);
	
	
	
//	@Override
//	public String AdloginChk(Map<String, Object> map) {
//		
//		//dao가 넘겨주는 자료 받아서 controller로 넘겨주기
//		String adId = "";
//		
//		try {
//			adId = adDao.AdloginChk(map);
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		
//		
//		return adId;
//	}
	@Override
	public List<NoticeVO> displayNotice(Map<String, Object> map) {
		
		List<NoticeVO> notiList = null;
		
		try {
			notiList = csDao.displayNotice(map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return notiList;
	}
	@Override
	public int countList() {
		int countList = 0;
		try {
			countList = csDao.countList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return countList;
	
	}
	
	@Override
	public int countQnaList() {
		int countList = 0;
		try {
			countList = csDao.countQnaList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return countList;
	}
	
	@Override
	public List<FaqVO> displayFaq() {
		List<FaqVO> faqList = null;
		
		try {
			faqList = csDao.displayFaq();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return faqList;
	}
	@Override
	public NoticeVO getNotiDetail(String notiNum) {
		
		NoticeVO nv = csDao.getNotiDetail(notiNum);
		
		return nv;
	}
	@Override
	public int insertQna(QnaVO qna) {
		
		int cnt = 0;
		
		try {
			cnt = csDao.insertQna(qna);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cnt;
	}
	@Override
	public List<QnaVO> qnaCusList(MemberVO memId) {
		List<QnaVO> qnaList = null;
		try {
			qnaList = csDao.qnaCusList(memId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return qnaList;
	}
	
	@Override
	public QnaVO getQnaDetail(int qnaNum) {
		
		QnaVO qv = csDao.getQnaDetail(qnaNum);
		
		return qv;
	}
	@Override
	public int updateQnaCus(QnaVO qv) {
		int cnt = 0;
		
		try {
			cnt = csDao.updateQnaCus(qv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cnt;
	}
	
	/**
	 * 공지사항 등록을 위한 메서드
	 */
	@Override
	public int insertNoti(NoticeVO nv) {
		
		int cnt = csDao.insertNoti(nv);
		
		return cnt;
	}
	
	/**
	 * 공지사항 수정을 위한 메서드
	 */
	@Override
	public NoticeVO getnotiNum(int notiNum) {

		NoticeVO nv = csDao.getnotiNum(notiNum);
		
		System.out.println(">>>>>>>>>>>>>>>>>FSDFSDFSDFSDF 서비스" +  nv);
		
		return nv;
	}
	
	@Override
	public int updateNotice(NoticeVO nv) {
		
		int cnt = csDao.updateNotice(nv);
		
		return cnt;
	}

	
	@Override
	public int deleteNotice(NoticeVO nv) {
		int cnt = csDao.deleteNotice(nv);
		
		return cnt;
	}
	@Override
	public QnaVO getQnaNum(int qnaNum) {

		QnaVO qv = csDao.getQnaNum(qnaNum);
		
		return qv;
	}
	@Override
	public int insertAns(QnaVO qv) {

		int cnt = csDao.insertAns(qv);
		
		return cnt;
	}
	/**
	 * qna delete하기위함 
	 */
	@Override
	public int deleteQna(QnaVO qv) {
		
		int cnt = csDao.deleteQna(qv);
		
		return cnt;
	}
	@Override
	public List<QnaVO> qnaAllList(AdminVO admin) throws SQLException {
		List<QnaVO> qnaList = null;
		qnaList = csDao.qnaAllList(admin);
		
		return qnaList;
	}


	
	
	
	
}
