package com.blood.coding.dto.joinClub;

import java.util.Date;

public class JoinClubVO {
	private int join_no;
	private String mem_id;
	private String club_no;
	private Date club_Date;
	
	private int downcnt;
	private int joincnt;
	private int upcnt;
	private String club_name;
	private String mem_nick;
	private int attachThum_no;

	
	public int getAttachThum_no() {
		return attachThum_no;
	}
	public void setAttachThum_no(int attachThum_no) {
		this.attachThum_no = attachThum_no;
	}
	public int getUpcnt() {
		return upcnt;
	}
	public void setUpcnt(int upcnt) {
		this.upcnt = upcnt;
	}
	public String getMem_nick() {
		return mem_nick;
	}
	public void setMem_nick(String mem_nick) {
		this.mem_nick = mem_nick;
	}
	public Date getClub_Date() {
		return club_Date;
	}
	public void setClub_Date(Date club_Date) {
		this.club_Date = club_Date;
	}
	public int getDowncnt() {
		return downcnt;
	}
	public void setDowncnt(int downcnt) {
		this.downcnt = downcnt;
	}
	public int getJoincnt() {
		return joincnt;
	}
	public void setJoincnt(int joincnt) {
		this.joincnt = joincnt;
	}
	public String getClub_name() {
		return club_name;
	}
	public void setClub_name(String club_name) {
		this.club_name = club_name;
	}

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
				+ club_Date + ", downcnt=" + downcnt + ", joincnt=" + joincnt + ", upcnt=" + upcnt + ", club_name="
				+ club_name + ", mem_nick=" + mem_nick + ", attachThum_no=" + attachThum_no + "]";
	}
	public JoinClubVO(int join_no, String mem_id, String club_no, Date club_Date, int downcnt, int joincnt, int upcnt,
			String club_name, String mem_nick, int attachThum_no) {
		this.join_no = join_no;
		this.mem_id = mem_id;
		this.club_no = club_no;
		this.club_Date = club_Date;
		this.downcnt = downcnt;
		this.joincnt = joincnt;
		this.upcnt = upcnt;
		this.club_name = club_name;
		this.mem_nick = mem_nick;
		this.attachThum_no = attachThum_no;
	}
	public JoinClubVO() {
		super();
	}
	
	
}
