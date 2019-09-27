package com.blood.coding.dao.notice;

import java.sql.SQLException;
import java.util.List;

import com.blood.coding.controller.common.Criteria;
import com.blood.coding.dto.notice.NoticeVO;

public interface NoticeDAO {
	//리스트
	public List<NoticeVO> selectNoticeList(Criteria cri) throws SQLException;
	
	//페이지 카운트
	public int selectNoticeCount() throws SQLException;
	
	//등록,수정,삭제
	public void insertNotice(NoticeVO noticeVO) throws SQLException;
	public void updateNotice(NoticeVO noticeVO) throws SQLException;
	public void deleteNotice(String not_no) throws SQLException;
	
	//상세보기
	public NoticeVO selectNotice(String not_no) throws SQLException;
	
	//조회수 올리기
	public void updateNoticeViewcnt(String not_no) throws SQLException;
	
	//시퀀스 번호 받기(나중에 "n"붙여서 스트링으로 만드셈)
	public String selectNoticeSeq() throws SQLException;
}
