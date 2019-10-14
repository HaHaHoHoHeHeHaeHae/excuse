package com.blood.coding.dto.reply;

import java.util.Date;

public class ReplyVO {
	private int reply_no;
	private String mem_id;
	private String club_no;
	private String reply_content;
	private Date reply_regDate;
	private String mem_nick;
	private String club_name;
	
	
	public String getClub_name() {
		return club_name;
	}
	public void setClub_name(String club_name) {
		this.club_name = club_name;
	}
	public int getReply_no() {
		return reply_no;
	}
	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
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
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public Date getReply_regDate() {
		return reply_regDate;
	}
	public void setReply_regDate(Date reply_regDate) {
		this.reply_regDate = reply_regDate;
	}
	
	public ReplyVO() {
		super();
	}

	public String getMem_nick() {
		return mem_nick;
	}
	public ReplyVO(int reply_no, String mem_id, String club_no, String reply_content, Date reply_regDate,
			String mem_nick, String club_name) {
		this.reply_no = reply_no;
		this.mem_id = mem_id;
		this.club_no = club_no;
		this.reply_content = reply_content;
		this.reply_regDate = reply_regDate;
		this.mem_nick = mem_nick;
		this.club_name = club_name;
	}
	public void setMem_nick(String mem_nick) {
		this.mem_nick = mem_nick;
	}
	@Override
	public String toString() {
		return "ReplyVO [reply_no=" + reply_no + ", mem_id=" + mem_id + ", club_no=" + club_no + ", reply_content="
				+ reply_content + ", reply_regDate=" + reply_regDate + ", mem_nick=" + mem_nick + ", club_name="
				+ club_name + "]";
	}
	

	
}
