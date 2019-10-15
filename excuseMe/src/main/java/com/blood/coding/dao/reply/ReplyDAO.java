package com.blood.coding.dao.reply;

import java.sql.SQLException;
import java.util.List;

import com.blood.coding.controller.common.Criteria;
import com.blood.coding.controller.common.MemberCriteria;
import com.blood.coding.dto.reply.ReplyVO;

public interface ReplyDAO {
	//리스트
	public List<ReplyVO> selectReplyList(Criteria cri, String club_no) throws SQLException;
	
	//카운트
	public int selectReplyListCount(Criteria cri, String club_no) throws SQLException;
	
	//입력, 수정, 삭제
	public void insertReply(ReplyVO replyVO) throws SQLException;
	public void updateReply(ReplyVO replyVO) throws SQLException;
	public void deleteReply(int reply_no) throws SQLException;
	
	//시퀀스
	public int selectReplySeq() throws SQLException;
	
	//유저가 쓴 댓글
	public List<ReplyVO> selectMemberReply(MemberCriteria cri,String mem_id) throws SQLException;
	public int selectMemberReplyCount(MemberCriteria cri, String mem_id)throws SQLException;
	
	//마이페이지 유저 댓글
	public List<ReplyVO> selectMypageReply(MemberCriteria cri, String loginUser) throws SQLException;
	public int selectMypageReplyCount(MemberCriteria cri, String loginUser) throws SQLException;
}
