package cs.vo;

import java.time.LocalDate;

import lombok.Data;

@Data
public class QnaVO {
	
	
	private int qnaNum;			//문의번호
	private String qnaCat;      //카테고리
	private String qnaTitle;    //제목
	private String qnaCn;       //내용
	private LocalDate qnaDate;  //작성일
	private String qnaYn;    //답변여부
	private String memId;       //회원ID
	private String ansCn;       //답변내용                     
	private LocalDate ansDate;	//답변날짜
	private String QnaDelyn;	//삭제여부
	
	
	public QnaVO() {
		// TODO Auto-generated constructor stub
	}
	
	public QnaVO(String memId, String qnaCat, String qnaTitle, String qnaCn) {
		this.memId = memId;
		this.qnaCat = qnaCat;
		this.qnaTitle = qnaTitle;
		this.qnaCn = qnaCn;
	}

	
	
}

