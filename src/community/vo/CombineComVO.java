package community.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class CombineComVO {
	
	
	private int com_num; // 커뮤니티 게시글 번호
	private String com_title; // 제목
	private String com_cn; // 내용
	// private LocalDate com_regi; //등록일 >> 날짜로 바꾸기
	// private LocalDate com_edit; //수정일
	private String com_regi;
	private String com_delyn; 		// 삭제여부
	private String mem_id; 			// 회원ID
	private String mem_nick; 		// 회원닉네임
	private String city_name;		// 도시이름
	private long atchFileId = -1;
	
	private Long comPhotoNum; // 커뮤니티 사진 번호
	private String comPhotoName; // 사진명
	private String comPhotoPath; // 사진경로
	private String comPhotoEx; // 사진확장자
	private String comPhotoSize; // 사진크기
	private Date comPhotoCreate; // 생성일
	private String comPhotoDelYn; // 삭제여부
	private Long comNum;

}
