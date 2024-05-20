package log.vo;

import java.time.LocalDate;

import lombok.Data;

@Data
public class LogComVO {
	
	private int logComNum;
	private String logComCn;
	private int logComLike;
	private LocalDate logComDate;
	private LocalDate logComEdit;
	private String logComDelyn;
	private int logNum;
	private String memId;
	
	private String memNick;
	
}
