package com.blood.coding.service.joinclub;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.blood.coding.controller.common.Criteria;
import com.blood.coding.dto.joinClub.JoinClubVO;

public interface JoinClubService {

	//클럽에 가입한 멤버인지 확인할때
	// 멤버가 클럽에 가입할때
	public boolean registClub(JoinClubVO join)throws SQLException;
	
	//클럽에 가입한 멤버인지 확인할때
	//멤버가 틀럽에 탈퇴할때
	public boolean removeClub(JoinClubVO join)throws SQLException;
	
	
	//내가 가입한 클럽 리스트
	public Map<String, Object> selectJoinClubList(Criteria cri, String mem_id) throws SQLException;
	
	//내가 가입한 클럽 리스트 갯수
	
	//해당클럽에 가입한 멤버 리스트
	public Map<String, Object> selectMyClubList(Criteria cri, String club_no) throws SQLException;
	
	
}
