package com.blood.coding.dto.local;

public class LocalVO {
	private int local_no;
	private String local_name;
	private int local_sub_no;
	private String local_sub_name;
	public int getLocal_no() {
		return local_no;
	}
	public void setLocal_no(int local_no) {
		this.local_no = local_no;
	}
	public String getLocal_name() {
		return local_name;
	}
	public void setLocal_name(String local_name) {
		this.local_name = local_name;
	}
	public int getLocal_sub_no() {
		return local_sub_no;
	}
	public void setLocal_sub_no(int local_sub_no) {
		this.local_sub_no = local_sub_no;
	}
	public String getLocal_sub_name() {
		return local_sub_name;
	}
	public void setLocal_sub_name(String local_sub_name) {
		this.local_sub_name = local_sub_name;
	}
	
	private String club_local = local_name + "_" + local_sub_name;
	
	private String mem_local = local_name + "_" + local_sub_name;
	
	public String getMem_local() {
		return mem_local;
	}
	public void setMem_local(String mem_local) {
		this.mem_local = mem_local;
	}
	public String getClub_local() {
		return club_local;
	}
	public void setClub_local(String club_local) {
		this.club_local = club_local;
	}
	@Override
	public String toString() {
		return "LocalVO [local_no=" + local_no + ", local_name=" + local_name + ", local_sub_no=" + local_sub_no
				+ ", local_sub_name=" + local_sub_name + ", club_local=" + club_local + "]";
	}
	public LocalVO() {
		super();
	}
	public LocalVO(int local_no, String local_name) {
		super();
		this.local_no = local_no;
		this.local_name = local_name;
	}
	
	
	public LocalVO(int local_no, String local_name, int local_sub_no, String local_sub_name, String club_local,
			String mem_local) {
		super();
		this.local_no = local_no;
		this.local_name = local_name;
		this.local_sub_no = local_sub_no;
		this.local_sub_name = local_sub_name;
		this.club_local = club_local;
		this.mem_local = mem_local;
	}
	public LocalVO(int local_no, int local_sub_no, String local_sub_name) {
		super();
		this.local_no = local_no;
		this.local_sub_no = local_sub_no;
		this.local_sub_name = local_sub_name;
	}
	
	
}
