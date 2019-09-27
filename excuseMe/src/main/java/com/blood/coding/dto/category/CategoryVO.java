package com.blood.coding.dto.category;

public class CategoryVO {
	private int cate_no;
	private String cate_name;
	private int cate_sub_no;
	private String cate_sub_name;
	
	
	public int getCate_no() {
		return cate_no;
	}
	public void setCate_no(int cate_no) {
		this.cate_no = cate_no;
	}
	public String getCate_name() {
		return cate_name;
	}
	public void setCate_name(String cate_name) {
		this.cate_name = cate_name;
	}
	public int getCate_sub_no() {
		return cate_sub_no;
	}
	public void setCate_sub_no(int cate_sub_no) {
		this.cate_sub_no = cate_sub_no;
	}
	public String getCate_sub_name() {
		return cate_sub_name;
	}
	public void setCate_sub_name(String cate_sub_name) {
		this.cate_sub_name = cate_sub_name;
	}
	
	private String club_category = cate_name + "" + cate_sub_name;
	

	public String getClub_categor() {
		return club_category;
	}
	public void setClub_category(String club_category) {
		this.club_category = club_category;
	}
	public CategoryVO(int cate_no, String cate_name, int cate_sub_no, String cate_sub_name, String club_category) {
		super();
		this.cate_no = cate_no;
		this.cate_name = cate_name;
		this.cate_sub_no = cate_sub_no;
		this.cate_sub_name = cate_sub_name;
		this.club_category = club_category;
	}
	public CategoryVO(int cate_no, String cate_name) {
		super();
		this.cate_no = cate_no;
		this.cate_name = cate_name;
	}
	public CategoryVO(int cate_no, int cate_sub_no, String cate_sub_name) {
		super();
		this.cate_no = cate_no;
		this.cate_sub_no = cate_sub_no;
		this.cate_sub_name = cate_sub_name;
	}
	public CategoryVO() {
		super();
	}
	
	
}
