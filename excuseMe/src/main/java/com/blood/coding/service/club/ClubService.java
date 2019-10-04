package com.blood.coding.service.club;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.blood.coding.controller.common.Criteria;
import com.blood.coding.dto.club.ClubVO;
import com.blood.coding.dto.member.MemberVO;

public interface ClubService {
	
	//리스트+페이지메이커
	//Map<String,Object> getClubList(Criteria cri) throws SQLException;
	Map<String,Object> getClubList(Criteria cri, MemberVO memberVO) throws SQLException;
	
	Map readClub(String club_no) throws SQLException;	
	ClubVO getClub(String club_no) throws SQLException;
	
	//등록
	void regist(ClubVO club) throws SQLException;
	
	//수정
	void modify(ClubVO club) throws SQLException;
	
	//삭제
	void remove(String club_no) throws SQLException;
	
	//신규동호회리스트(관리자페이지에서만)
	Map<String,Object> getNewClubList(Criteria cri) throws SQLException;
	
	//Made by minho
	Map<String,List<ClubVO>> getClubListMain(String mem_local) throws SQLException;
	Map<String,List<ClubVO>> getClubListMainRecent() throws SQLException;
	
	//메이드 바이 우철 / 내가만든 클럽을 리스트 검색
	public List<ClubVO> getMyClub(String mem_id) throws SQLException;
}
