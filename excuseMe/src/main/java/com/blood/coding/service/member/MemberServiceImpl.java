package com.blood.coding.service.member;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.blood.coding.controller.common.MemberCriteria;
import com.blood.coding.controller.common.MemberPageMaker;
import com.blood.coding.dao.member.MemberDAO;
import com.blood.coding.dao.reply.ReplyDAO;
import com.blood.coding.dto.member.MemberVO;
import com.blood.coding.dto.reply.ReplyVO;

public class MemberServiceImpl implements MemberService {
	
	private MemberDAO memberDAO;
	public void setMemberDAO(MemberDAO memberDAO) {
		this.memberDAO = memberDAO;
	}
	
	private ReplyDAO replyDAO;
	public void setReplyDAO(ReplyDAO replyDAO) {
		this.replyDAO = replyDAO;
	}
	
	@Override
	public List<MemberVO> memberList() throws SQLException {
		List<MemberVO> list = memberDAO.selectMemberList();
		return list;
	}
	@Override
	public MemberVO loginMember(String mem_id) throws SQLException {
		MemberVO member = memberDAO.loginMain(mem_id);
		return member;
	}
	
	
	@Override
	public Map<String, Object> memberlistByAdmin(MemberCriteria cri) throws SQLException {
		Map<String,Object> map = new HashMap<String,Object>();
		List<MemberVO> memberList = memberDAO.selectMemberList(cri);
		
		MemberPageMaker page = new MemberPageMaker();
		
		int totalCount = memberDAO.selectMemberListCount(cri);
		page.setCri(cri);
		page.setTotalCount(totalCount);
		
		//System.out.println(cri+"/"+totalCount);
		map.put("pageMaker", page);
		map.put("memberList",memberList);
		return map;
	}
	
	@Override
	public MemberVO selectMember(String mem_id) throws SQLException {
		MemberVO member= memberDAO.selectMember(mem_id);
		return member;
	}
	@Override
	public MemberVO selectMember2(String mem_nick) throws SQLException {
		MemberVO member= memberDAO.selectMember2(mem_nick);
		return member;
	}
	@Override
	public List<ReplyVO> getReply(String mem_id) throws SQLException {
		List<ReplyVO> replylist = replyDAO.selectMemberReply(mem_id);
		return replylist;
	}
	
	@Override
	public void updateStopMem(String mem_id) throws SQLException {
		memberDAO.updateStopMemberStatus(mem_id);
	}


	@Override
	public void updateMem(String mem_id) throws SQLException {
		memberDAO.updateMemberStatus(mem_id);
		
	}


	@Override
	public List<MemberVO> memberlistByAdmin() throws SQLException {
		List<MemberVO> memberList = memberDAO.selectMemberList();
		return memberList;
	}

	


	

	

	

	

	
}
