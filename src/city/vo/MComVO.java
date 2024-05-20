package city.vo;

public class MComVO {
	
	private int com_num; 			// 커뮤니티 게시글 번호
	private String com_title; 		// 제목
	private String com_regi;		// 등록일
	private String mem_id; 			// 회원ID
	private String mem_nick; 		// 회원닉네임
	private String city_name;		// 도시명
	
	public MComVO() {
		// TODO Auto-generated constructor stub
	}
	
	public int getCom_num() {
		return com_num;
	}
	public void setCom_num(int com_num) {
		this.com_num = com_num;
	}
	public String getCom_title() {
		return com_title;
	}
	public void setCom_title(String com_title) {
		this.com_title = com_title;
	}
	public String getCom_regi() {
		return com_regi;
	}
	public void setCom_regi(String com_regi) {
		this.com_regi = com_regi;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_nick() {
		return mem_nick;
	}
	public void setMem_nick(String mem_nick) {
		this.mem_nick = mem_nick;
	}
	public String getCity_name() {
		return city_name;
	}
	public void setCity_name(String city_name) {
		this.city_name = city_name;
	}
	public MComVO(int com_num, String com_title, String com_regi, String mem_id, String mem_nick, String city_name) {
		super();
		this.com_num = com_num;
		this.com_title = com_title;
		this.com_regi = com_regi;
		this.mem_id = mem_id;
		this.mem_nick = mem_nick;
		this.city_name = city_name;
	}
	
	
	


	
	
	
	
}
