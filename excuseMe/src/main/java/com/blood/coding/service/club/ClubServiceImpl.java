package com.blood.coding.service.club;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.rmi.ssl.SslRMIClientSocketFactory;

import com.blood.coding.controller.common.Criteria;
import com.blood.coding.controller.common.PageMaker;
import com.blood.coding.dao.attach.AttachDAO;
import com.blood.coding.dao.category.CategoryDAO;
import com.blood.coding.dao.club.ClubDAO;
import com.blood.coding.dao.down.DownDAO;
import com.blood.coding.dao.local.LocalDAO;
import com.blood.coding.dao.member.MemberDAO;
import com.blood.coding.dao.up.UpDAO;
import com.blood.coding.dto.attach.AttachVO;
import com.blood.coding.dto.category.CategoryVO;
import com.blood.coding.dto.club.ClubVO;
import com.blood.coding.dto.local.LocalVO;
import com.blood.coding.dto.member.MemberVO;

public class ClubServiceImpl implements ClubService {

	private ClubDAO clubDAO;
	public void setClubDAO(ClubDAO clubDAO) {
		this.clubDAO = clubDAO;
	}
	
	private AttachDAO attachDAO;
	public void setAttachDAO(AttachDAO attachDAO) {
		this.attachDAO = attachDAO;
	}

	private UpDAO upDAO;
	public void setUpDAO(UpDAO upDAO) {
		this.upDAO = upDAO;
	}

	private DownDAO downDAO;
	public void setDownDAO(DownDAO downDAO) {
		this.downDAO = downDAO;
	}
	
	private MemberDAO memberDAO;
	public void setMemberDAO(MemberDAO memberDAO) {
		this.memberDAO=memberDAO;
	}
	
	private CategoryDAO categoryDAO;
	public void setCategoryDAO(CategoryDAO categoryDAO) {
		this.categoryDAO=categoryDAO;
	}
	
	private LocalDAO localDAO;
	public void setLocalDAO(LocalDAO localDAO) {
		this.localDAO=localDAO;
	}
	

	
	@Override
	public Map<String, Object> getClubList(Criteria cri,MemberVO memberVO) throws SQLException { //(매개�??��?�� memberVO추�?)
		Map<String, Object> dataMap = new HashMap<String, Object>();
		//추천동호회 세팅
		Criteria cri1 = new Criteria();
		cri1.setPerPageNum(3);
		cri1.setAlignment(2);
		cri1.setLocal(memberVO.getMem_local());

		//추천동호회
		List<ClubVO> recommendList = clubDAO.selectSearchClubList(cri1);
		
		//추천동호회 대표사진
		for(ClubVO reco : recommendList) {
			String club_no = reco.getClub_no();
			String attach_board = club_no + "c";
			AttachVO attachThum = attachDAO.selectAttachesByAttachBoardOne(attach_board);
			int attachNO = attachThum.getAttach_no();
			reco.setAttachThum_no(attachNO);

			System.out.println(reco);
		}
		
		//카테고리
		List<CategoryVO> categoryList = categoryDAO.selectCategoryList();

		//지역
		List<LocalVO> localList = localDAO.selectLocalList();
		
		//동호회리스트
		List<ClubVO> clubList = clubDAO.selectSearchClubList(cri);

		int totalCount = clubDAO.selectSearchClubCount(cri);
		
		//동호회대표사진
		for(ClubVO club : clubList) {
			String club_no = club.getClub_no();
			String attach_board = club_no + "c";
			AttachVO attachThum = attachDAO.selectAttachesByAttachBoardOne(attach_board);
			int attachNO = attachThum.getAttach_no();
			club.setAttachThum_no(attachNO);
			
			System.out.println(attachThum);
		}
		
		// pagination
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		dataMap.put("clubList", clubList);
		dataMap.put("pageMaker", pageMaker);
		dataMap.put("recommendList", recommendList);
		dataMap.put("member", memberVO);
		dataMap.put("cateList", categoryList);
		dataMap.put("localList", localList);
		

		return dataMap;
 	}


	@Override
	public Map<String, Object> readClub(String club_no) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		//one club
		ClubVO club = clubDAO.selectClub(club_no);
	
		//nickName
		String memberId = club.getMem_id();
		MemberVO member = memberDAO.selectMember(memberId);
		String memberNick = member.getMem_nick();

		//attach
		AttachVO attachVO = new AttachVO();
		String attach_board = attachVO.getAttach_board();
		attach_board=club_no;
		List<AttachVO> attachList = attachDAO.selectAttachesByAttachBoard(attach_board);
		
		//썸네일
		club.getClub_no();
		String attach_board_no = club_no + "c";
		AttachVO attachThum = attachDAO.selectAttachesByAttachBoardOne("c1c");
		int attachNO = attachThum.getAttach_no();
		club.setAttachThum_no(attachNO);
		
		System.out.println(club);
		
		dataMap.put("club", club);
		dataMap.put("member", member);
		dataMap.put("memberNick", memberNick);
		dataMap.put("attachList", attachList);
		
		return dataMap;
	}

	// 그냥 ?��?�� �??��?��?���?-?��?��?���? ?�� ?���?(?��?��버튼?�� ?���??��?��?��)
	@Override
	public ClubVO getClub(String club_no) throws SQLException {
		ClubVO club = clubDAO.selectClub(club_no);
		return club;
	}

	@Override
	public void regist(ClubVO club) throws SQLException {
		int cno = clubDAO.selectClubSeq();
		String club_no = "c_" + cno;
		//System.out.println(club_no);
		club.setClub_no(club_no);
		clubDAO.insertClub(club);
	}

	//?��?��?���? submit버튼?�� ?���??��?��?��
	@Override
	public void modify(ClubVO club) throws SQLException {
		clubDAO.updateClub(club);
		

	}

	@Override
	public void remove(String club_no) throws SQLException {
		clubDAO.deleteClub(club_no);
	}
	
	
//관리자
	@Override
	public Map<String, Object> getNewClubList(Criteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<ClubVO> newclubList = clubDAO.selectNewClubList(cri);
		
		int totalCount = clubDAO.selectNewClubListCount(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		
		dataMap.put("newclubList", newclubList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}


	@Override
	public Map<String, List<ClubVO>> getClubListMain(String mem_local) throws SQLException {
		Map<String, List<ClubVO>> map = new HashMap();
		List<ClubVO> list = clubDAO.recommendClubMain(mem_local);
		map.put("recommendClubList", list);
		return map;
	}


	@Override
	public Map<String, List<ClubVO>> getClubListMainRecent() throws SQLException {
		Map<String, List<ClubVO>> map = new HashMap();
		List<ClubVO> list = clubDAO.recentClubMain();
		map.put("recentClubList", list);
		return map;
	}

	@Override
	public Map<String, Object> getClubListByAdmin(Criteria cri, MemberVO memberVO) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> getBlackList(Criteria cri) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateClub(String club_no) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateStopClub(String club_no) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<ClubVO> getMyClub(String mem_id) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}