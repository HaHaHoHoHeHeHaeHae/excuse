package com.blood.coding.service.joinclub;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.blood.coding.controller.common.Criteria;
import com.blood.coding.controller.common.PageMaker;
import com.blood.coding.dao.attach.AttachDAO;
import com.blood.coding.dao.joinclub.JoinClubDAO;
import com.blood.coding.dto.attach.AttachVO;
import com.blood.coding.dto.club.ClubVO;
import com.blood.coding.dto.joinClub.JoinClubVO;

public class JoinClubServiceImpl implements JoinClubService {

	private JoinClubDAO joinClubDAO;
	public void setJoinClubDAO(JoinClubDAO joinClubDAO) {
		this.joinClubDAO = joinClubDAO;
	}
	
	private AttachDAO attachDAO;
	public void setAttachDAO(AttachDAO attachDAO) {
		this.attachDAO = attachDAO;
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
	
	//내가 가입한 클럽 리스트 = 마이페이지 컨트롤러에서 사용함
	@Override
	public Map<String, Object> selectJoinClubList(Criteria cri, String mem_id) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<JoinClubVO> myjoinList = joinClubDAO.selectJoinClubList(cri, mem_id);
		
		for(JoinClubVO club : myjoinList) {
			String club_no = club.getClub_no();
			String attach_board = club_no + "c";
			AttachVO attachThum = attachDAO.selectAttachesByAttachBoardOne(attach_board);
			if(attachThum != null) {
				int attachNO = attachThum.getAttach_no();
				club.setAttachThum_no(attachNO);
			}
		}
		
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(joinClubDAO.selectJoinClubListCount(mem_id));
		
		
		dataMap.put("myjoinList", myjoinList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}
	
	//해당클럽에 가입한 멤버 리스트 = 마이페이지 컨트롤러에서 사용함
	@Override
	public Map<String, Object> selectMyClubList(Criteria cri, String club_no) throws SQLException {
		List<JoinClubVO> joinclubList = joinClubDAO.selectMyClubList(cri, club_no);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(joinClubDAO.selectMyClubListCount(club_no));
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		dataMap.put("joinclubList", joinclubList);
		dataMap.put("pageMaker", pageMaker);
		return dataMap;
	}

}
