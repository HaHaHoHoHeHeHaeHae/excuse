package com.blood.coding.dto.notice;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.blood.coding.dto.attach.AttachVO;

public class NoticeVO {
	private String not_no;
	private String mem_id;
	private Date not_startDate;
	private Date not_endDate;
	private String not_content;
	private String not_title;
	private int not_viewCnt;
	private Date not_regDate;
	private String not_startDate2;
	private String not_endDate2;
    private MultipartFile[] uploadFile;
    private List<AttachVO> attachList;
    private String attach_no;
    
	public String getAttach_no() {
		return attach_no;
	}

	public void setAttach_no(String attach_no) {
		this.attach_no = attach_no;
	}

	public List<AttachVO> getAttachList() {
		return attachList;
	}

	public void setAttachList(List<AttachVO> attachList) {
		this.attachList = attachList;
	}

	public MultipartFile[] getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(MultipartFile[] uploadFile) {
		this.uploadFile = uploadFile;
	}

	public String getNot_startDate2() {
		return not_startDate2;
	}

	public void setNot_startDate2(String not_startDate2) {
		this.not_startDate2 = not_startDate2;
	}

	public String getNot_endDate2() {
		return not_endDate2;
	}

	public void setNot_endDate2(String not_endDate2) {
		this.not_endDate2 = not_endDate2;
	}

	public NoticeVO(String not_no, String mem_id, Date not_startDate, Date not_endDate, String not_content,
			String not_title, int not_viewCnt, Date not_regDate) {
		super();
		this.not_no = not_no;
		this.mem_id = mem_id;
		this.not_startDate = not_startDate;
		this.not_endDate = not_endDate;
		this.not_content = not_content;
		this.not_title = not_title;
		this.not_viewCnt = not_viewCnt;
		this.not_regDate = not_regDate;
	}

	public NoticeVO() {
		this("","",null,null,"","",0,null);
	}



	@Override
	public String toString() {
		return "NoticeVO [not_no=" + not_no + ", mem_id=" + mem_id + ", not_startDate=" + not_startDate
				+ ", not_endDate=" + not_endDate + ", not_content=" + not_content + ", not_title=" + not_title
				+ ", not_viewCnt=" + not_viewCnt + ", not_regDate=" + not_regDate + "]";
	}

	public String getNot_no() {
		return not_no;
	}

	public void setNot_no(String not_no) {
		this.not_no = not_no;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public Date getNot_startDate() {
		return not_startDate;
	}

	public void setNot_startDate(Date not_startDate) {
		this.not_startDate = not_startDate;
	}

	public Date getNot_endDate() {
		return not_endDate;
	}

	public void setNot_endDate(Date not_endDate) {
		this.not_endDate = not_endDate;
	}

	public String getNot_content() {
		return not_content;
	}

	public void setNot_content(String not_content) {
		this.not_content = not_content;
	}

	public String getNot_title() {
		return not_title;
	}

	public void setNot_title(String not_title) {
		this.not_title = not_title;
	}

	public int getNot_viewCnt() {
		return not_viewCnt;
	}

	public void setNot_viewCnt(int not_viewCnt) {
		this.not_viewCnt = not_viewCnt;
	}

	public Date getNot_regDate() {
		return not_regDate;
	}

	public void setNot_regDate(Date not_regDate) {
		this.not_regDate = not_regDate;
	}
	
	
}
