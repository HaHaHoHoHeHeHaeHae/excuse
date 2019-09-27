package com.blood.coding.dto.joinClub;

public class JoinClubVO {
	private int join_no;
	private String mem_id;
	private String club_no;
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
		return "JoinClubVO [join_no=" + join_no + ", mem_id=" + mem_id + ", club_no=" + club_no + "]";
	}
	public JoinClubVO(int join_no, String mem_id, String club_no) {
		super();
		this.join_no = join_no;
		this.mem_id = mem_id;
		this.club_no = club_no;
	}
	public JoinClubVO() {
		super();
	}
	
	
}
