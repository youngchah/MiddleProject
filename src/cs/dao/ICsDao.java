package cs.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import cs.vo.FaqVO;
import cs.vo.NoticeVO;
import cs.vo.QnaVO;
import member.vo.AdminVO;
import member.vo.MemberVO;

public interface ICsDao {
	
	
	/**
	 * 로그인 id-pw검증
	 * @param map
	 * @return
	 * @throws SQLException
	 */
//	public String AdloginChk(Map<String, Object> map) throws SQLException;
//	
//
	public int countList () throws SQLException;
	
	//공지사항 리스트
	public List<NoticeVO> displayNotice(Map<String, Object> map) throws SQLException;

	public List<FaqVO> displayFaq() throws SQLException;

	public NoticeVO getNotiDetail(String notiNum);

	public int insertQna(QnaVO qna) throws SQLException;

	public List<QnaVO> qnaCusList(MemberVO memId) throws SQLException;

	public QnaVO getQnaDetail(int qnaNum);

	public int countQnaList() throws SQLException;

	public int updateQnaCus(QnaVO qna) throws SQLException;

	// 공지사항 등록을 위한 메서드
	public int insertNoti(NoticeVO nv);

	// 공지사항 정보를 가져오기 위한 메서드
	public NoticeVO getnotiNum(int notiNum);

	// 공지사항을 업데이트 하기 위한 메서드
	public int updateNotice(NoticeVO nv);

	// 공지사항을 삭제 하기 위한 메서드
	public int deleteNotice(NoticeVO nv);

	// QNA 정보를 가져오기 위한 메서드
	public QnaVO getQnaNum(int qnaNum);

	// 문의 답글은 인서트 하는 메서드
	public int insertAns(QnaVO qv);
	
	// 문의 삭제하는 메서드 
	public int deleteQna(QnaVO qv);

	// 문의 사항 전체 출력 메서드
	public List<QnaVO> qnaAllList(AdminVO admin);

	
		
		
}
