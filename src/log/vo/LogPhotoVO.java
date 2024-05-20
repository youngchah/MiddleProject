package log.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LogPhotoVO {
	 private int logPtoNum;
	 private String logPtoName; 
	 private String logPtoPath; 
	 private String logPtoEx;   
	 private String logPtoSize; 
	 private String logPtoRegi; 
	 private String logPtoDelyn;
	 private int logNum;
	
	 public LogPhotoVO() {
		// TODO Auto-generated constructor stub
	}
	 
	 
	 public LogPhotoVO(int logPtoNum, String logPtoName, String logPtoPath, String logPtoEx, String logPtoSize,
			String logPtoRegi, String logPtoDelyn, int logNum) {
		super();
		this.logPtoNum = logPtoNum;
		this.logPtoName = logPtoName;
		this.logPtoPath = logPtoPath;
		this.logPtoEx = logPtoEx;
		this.logPtoSize = logPtoSize;
		this.logPtoRegi = logPtoRegi;
		this.logPtoDelyn = logPtoDelyn;
		this.logNum = logNum;
	}
	 
	 
	 
}