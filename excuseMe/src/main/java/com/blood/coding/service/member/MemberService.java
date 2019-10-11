package com.blood.coding.service.member;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.blood.coding.controller.common.Criteria;
import com.blood.coding.controller.common.MemberCriteria;
import com.blood.coding.dto.member.MemberVO;
import com.blood.coding.dto.reply.ReplyVO;

public interface MemberService {
	public List<MemberVO> memberList() throws SQLException;
	public List<MemberVO> memberlistByAdmin()throws SQLException;
	public Map<String,Object> memberlistByAdmin(MemberCriteria cri)throws SQLException;
	
	
	public MemberVO loginMember(String mem_id) throws SQLException;
	
	//멤버상세보기
	public MemberVO selectMember(String mem_id) throws SQLException;
	public MemberVO selectMember2(String mem_nick) throws SQLException;
	
	//멤버 댓글내용 보기
	public Map<String, Object> getReply(String mem_id,MemberCriteria cri)throws SQLException;
	
	//회원상태 변경
	public void updateMem(String mem_id) throws SQLException;
	public void updateStopMem(String mem_id) throws SQLException;
	

}
