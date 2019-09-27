package com.blood.coding.dto.down;

public class DownVO {
	private int down_no;
	private String mem_id;
	private String club_no;
	
	public int getDown_no() {
		return down_no;
	}
	public void setDown_no(int down_no) {
		this.down_no = down_no;
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
		return "DownVO [down_no=" + down_no + ", mem_id=" + mem_id + ", club_no=" + club_no + "]";
	}
	public DownVO(int down_no, String mem_id, String club_no) {
		super();
		this.down_no = down_no;
		this.mem_id = mem_id;
		this.club_no = club_no;
	}
	public DownVO() {
		super();
	}
	
	
}
