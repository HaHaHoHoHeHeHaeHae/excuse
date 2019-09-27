package com.blood.coding.service.club;

import java.sql.SQLException;
import java.util.List;

import com.blood.coding.dto.club.ClubVO;
import com.blood.coding.dto.member.MemberVO;

public interface ManageService {
	
	//동호회 리스트 가져오기
	public List<ClubVO> selectClubList() throws SQLException;
	
	//블랙 리스트 가져오기

	//신규동호회 승인
	
	//회원리스트 가져오기
	public List<MemberVO> selectMemberList() throws SQLException;

}
