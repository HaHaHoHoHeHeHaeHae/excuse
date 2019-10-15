package com.blood.coding.service.reply;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.blood.coding.controller.common.Criteria;
import com.blood.coding.controller.common.MemberCriteria;
import com.blood.coding.controller.common.MemberPageMaker;
import com.blood.coding.controller.common.PageMaker;
import com.blood.coding.dao.member.MemberDAO;
import com.blood.coding.dao.reply.ReplyDAO;
import com.blood.coding.dto.member.MemberVO;
import com.blood.coding.dto.reply.ReplyVO;

public class ReplyServiceImpl implements ReplyService {

	private ReplyDAO replyDAO;
	public void setReplyDAO (ReplyDAO replyDAO){
		this.replyDAO=replyDAO;
	}
	
	private MemberDAO memberDAO;
	public void setMemberDAO(MemberDAO memberDAO) {
		this.memberDAO=memberDAO;
	}

	@Override
	public Map<String, Object> getReplyList(String club_no, Criteria cri) throws SQLException {
		Map<String,Object> dataMap = new HashMap<String,Object>();	

		List<ReplyVO> replyList = replyDAO.selectReplyList(cri, club_no);

		int count = replyDAO.selectReplyListCount(cri, club_no);

		if(replyList != null) {
			for(ReplyVO reply : replyList) {
				String memberID = reply.getMem_id();
				MemberVO member = memberDAO.selectMember(memberID);
				String mem_nick = member.getMem_nick();
				reply.setMem_nick(mem_nick);
			}
		}
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(count);

		dataMap.put("replyList", replyList);
		dataMap.put("pageMaker",pageMaker);
		
		return dataMap;

	}

	@Override
	public void registReply(ReplyVO reply) throws SQLException {
		replyDAO.insertReply(reply);

	}

	@Override
	public void modifyReply(ReplyVO reply) throws SQLException {
		replyDAO.updateReply(reply);

	}

	@Override
	public void removeReply(int reply_no) throws SQLException {
		replyDAO.deleteReply(reply_no);

	}

	@Override
	public Map<String, Object> getMypageReplyList(MemberCriteria cri, String loginUser) throws SQLException {
		Map<String,Object> dataMap = new HashMap<String,Object>();	

		List<ReplyVO> replyList = replyDAO.selectMypageReply(cri, loginUser);
		int count = replyDAO.selectMypageReplyCount(cri, loginUser);
		
		MemberPageMaker pageMaker = new MemberPageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(count);

		dataMap.put("replyList", replyList);
		dataMap.put("pageMaker",pageMaker);
		dataMap.put("cri",cri);
		
		return dataMap;
		
	}

}