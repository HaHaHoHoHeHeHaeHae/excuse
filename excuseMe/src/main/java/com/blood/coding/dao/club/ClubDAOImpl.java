package com.blood.coding.dao.club;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.blood.coding.controller.common.Criteria;
import com.blood.coding.dto.club.ClubVO;

public class ClubDAOImpl implements ClubDAO {
	
	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session=session;
	}
	

	@Override
	public List<ClubVO> selectSearchClubList(Criteria cri) throws SQLException {
		
		int startRowNum = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(startRowNum,limit);
		
		List<ClubVO> clubList = session.selectList("Club.selectSearchClubList",cri,rowBounds);
		
		return clubList;
	}

	@Override
	public int selectSearchClubCount(Criteria cri) throws SQLException {
		int clubCnt = session.selectOne("Club.selectSearchClubCount",cri);
		return clubCnt;
	}

	@Override
	public ClubVO selectClub(String club_no) throws SQLException {
		ClubVO clubDetail = session.selectOne("Club.selectClub",club_no);
		return clubDetail;
	}

	@Override
	public int selectClubSeq() throws SQLException {
		int club_seq = session.selectOne("Club.selectClubSeq");
		return club_seq;
	}

	@Override
	public void insertClub(ClubVO clubVO) throws SQLException {
		session.update("Club.insertClub",clubVO);

	}

	@Override
	public void updateClub(ClubVO clubVO) throws SQLException {
		session.update("Club.updateClub",clubVO);

	}

	@Override
	public void deleteClub(String club_no) throws SQLException {
		session.update("Club.deleteClub",club_no);

	}

	@Override
	public void updateClubStatus(ClubVO clubVO) throws SQLException {
		session.update("Club.updateClubStatus",clubVO);

	}

}
