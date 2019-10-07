package com.blood.coding.service.common;

import java.sql.SQLException;
import java.util.Map;

import com.blood.coding.controller.common.Criteria;
import com.blood.coding.dto.reply.ReplyVO;

public interface ReplyService {
	Map<String, Object> getReplyList(String club_no, Criteria cri) throws SQLException;
	
	void registReply(ReplyVO reply) throws SQLException;
	
	void modifyReply(ReplyVO reply) throws SQLException;
	
	void removeReply(int reply_no) throws SQLException;
}
