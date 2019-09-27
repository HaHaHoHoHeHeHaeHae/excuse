package com.blood.coding.dao.joinClub;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.blood.coding.controller.common.Criteria;
import com.blood.coding.dto.joinClub.JoinClubVO;

public class JoinClubDAOImpl implements JoinClubDAO {
	
	private SqlSession session;
	public void setSession(SqlSession session){
		this.session = session;
	}

	@Override
	public void insertJoinClub(JoinClubVO joinclub) throws SQLException {
		session.update("JoinClub-Mapper.insertJoinClub",joinclub);
	}
	

	@Override
	public void deleteJoinClub(String mem_id) throws SQLException {
		session.update("JoinClub-Mapper.deleteJoinClub",mem_id);
	}

	@Override
	public JoinClubVO selectJoinClub(JoinClubVO joinclub) throws SQLException {
		JoinClubVO join = session.selectOne("JoinClub-Mapper.selectJoinClub",joinclub);
		return join;
	}

	@Override
	public List<JoinClubVO> selectJoinClubList(Criteria cri, String mem_id) throws SQLException {
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		
		List<JoinClubVO> joinclubList = session.selectList("JoinClub-Mapper.selectJoinClubList",mem_id,rowBounds);
		
		return joinclubList;
	}

	@Override
	public List<JoinClubVO> selectMyClubList(Criteria cri, String club_no) throws SQLException {
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		List<JoinClubVO> joinclubList = session.selectList("JoinClub-Mapper.selectMyClubList",club_no,rowBounds);
		return joinclubList;
	}

	@Override
	public int selectJoinClubSeq() throws SQLException {
		int seq_num = session.selectOne("JoinClub-Mapper.selectJoinClubSeqNext");
		return seq_num;
	}





	

}
