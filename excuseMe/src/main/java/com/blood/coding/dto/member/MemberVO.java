package com.blood.coding.dto.member;

import java.util.Date;

public class MemberVO {
	private String mem_id;
	private String mem_pwd;
	private String mem_gender;
	private Date mem_birthDate;
	private String mem_name;
	private int mem_status;
	private String mem_local;
	private Date mem_regDate;
	private String mem_phone;
	private String mem_nick;
	private int mem_phone_check;
	private int mem_id_check;
	private int mem_name_check;






	public String getMem_nick() {
		return mem_nick;
	}



	public void setMem_nick(String mem_nick) {
		this.mem_nick = mem_nick;
	}



	



	public MemberVO(String mem_id, String mem_pwd, String mem_gender, Date mem_birthDate, String mem_name,
			int mem_status, String mem_local, Date mem_regDate, String mem_phone, String mem_nick, int mem_phone_check,
			int mem_id_check, int mem_name_check) {
		super();
		this.mem_id = mem_id;
		this.mem_pwd = mem_pwd;
		this.mem_gender = mem_gender;
		this.mem_birthDate = mem_birthDate;
		this.mem_name = mem_name;
		this.mem_status = mem_status;
		this.mem_local = mem_local;
		this.mem_regDate = mem_regDate;
		this.mem_phone = mem_phone;
		this.mem_nick = mem_nick;
		this.mem_phone_check = mem_phone_check;
		this.mem_id_check = mem_id_check;
		this.mem_name_check = mem_name_check;
	}



	public int getMem_phone_check() {
		return mem_phone_check;
	}



	public void setMem_phone_check(int mem_phone_check) {
		this.mem_phone_check = mem_phone_check;
	}



	public int getMem_id_check() {
		return mem_id_check;
	}



	public void setMem_id_check(int mem_id_check) {
		this.mem_id_check = mem_id_check;
	}



	public int getMem_name_check() {
		return mem_name_check;
	}



	public void setMem_name_check(int mem_name_check) {
		this.mem_name_check = mem_name_check;
	}



	public MemberVO() {
		this("","","",null,"",1,"",null,"","",0,0,0);
	}

	

	@Override
	public String toString() {
		return "MemberVO [mem_id=" + mem_id + ", mem_pwd=" + mem_pwd + ", mem_gender=" + mem_gender + ", mem_birthDate="
				+ mem_birthDate + ", mem_name=" + mem_name + ", mem_status=" + mem_status + ", mem_local=" + mem_local
				+ ", mem_regDate=" + mem_regDate + ", mem_phone=" + mem_phone + "]";
	}



	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getMem_pwd() {
		return mem_pwd;
	}

	public void setMem_pwd(String mem_pwd) {
		this.mem_pwd = mem_pwd;
	}

	public String getMem_gender() {
		return mem_gender;
	}

	public void setMem_gender(String mem_gender) {
		this.mem_gender = mem_gender;
	}

	public Date getMem_birthDate() {
		return mem_birthDate;
	}

	public void setMem_birthDate(Date mem_birthDate) {
		this.mem_birthDate = mem_birthDate;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public int getMem_status() {
		return mem_status;
	}

	public void setMem_status(int mem_status) {
		this.mem_status = mem_status;
	}

	public String getMem_local() {
		return mem_local;
	}

	public void setMem_local(String mem_local) {
		this.mem_local = mem_local;
	}

	public Date getMem_regDate() {
		return mem_regDate;
	}

	public void setMem_regDate(Date mem_regDate) {
		this.mem_regDate = mem_regDate;
	}



	public String getMem_phone() {
		return mem_phone;
	}



	public void setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
	}
	
	
	
	
	
}
