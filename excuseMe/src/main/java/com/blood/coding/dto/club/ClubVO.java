package com.blood.coding.dto.club;

import java.util.Date;

public class ClubVO {
	private String club_no;
	private String mem_id;
	private int cate_no;
	private String club_name;
	private String club_content;
	private String club_status;
	private String club_local;
	private Date club_regDate;
	
	
	public Date getClub_regDate() {
		return club_regDate;
	}
	public void setClub_regDate(Date club_regDate) {
		this.club_regDate = club_regDate;
	}
	public String getClub_no() {
		return club_no;
	}
	public void setClub_no(String club_no) {
		this.club_no = club_no;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getCate_no() {
		return cate_no;
	}
	public void setCate_no(int cate_no) {
		this.cate_no = cate_no;
	}
	public String getClub_name() {
		return club_name;
	}
	public void setClub_name(String club_name) {
		this.club_name = club_name;
	}
	public String getClub_content() {
		return club_content;
	}
	public void setClub_content(String club_content) {
		this.club_content = club_content;
	}
	public String getClub_status() {
		return club_status;
	}
	public void setClub_status(String club_status) {
		this.club_status = club_status;
	}
	public String getClub_local() {
		return club_local;
	}
	public void setClub_local(String club_local) {
		this.club_local = club_local;
	}
	public ClubVO(String club_no, String mem_id, int cate_no, String club_name, String club_content, String club_status,
			String club_local, Date club_regDate) {
		super();
		this.club_no = club_no;
		this.mem_id = mem_id;
		this.cate_no = cate_no;
		this.club_name = club_name;
		this.club_content = club_content;
		this.club_status = club_status;
		this.club_local = club_local;
		this.club_regDate = club_regDate;
	}
	@Override
	public String toString() {
		return "ClubVO [club_no=" + club_no + ", mem_id=" + mem_id + ", cate_no=" + cate_no + ", club_name=" + club_name
				+ ", club_content=" + club_content + ", club_status=" + club_status + ", club_local=" + club_local
				+ ", club_regDate=" + club_regDate + "]";
	}
	public ClubVO() {
		super();
	}
	
	
	
}
