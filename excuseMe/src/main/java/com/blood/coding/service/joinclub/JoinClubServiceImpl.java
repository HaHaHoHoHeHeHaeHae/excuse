package com.blood.coding.service.joinclub;

import java.sql.SQLException;
import java.util.List;

import com.blood.coding.controller.common.Criteria;
import com.blood.coding.dao.joinClub.JoinClubDAO;
import com.blood.coding.dto.joinClub.JoinClubVO;

public class JoinClubServiceImpl implements JoinClubService {

	private JoinClubDAO joinClubDAO;
	public void setJoinClubDAO(JoinClubDAO joinClubDAO) {
		this.joinClubDAO = joinClubDAO;
	}
	
	//클럽에 가입한 멤버인지 확인할때
	//멤버가 클럽에 가입할때
	@Override
	public boolean registClub(JoinClubVO join) throws SQLException {
		JoinClubVO joinVO = joinClubDAO.selectJoinClub(join);
		
		//널이 아니면 가입을 이미 한것
		if(joinVO != null) {
			return false;
		}
		else {
			joinClubDAO.insertJoinClub(join);
			return true;
		}
	}

	//클럽에 가입한 멤버인지 확인할때
	//멤버가 틀럽에 탈퇴할때
	@Override
	public boolean removeClub(JoinClubVO join) throws SQLException {
		JoinClubVO joinVO = joinClubDAO.selectJoinClub(join);
		
		//널이면 지울수가  없고 널이아니면 해당값을 지운다.
		if(joinVO == null) {
			return false;
		}
		else {
			joinClubDAO.deleteJoinClub(join);
			return true;
		}
	}
	//내가 가입한 클럽 리스트
	@Override
	public List<JoinClubVO> selectJoinClubList(Criteria cri, String mem_id) throws SQLException {
		
		return null;
	}
	//해당클럽에 가입한 멤버 리스트
	@Override
	public List<JoinClubVO> selectMyClubList(Criteria cri, String club_no) throws SQLException {
		
		return null;
	}

}
