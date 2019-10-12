package com.blood.coding.dto.joinClub;

import java.util.Date;

public class JoinClubVO {
	private int join_no;
	private String mem_id;
	private String club_no;
	private Date club_Date;
	private int downcnt;
	private int joincnt;
	private String club_name;
	
	public int getJoin_no() {
		return join_no;
	}
	public void setJoin_no(int join_no) {
		this.join_no = join_no;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getClub_no() {
		return club_no;
	}
	public void setClub_no(String club_no) {
		this.club_no = club_no;
	}
	@Override
	public String toString() {
		return "JoinClubVO [join_no=" + join_no + ", mem_id=" + mem_id + ", club_no=" + club_no + ", club_Date="
				+ club_Date + ", downcnt=" + downcnt + ", joincnt=" + joincnt + ", club_name=" + club_name + "]";
	}
	public JoinClubVO(int join_no, String mem_id, String club_no, Date club_Date, int downcnt, int joincnt,
			String club_name) {
		super();
		this.join_no = join_no;
		this.mem_id = mem_id;
		this.club_no = club_no;
		this.club_Date = club_Date;
		this.downcnt = downcnt;
		this.joincnt = joincnt;
		this.club_name = club_name;
	}
	public JoinClubVO() {
		super();
	}
	
	
}
