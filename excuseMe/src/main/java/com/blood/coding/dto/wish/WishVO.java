package com.blood.coding.dto.wish;

public class WishVO {
	private int wish_no;
	private String mem_id;
	private String club_no;
	@Override
	public String toString() {
		return "wishVO [wish_no=" + wish_no + ", mem_id=" + mem_id + ", club_no=" + club_no + "]";
	}
	public int getWish_no() {
		return wish_no;
	}
	public void setWish_no(int wish_no) {
		this.wish_no = wish_no;
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
	public WishVO(int wish_no, String mem_id, String club_no) {
		super();
		this.wish_no = wish_no;
		this.mem_id = mem_id;
		this.club_no = club_no;
	}
	public WishVO() {
		super();
	}
	
	
}
