package member.vo;

import java.time.LocalDate;
import java.util.Date;

import oracle.sql.CLOB;

public class MemberVO {

	private String mem_Id;
	private String mem_Pass;
	private String mem_Name;
	private String mem_Nick;
	private String mem_Tel;
	private Date mem_Bir;
	private String mem_Email;
	private String mem_Pc;
	private String mem_Addr1;
	private String mem_Addr2;
	private CLOB mem_Prof;
	private String mem_Ban;
	private String mem_Sign;
	private String mem_Token;
	private String mem_Delyn;
	
	
	
	public String getMem_Id() {
		return mem_Id;
	}
	public void setMem_Id(String mem_Id) {
		this.mem_Id = mem_Id;
	}
	public String getMem_Pass() {
		return mem_Pass;
	}
	public void setMem_Pass(String mem_Pass) {
		this.mem_Pass = mem_Pass;
	}
	public String getMem_Name() {
		return mem_Name;
	}
	public void setMem_Name(String mem_Name) {
		this.mem_Name = mem_Name;
	}
	public String getMem_Nick() {
		return mem_Nick;
	}
	public void setMem_Nick(String mem_Nick) {
		this.mem_Nick = mem_Nick;
	}
	public String getMem_Tel() {
		return mem_Tel;
	}
	public void setMem_Tel(String mem_Tel) {
		this.mem_Tel = mem_Tel;
	}
	public Date getMem_Bir() {
		return mem_Bir;
	}
	public void setMem_Bir(Date memBirDate) {
		this.mem_Bir = memBirDate;
	}
	public String getMem_Email() {
		return mem_Email;
	}
	public void setMem_Email(String mem_Email) {
		this.mem_Email = mem_Email;
	}
	public String getMem_Pc() {
		return mem_Pc;
	}
	public void setMem_Pc(String mem_Pc) {
		this.mem_Pc = mem_Pc;
	}
	public String getMem_Addr1() {
		return mem_Addr1;
	}
	public void setMem_Addr1(String mem_Addr1) {
		this.mem_Addr1 = mem_Addr1;
	}
	public String getMem_Addr2() {
		return mem_Addr2;
	}
	public void setMem_Addr2(String mem_Addr2) {
		this.mem_Addr2 = mem_Addr2;
	}
	public CLOB getMem_Prof() {
		return mem_Prof;
	}
	public void setMem_Prof(CLOB mem_Prof) {
		this.mem_Prof = mem_Prof;
	}
	public String getMem_Ban() {
		return mem_Ban;
	}
	public void setMem_Ban(String mem_Ban) {
		this.mem_Ban = mem_Ban;
	}
	public String getMem_Sign() {
		return mem_Sign;
	}
	public void setMem_Sign(String mem_Sign) {
		this.mem_Sign = mem_Sign;
	}
	public String getMem_Token() {
		return mem_Token;
	}
	public void setMem_Token(String mem_Token) {
		this.mem_Token = mem_Token;
	}
	public String getMem_Delyn() {
		return mem_Delyn;
	}
	public void setMem_Delyn(String mem_Delyn) {
		this.mem_Delyn = mem_Delyn;
	}
	
	
	
	
	
	
	
	
}