package com.blood.coding.dto.club;

import java.util.Date;
import java.util.List;

import com.blood.coding.dto.attach.AttachVO;

public class ClubVO {
	private String club_no;
	private String mem_id;
	private String cate_name;
	private String club_name;
	private String club_content;
	private String club_status;
	private String club_local;
	private Date club_regDate;
	private int replycnt;
	private int upcnt;
	private int downcnt;
	private int joincnt;
	private int mi;
	private List<AttachVO> attachList;
	private int attachThum_no;
	
	
	
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
	public String getCate_name() {
		return cate_name;
	}
	public void setCate_name(String cate_name) {
		this.cate_name = cate_name;
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
	public Date getClub_regDate() {
		return club_regDate;
	}
	public void setClub_regDate(Date club_regDate) {
		this.club_regDate = club_regDate;
	}
	public int getReplycnt() {
		return replycnt;
	}
	public void setReplycnt(int replycnt) {
		this.replycnt = replycnt;
	}
	public int getUpcnt() {
		return upcnt;
	}
	public void setUpcnt(int upcnt) {
		this.upcnt = upcnt;
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
	public int getMi() {
		return mi;
	}
	public void setMi(int mi) {
		this.mi = mi;
	}
	public List<AttachVO> getAttachList() {
		return attachList;
	}
	public void setAttachList(List<AttachVO> attachList) {
		this.attachList = attachList;
	}
	public int getAttachThum_no() {
		return attachThum_no;
	}
	public void setAttachThum_no(int attachThum_no) {
		this.attachThum_no = attachThum_no;
	}
	@Override
	public String toString() {
		return "ClubVO [club_no=" + club_no + ", mem_id=" + mem_id + ", cate_name=" + cate_name + ", club_name="
				+ club_name + ", club_content=" + club_content + ", club_status=" + club_status + ", club_local="
				+ club_local + ", club_regDate=" + club_regDate + ", replycnt=" + replycnt + ", upcnt=" + upcnt
				+ ", downcnt=" + downcnt + ", joincnt=" + joincnt + ", mi=" + mi + ", attachList=" + attachList
				+ ", attachThum_no=" + attachThum_no + "]";
	}
	
	

	
}