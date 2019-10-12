package com.blood.coding.dao.joinclub;

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
	
	//내가 가입한 동호회 리스트  페이징하기위한 카운트
	public int selectJoinClubListCount(String mem_id) throws SQLException;
	
	//내 동호회의 동호회원 리스트
	public List<JoinClubVO> selectMyClubList(Criteria cri, String club_no) throws SQLException;

	//내가 만든 동호회의 동호회원 리스트를 페이징하려고 갯수 가져오기
	public int selectMyClubListCount(String club_no) throws SQLException;
	
	//시퀀스 번호
	public int selectJoinClubSeq() throws SQLException;
}
