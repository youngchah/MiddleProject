package city.vo;

import java.time.LocalDate;

import lombok.Data;

@Data
public class AllVO {
	
	private int city_num;
	private String city_county;
	private String city_name; //
	
	//community
	private String com_num;
	private String com_title; //
	private String com_cn;
	private String com_regi;
	private String com_edit;
	private String com_delyn;
	private String mem_id;
	private String com_in;
	//private String city_name;
	
	//landmark
	private int land_num;
	private String land_name;
	private String land_lat;
	private String land_lng;
	//private String city_num;
	private String land_cont;
	private String land_title;
	private String land_like;
	private String land_addr;
	
	//log
	private int log_num;
	private String log_title; //
	private LocalDate log_start;
	private LocalDate log_end;
	private LocalDate log_regi;
	private LocalDate log_edit;
	private String log_cn;
	private String log_ban;
	private String log_status;
	private String log_cat;
	//private String mem_id;
	private String log_sn;
	private long atch_file_id;
	private String mem_nick;
	
	
	//plan
	private String plan_num;
	private String plan_title; //
	private String plan_date;
	private String plan_delyn;
	private String plan_banyn;
	//private String mem_id;
	
}


