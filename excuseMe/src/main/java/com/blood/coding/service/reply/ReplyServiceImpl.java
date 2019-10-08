package com.blood.coding.service.reply;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.blood.coding.controller.common.Criteria;
import com.blood.coding.controller.common.PageMaker;
import com.blood.coding.dao.reply.ReplyDAO;
import com.blood.coding.dto.reply.ReplyVO;

public class ReplyServiceImpl implements ReplyService {

	private ReplyDAO replyDAO;
	public void setReplyDAO (ReplyDAO replyDAO){
		this.replyDAO=replyDAO;
	}

	@Override
	public Map<String, Object> getReplyList(String club_no, Criteria cri) throws SQLException {
		Map<String,Object> dataMap = new HashMap<String,Object>();	

		List<ReplyVO> replyList = replyDAO.selectReplyList(cri, club_no);

		int count = replyDAO.selectReplyListCount(cri, club_no);

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

}