package plan.vo;

import java.sql.Clob;


public class CombinePlanVO {
	
	
	public CombinePlanVO() {};
	
	
	//plan vo 필드
	private int plan_area_num;
	private int plan_area_mapseq;
	private String plan_area_name;
	private Double plan_area_lati;
	private Double plan_area_long;
	private int plan_date_num;
	
	
	private String plan_date;
	private int plan_date_day;
	private Clob plan_date_thum;
	private int plan_num;
	private String plan_date_start;
	private String plan_date_end;
	
	
	private String plan_title;
	private String plan_delyn;
	private String plan_banyn;
	private String plan_area_seq;
	
	
	
	//외부 vo 필드
	private String city_name;
	private String mem_id;
	private int city_num;
	
	
	
	
	public int getPlan_area_num()
	{
		return plan_area_num;
	}
	public void setPlan_area_num(int plan_area_num)
	{
		this.plan_area_num = plan_area_num;
	}
	public int getPlan_area_mapseq()
	{
		return plan_area_mapseq;
	}
	public void setPlan_area_mapseq(int plan_area_mapseq)
	{
		this.plan_area_mapseq = plan_area_mapseq;
	}
	public String getPlan_area_name()
	{
		return plan_area_name;
	}
	public void setPlan_area_name(String plan_area_name)
	{
		this.plan_area_name = plan_area_name;
	}
	public Double getPlan_area_lati()
	{
		return plan_area_lati;
	}
	public void setPlan_area_lati(Double plan_area_lati)
	{
		this.plan_area_lati = plan_area_lati;
	}
	public Double getPlan_area_long()
	{
		return plan_area_long;
	}
	public void setPlan_area_long(Double plan_area_long)
	{
		this.plan_area_long = plan_area_long;
	}
	public int getPlan_date_num()
	{
		return plan_date_num;
	}
	public void setPlan_date_num(int plan_date_num)
	{
		this.plan_date_num = plan_date_num;
	}
	public String getPlan_date()
	{
		return plan_date.substring(0, 10);
	}
	public void setPlan_date(String plan_date)
	{
		this.plan_date = plan_date;
	}
	public int getPlan_date_day()
	{
		return plan_date_day;
	}
	public void setPlan_date_day(int plan_date_day)
	{
		this.plan_date_day = plan_date_day;
	}
	public Clob getPlan_date_thum()
	{
		return plan_date_thum;
	}
	public void setPlan_date_thum(Clob plan_date_thum)
	{
		this.plan_date_thum = plan_date_thum;
	}
	public int getPlan_num()
	{
		return plan_num;
	}
	public void setPlan_num(int plan_num)
	{
		this.plan_num = plan_num;
	}
	public String getPlan_date_start()
	{
		return plan_date_start.substring(0, 10);
	}
	public void setPlan_date_start(String plan_date_start)
	{
		this.plan_date_start = plan_date_start;
	}
	public String getPlan_date_end()
	{
		return plan_date_end.substring(0, 10);
	}
	public void setPlan_date_end(String plan_date_end)
	{
		this.plan_date_end = plan_date_end;
	}
	public String getPlan_title()
	{
		return plan_title;
	}
	public void setPlan_title(String plan_title)
	{
		this.plan_title = plan_title;
	}
	public String getPlan_delyn()
	{
		return plan_delyn;
	}
	public void setPlan_delyn(String plan_delyn)
	{
		this.plan_delyn = plan_delyn;
	}
	public String getPlan_banyn()
	{
		return plan_banyn;
	}
	public void setPlan_banyn(String plan_banyn)
	{
		this.plan_banyn = plan_banyn;
	}
	public String getPlan_area_seq()
	{
		return plan_area_seq;
	}
	public void setPlan_area_seq(String plan_area_seq)
	{
		this.plan_area_seq = plan_area_seq;
	}
	public String getCity_name()
	{
		return city_name;
	}
	public void setCity_name(String city_name)
	{
		this.city_name = city_name;
	}
	public String getMem_id()
	{
		return mem_id;
	}
	public void setMem_id(String mem_id)
	{
		this.mem_id = mem_id;
	}
	public int getCity_num()
	{
		return city_num;
	}
	public void setCity_num(int city_num)
	{
		this.city_num = city_num;
	}
	
	
	
	
	
	
	
	
	
	
	

}
