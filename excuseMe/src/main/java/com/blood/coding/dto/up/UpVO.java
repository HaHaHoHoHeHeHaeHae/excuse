package com.blood.coding.dto.up;

public class UpVO {
	private int up_no;
	private String mem_id;
	private String club_no;
	
	public int getUp_no() {
		return up_no;
	}
	public void setUp_no(int up_no) {
		this.up_no = up_no;
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
	public UpVO(int up_no, String mem_id, String club_no) {
		super();
		this.up_no = up_no;
		this.mem_id = mem_id;
		this.club_no = club_no;
	}
	public UpVO() {
		super();
	}
	@Override
	public String toString() {
		return "UpVO [up_no=" + up_no + ", mem_id=" + mem_id + ", club_no=" + club_no + "]";
	}
	
	
}
