package com.blood.coding.service.club;

import java.sql.SQLException;
import java.util.Map;

import com.blood.coding.controller.common.Criteria;
import com.blood.coding.dto.club.ClubVO;

public interface ClubService {
	
	//리스트+페이지메이커
	Map<String,Object> getClubList(Criteria cri) throws SQLException;
	
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
	
	//동호회 승인 및 운영중지
	public void updateClub(String club_no) throws SQLException;
	public void updateStopClub(String club_no) throws SQLException;
}
