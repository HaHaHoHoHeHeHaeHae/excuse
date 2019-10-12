package com.blood.coding.dao.joinClub;

import java.sql.SQLException;
import java.util.List;

import com.blood.coding.controller.common.Criteria;
import com.blood.coding.dto.joinClub.JoinClubVO;

public interface JoinClubDAO {
	//동호회 가입
	public void insertJoinClub(JoinClubVO joinclub) throws SQLException;
	
	//동호회 탈퇴
	public void deleteJoinClub(JoinClubVO joinclub) throws SQLException;
	
	//동호회원인지 체크
	public JoinClubVO selectJoinClub(JoinClubVO joinclub) throws SQLException;
	
	//가입한 동호회 리스트
	public List<JoinClubVO> selectJoinClubList(Criteria cri, String mem_id) throws SQLException;
	
	//내 동호회의 동호회원 리스트
	public List<JoinClubVO> selectMyClubList(Criteria cri, String club_no) throws SQLException;

	//시퀀스 번호
	public int selectJoinClubSeq() throws SQLException;
}
