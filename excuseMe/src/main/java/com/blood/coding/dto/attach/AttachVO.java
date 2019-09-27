package com.blood.coding.dto.attach;

public class AttachVO {
	private int attach_no;
	private String attach_board; //첨부파일 구분자명
	private String attach_writer;//파일 등록자
	private String attach_path;//파일 경로
	private String attach_name;//파일 이름
	private String attach_uuid;
	private String attach_type; //확장자명
	private String attach_regDate;
	public int getAttach_no() {
		return attach_no;
	}
	public void setAttach_no(int attach_no) {
		this.attach_no = attach_no;
	}
	public String getAttach_board() {
		return attach_board;
	}
	public void setAttach_board(String attach_board) {
		this.attach_board = attach_board;
	}
	public String getAttach_writer() {
		return attach_writer;
	}
	public void setAttach_writer(String attach_writer) {
		this.attach_writer = attach_writer;
	}
	public String getAttach_path() {
		return attach_path;
	}
	public void setAttach_path(String attach_path) {
		this.attach_path = attach_path;
	}
	public String getAttach_name() {
		return attach_name;
	}
	public void setAttach_name(String attach_name) {
		this.attach_name = attach_name;
	}
	public String getAttach_uuid() {
		return attach_uuid;
	}
	public void setAttach_uuid(String attach_uuid) {
		this.attach_uuid = attach_uuid;
	}
	public String getAttach_type() {
		return attach_type;
	}
	public void setAttach_type(String attach_type) {
		this.attach_type = attach_type;
	}
	public String getAttach_regDate() {
		return attach_regDate;
	}
	public void setAttach_regDate(String attach_regDate) {
		this.attach_regDate = attach_regDate;
	}
	@Override
	public String toString() {
		return "AttachVO [attach_no=" + attach_no + ", attach_board=" + attach_board + ", attach_writer="
				+ attach_writer + ", attach_path=" + attach_path + ", attach_name=" + attach_name + ", attach_uuid="
				+ attach_uuid + ", attach_type=" + attach_type + ", attach_regDate=" + attach_regDate + "]";
	}
	public AttachVO(int attach_no, String attach_board, String attach_writer, String attach_path, String attach_name,
			String attach_uuid, String attach_type, String attach_regDate) {
		super();
		this.attach_no = attach_no;
		this.attach_board = attach_board;
		this.attach_writer = attach_writer;
		this.attach_path = attach_path;
		this.attach_name = attach_name;
		this.attach_uuid = attach_uuid;
		this.attach_type = attach_type;
		this.attach_regDate = attach_regDate;
	}
	public AttachVO() {
		super();
	}

	
	
}
