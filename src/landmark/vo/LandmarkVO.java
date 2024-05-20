package landmark.vo;

import lombok.Data;

@Data
public class LandmarkVO {
	 private int landNum;			//여행지 번호
	 private String landName;		//여행지 이름
	 private long landLat;			//위도
	 private long landLng;			//경도
	 private String landTitle;		//여행지 주제목
	 private String landCont;		//여행지 설명
	 private String landAddr;		//여행지 주소
	 private int landLike;			//여행지 관심 수
	 private int cityNum;			//도시번호
	 private String cityName;		//도시이름
	 private String cityCounty;		//도,시
	
	 
	 public LandmarkVO() {
		// TODO Auto-generated constructor stub
	}
	 
	 public LandmarkVO(String landName, int cityNum) {
		 this.landName = landName;
		 this.cityNum = cityNum;
	 }
	 
	 
	 public LandmarkVO(int landNum, int cityNum) {
		super();
		this.landNum = landNum;
		this.cityNum = cityNum;
	}
	 
}
