package log.vo;

import java.sql.Clob;
import java.time.LocalDate;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Data
public class LogVO {
	private int logNum;
	private String logTitle;
	private LocalDate logStart;
	private LocalDate logEnd;
	private LocalDate logRegi;
	private LocalDate logEdit;
	private String logCn;
	private String logBan;
	private String logStatus;
	private String logCat;
	private String memId;
	private String logSn;
	private long atchFileId;
	
	private int cityNum;
	private String cityName;
	
	private String logCont;
	
	private String memNick;
	private String streFileNm;
	private String fileExtsn;
	private int fileSn;
	
	

	
	
	
	public LogVO() {
		// TODO Auto-generated constructor stub
	}


	




	
	

	
	 
}
