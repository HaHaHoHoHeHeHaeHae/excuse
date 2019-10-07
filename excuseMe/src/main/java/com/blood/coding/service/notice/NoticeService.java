package com.blood.coding.service.notice;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.blood.coding.controller.common.Criteria;
import com.blood.coding.dto.notice.NoticeVO;

public interface NoticeService {
	
	//리스트
	public Map<String, Object> noticeList(Criteria cri) throws SQLException;
	public Map<String, Object> noticeListAll(Criteria cri) throws SQLException;
	public Map<String, List<NoticeVO>> noticeRecentList() throws SQLException;
	//상세보기
	public NoticeVO noticeDetailByAdmin(String not_no) throws SQLException;
	public NoticeVO noticeDetailByMember(String not_no) throws SQLException;
	
	//등록, 수정, 삭제
	public void registNotice(NoticeVO noticeVO) throws SQLException;
	public String noticeSeq() throws SQLException;
	public void modifyNotice(NoticeVO noticeVO) throws SQLException;
	public void removeNotice(String not_no) throws SQLException;

}
