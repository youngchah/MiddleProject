package cs.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import cs.vo.FaqVO;
import cs.vo.NoticeVO;
import cs.vo.QnaVO;
import member.vo.AdminVO;
import member.vo.MemberVO;


public interface ICsService {
	// 접근제한자 반환타입 메소드명(매개변수)


	
	/**
	 * 공지사항 정보를 조회하기 위한 메서드
	 * @return 모든 등록된 공지사항 
	 */
	public List<NoticeVO> displayNotice(Map<String, Object> map);
	
	//전체 글 갯수 조회하기 
	public int countList();
	
	public List<FaqVO> displayFaq();

	public NoticeVO getNotiDetail(String notiNum);

	public int insertQna(QnaVO qna);

	public List<QnaVO> qnaCusList(MemberVO memId);

	public QnaVO getQnaDetail(int qnaNum);

	public int countQnaList();

	public int updateQnaCus(QnaVO qv);

	// 공지사항 등록을 위한 메서드
	public int insertNoti(NoticeVO nv);

	// 공지사항 정보를 가져 오기 위한 메서드
	public NoticeVO getnotiNum(int notiNum);

	// 공지사항 수정을 위한 메서드
	public int updateNotice(NoticeVO nv);

	// 공지사항 삭제하기 위한 메서드
	public int deleteNotice(NoticeVO nv);

	// QNA 정보를 가져오기 위한 메서드
	public QnaVO getQnaNum(int qnaNum);

	// 문의 답글을 인서트(사실은 업데이트)하는 메서드
	public int insertAns(QnaVO qv);

	// 문의사항을 삭제하기(delyn=y 업데이트) 위한 메서드
	public int deleteQna(QnaVO qv);

	// 문의사항 리스트 전체 출력 리스트
	public List<QnaVO> qnaAllList(AdminVO admin) throws SQLException;


	


	

	
	
}
