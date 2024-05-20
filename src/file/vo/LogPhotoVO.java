package file.vo;

import java.time.LocalDate;

import lombok.Data;

@Data
public class LogPhotoVO {

	private int logPtoNum;
	private String logPtoName;
	private String logPtoPath;
	private String logPtoEx;
	private String logPtoSize;
	private LocalDate logPtoRegi;
	private String logPtoDelyn;
	private int logNum;
	
	
}
