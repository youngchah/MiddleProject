package city.vo;

import java.time.LocalDate;

public class MPlanVO {
	private int plan_num;
	private String plan_title;
	private String mem_id;
	private String mem_nick;
	private String city_name;
	
	public MPlanVO() {
		// TODO Auto-generated constructor stub
	}

	public int getPlan_num() {
		return plan_num;
	}

	public void setPlan_num(int plan_num) {
		this.plan_num = plan_num;
	}

	public String getPlan_title() {
		return plan_title;
	}

	public void setPlan_title(String plan_title) {
		this.plan_title = plan_title;
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

	public MPlanVO(int plan_num, String plan_title, String mem_id, String mem_nick, String city_name) {
		super();
		this.plan_num = plan_num;
		this.plan_title = plan_title;
		this.mem_id = mem_id;
		this.mem_nick = mem_nick;
		this.city_name = city_name;
	}
	

}
