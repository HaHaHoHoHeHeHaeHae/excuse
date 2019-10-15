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
		int alignment = cri.getAlignment();
		int sort = cri.getSort();
		RowBounds rowBounds = new RowBounds(startRowNum,limit);
		cri.setAlignment(alignment);
		cri.setSort(sort);
			
		List<ClubVO> clubList = session.selectList("Club.selectSearchClubList",cri,rowBounds);
		
		return clubList;
	}
	@Override
	public List<ClubVO> selectSearchClubListForAdmin(Criteria cri) throws SQLException {
		
		int startRowNum = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		int alignment = cri.getAlignment();
		int sort = cri.getSort();
		RowBounds rowBounds = new RowBounds(startRowNum,limit);
		cri.setAlignment(alignment);
		cri.setSort(sort);
			
		List<ClubVO> clubList = session.selectList("Club.selectSearchClubListForAdmin",cri,rowBounds);
		
		return clubList;
	}
	
	@Override
	public int selectSearchClubCount(Criteria cri) throws SQLException {
		int clubCnt = session.selectOne("Club.selectSearchClubCount",cri);
		return clubCnt;
	}
	@Override
	public int selectSearchClubCountForAdmin(Criteria cri) throws SQLException {
		int clubCnt = session.selectOne("Club.selectSearchClubCountForAdmin",cri);
		return clubCnt;
	}
	
	@Override
	public List<ClubVO> selectNewClubList(Criteria cri) throws SQLException {
		int startRowNum = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(startRowNum,limit);
		
		List<ClubVO> newclubList = session.selectList("Club.selectNewClubList",cri,rowBounds);
		return newclubList;
	}
	
	@Override
	public int selectNewClubListCount(Criteria cri) throws SQLException {
		int newcount = session.selectOne("Club.selectNewClubCount",cri);
		return newcount;
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
	public void updateClubStatus(String club_no) throws SQLException {
		session.update("Club.updateClubStatus",club_no);
	}


	@Override
	public void updateStopClubStatus(String club_no) throws SQLException {
		session.update("Club.updateStopClubStatus",club_no);
	}


	@Override
	public List<ClubVO> recommendClubMain(String mem_local) throws SQLException {
		List<ClubVO> list = session.selectList("Club.recommendClubMain",mem_local);
		return list;
		
	}


	@Override
	public List<ClubVO> recentClubMain() throws SQLException {
		List<ClubVO> list = session.selectList("Club.recentClubMain");
		
		return list;
	}
	
	//메이드 바이 우철 / 내가만든 클럽을 리스트 검색
	@Override
	public List<ClubVO> myClub(String mem_id) throws SQLException{
				
		List<ClubVO> list = session.selectList("Club.selectMyClub",mem_id);
		
		return list;
	}


	@Override
	public int selectClubCount(String club_name) throws SQLException {
		int count = session.selectOne("Club.selectClubCount", club_name);
		return count;
	}


	@Override
	public List<ClubVO> selectBlackList(Criteria cri) throws SQLException {
		int startRowNum = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		
		RowBounds rowBounds = new RowBounds(startRowNum,limit);
		List<ClubVO> blackList = session.selectList("Club.selectBlackList",cri,rowBounds);
		return blackList;
	}


	@Override
	public int selectBlackListCount(Criteria cri) throws SQLException {
		int count = session.selectOne("Club.selectBlackListCount",cri);
		return count;
	}

}
