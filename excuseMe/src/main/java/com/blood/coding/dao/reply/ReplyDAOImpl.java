package com.blood.coding.dao.reply;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.blood.coding.controller.common.Criteria;
import com.blood.coding.controller.common.MemberCriteria;
import com.blood.coding.dto.reply.ReplyVO;

public class ReplyDAOImpl implements ReplyDAO {
	
	private SqlSession session;
	public void setSession(SqlSession session){
		this.session = session;
	}

	@Override
	//댓글리스트
	public List<ReplyVO> selectReplyList(Criteria cri, String club_no) throws SQLException {
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		List<ReplyVO> replyList = session.selectList("Reply-Mapper.selectReplyList",club_no,rowBounds);
		
		return replyList;
	}

	@Override
	//댓글수
	public int selectReplyListCount(Criteria cri, String club_no) throws SQLException {
		int count = session.selectOne("Reply-Mapper.ReplyListCount",club_no);
		return count;
	}

	@Override
	public void insertReply(ReplyVO reply) throws SQLException {
		session.update("Reply-Mapper.insertReply",reply);
	}

	@Override
	public void updateReply(ReplyVO reply) throws SQLException {
		session.update("Reply-Mapper.updateReply",reply);


	}

	@Override
	public void deleteReply(int reply_no) throws SQLException {
		session.update("Reply-Mapper.deleteReply",reply_no);

	}

	@Override
	public int selectReplySeq() throws SQLException {
		int seq_num = session.selectOne("Reply-Mapper.selectReplySeqNext");
		return seq_num;
	}

	@Override
	public List<ReplyVO> selectMemberReply(MemberCriteria cri,String mem_id) throws SQLException {
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		List<ReplyVO> replyList = session.selectList("Reply-Mapper.selectMemberReply",mem_id,rowBounds);
		return replyList;
	}

	

	@Override
	public int selectMemberReplyCount(MemberCriteria cri, String mem_id) throws SQLException {
		
		int count = session.selectOne("Reply-Mapper.selectMemberReplyCount",mem_id);
		System.out.println(count);
		return count;
	}

	@Override
	public List<ReplyVO> selectMypageReply(MemberCriteria cri, String loginUser) throws SQLException {
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		List<ReplyVO> replyList = session.selectList("Reply-Mapper.selectMypageReply",loginUser,rowBounds);
		return replyList;
	}

	@Override
	public int selectMypageReplyCount(MemberCriteria cri, String loginUser) throws SQLException {
		return session.selectOne("Reply-Mapper.selectMypageReplyCount",loginUser);
	}

}
