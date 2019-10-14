package com.blood.coding.dto.wish;

public class WishVO {
	private int wish_no;
	private String mem_id;
	private String club_no;
	
	private int downcnt;
	private int upcnt;
	private int joincnt;
	private String club_name;
	private int attachThum_no;
	
	public int getAttachThum_no() {
		return attachThum_no;
	}
	public void setAttachThum_no(int attachThum_no) {
		this.attachThum_no = attachThum_no;
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
	public int getDowncnt() {
		return downcnt;
	}
	public void setDowncnt(int downcnt) {
		this.downcnt = downcnt;
	}
	public int getUpcnt() {
		return upcnt;
	}
	public void setUpcnt(int upcnt) {
		this.upcnt = upcnt;
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
	
	@Override
	public String toString() {
		return "WishVO [wish_no=" + wish_no + ", mem_id=" + mem_id + ", club_no=" + club_no + ", downcnt=" + downcnt
				+ ", upcnt=" + upcnt + ", joincnt=" + joincnt + ", club_name=" + club_name + ", attachThum_no="
				+ attachThum_no + "]";
	}
	public WishVO() {
		super();
	}
	public WishVO(int wish_no, String mem_id, String club_no, int downcnt, int upcnt, int joincnt, String club_name,
			int attachThum_no) {
		this.wish_no = wish_no;
		this.mem_id = mem_id;
		this.club_no = club_no;
		this.downcnt = downcnt;
		this.upcnt = upcnt;
		this.joincnt = joincnt;
		this.club_name = club_name;
		this.attachThum_no = attachThum_no;
	}
	
	
	
}
