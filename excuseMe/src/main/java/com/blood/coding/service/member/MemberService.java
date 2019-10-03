package com.blood.coding.service.member;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.blood.coding.controller.common.MemberCriteria;
import com.blood.coding.controller.common.MemberPageMaker;
import com.blood.coding.controller.common.PageMaker;
import com.blood.coding.dto.member.MemberVO;
import com.blood.coding.dto.reply.ReplyVO;

public interface MemberService {
	public List<MemberVO> memberList() throws SQLException;
	public List<MemberVO> memberlistByAdmin()throws SQLException;
	public List<MemberVO> memberlistByAdmin(MemberCriteria cri)throws SQLException;
	public Map<String,Object> memberlistByAdmin(MemberPageMaker pageMaker)throws SQLException;
	
	public MemberVO loginMember(String mem_id) throws SQLException;
	
	//멤버상세보기
	public MemberVO selectMember(String mem_id) throws SQLException;
	public MemberVO selectMember2(String mem_nick) throws SQLException;
	
	//멤버 댓글내용 보기
	public List<ReplyVO> getReply(String mem_id)throws SQLException;
	//멤버 탈퇴시키기
	public void updateMem(String mem_id) throws SQLException;
	
	

}
