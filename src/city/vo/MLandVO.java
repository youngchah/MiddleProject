package city.vo;

public class MLandVO {
	
	private String land_num;			// 여행지 번호
	private String land_name;           // 여행지 이름
	private String land_title;          // 여행지 주제목
	private String city_num;            // 도시 번호
	private String city_name;			// 도시명
	private long atchFileId;			//
	
	public MLandVO() {
		// TODO Auto-generated constructor stub
	}

	public String getLand_num() {
		return land_num;
	}

	public void setLand_num(String land_num) {
		this.land_num = land_num;
	}

	public String getLand_name() {
		return land_name;
	}

	public void setLand_name(String land_name) {
		this.land_name = land_name;
	}

	public String getLand_title() {
		return land_title;
	}

	public void setLand_title(String land_title) {
		this.land_title = land_title;
	}

	public String getCity_num() {
		return city_num;
	}

	public void setCity_num(String city_num) {
		this.city_num = city_num;
	}

	public String getCity_name() {
		return city_name;
	}

	public void setCity_name(String city_name) {
		this.city_name = city_name;
	}

	public long getAtchFileId() {
		return atchFileId;
	}

	public void setAtchFileId(long atchFileId) {
		this.atchFileId = atchFileId;
	}

	public MLandVO(String land_num, String land_name, String land_title, String city_num, String city_name,
			long atchFileId) {
		super();
		this.land_num = land_num;
		this.land_name = land_name;
		this.land_title = land_title;
		this.city_num = city_num;
		this.city_name = city_name;
		this.atchFileId = atchFileId;
	}
	
	


	
	
	
}                      
                          
                           