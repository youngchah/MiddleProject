package cs.vo;

import java.time.LocalDate;

import lombok.Data;

@Data
public class NoticeVO {
	
	private int notiNum;
	private String notiTitle;
	private String notiCn;
	private LocalDate notiCreate;
	private String notiDelyn;
	
	
	
}
