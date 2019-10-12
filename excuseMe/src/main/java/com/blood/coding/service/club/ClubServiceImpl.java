package com.blood.coding.service.club;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	/*private ReplyDAO replyDAO;
	public void setRelyDAO(ReplyDAO replyDAO) {
		this.replyDAO = replyDAO;
	}
 */
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
	public Map<String, Object> getClubList(Criteria cri,MemberVO memberVO) throws SQLException { //(매개변수에 memberVO추가)
		Map<String, Object> dataMap = new HashMap<String, Object>();


		cri.setPerPageNum(3);
		//cri.setLocal(memberVO.getMem_local());
		cri.setLocal("대전");
		cri.setAlignment(2);
		//검색창 돌릴때 추천동호회도 검색파라미터를 포함해서 가져오니까 강제 fix해주기
		cri.setLocal("");
		cri.setCategory("");
		cri.setKeyword("");
		
		//추천리스트
		List<ClubVO> recommendList = clubDAO.selectSearchClubList(cri);

		cri.setPerPageNum(10);
		cri.setAlignment(0);
		
		
		List<ClubVO> clubList = clubDAO.selectSearchClubList(cri);
		//List<CategoryVO> cateList = categoryDAO.selectCategoryList();
		//List<LocalVO> localList = localDAO.selectLocalList();
		
		int totalCount = clubDAO.selectSearchClubCount(cri);
		
			
		// pagination
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		
		//카테고리
		List<CategoryVO> categoryList = categoryDAO.selectCategoryList();

		//지역
		List<LocalVO> localList = localDAO.selectLocalList();

		// dataMap에 넣기
		dataMap.put("clubList", clubList);
		dataMap.put("pageMaker", pageMaker);
		dataMap.put("recommendList", recommendList);
		dataMap.put("member", memberVO);
		dataMap.put("cateList", categoryList);
		dataMap.put("localList", localList);

		return dataMap;
 	}

	//동호회 조회[디테일]:replycnt 있는거
	@Override
	public Map<String, Object> readClub(String club_no) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		//동호회 한개 
		ClubVO club = clubDAO.selectClub(club_no);
		
		//닉네임
		String memberId = club.getMem_id();
		MemberVO member = memberDAO.selectMember(memberId);
		String memberNick = member.getMem_nick();

		//첨부파일
		AttachVO attachVO = new AttachVO();
		String attach_board = attachVO.getAttach_board();
		attach_board=club_no;
		List<AttachVO> attachList = attachDAO.selectAttachesByAttachBoard(attach_board);
		
		
		//int replycnt = replyDAO.selectReplyListCount(club_no);
		//club.setReplycnt(replycnt);
		
		dataMap.put("club", club);
		dataMap.put("member", member);
		dataMap.put("memberNick", memberNick);
		dataMap.put("attachList", attachList);
		
		return dataMap;
	}

	// 그냥 하나 가져오는거-수정하기 전 단계(수정버튼을 클릭했을때)
	@Override
	public ClubVO getClub(String club_no) throws SQLException {
		ClubVO club = clubDAO.selectClub(club_no);
		return club;
	}

	@Override
	public void regist(ClubVO club) throws SQLException {
		clubDAO.insertClub(club);
	}

	//수정하고 submit버튼을 클릭했을때
	@Override
	public void modify(ClubVO club) throws SQLException {
		clubDAO.updateClub(club);
		

	}

	@Override
	public void remove(String club_no) throws SQLException {
		clubDAO.deleteClub(club_no);
	}

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
	public void updateClub(String club_no) throws SQLException {
		clubDAO.updateClubStatus(club_no);
	}

	@Override
	public void updateStopClub(String club_no) throws SQLException {
		clubDAO.updateStopClubStatus(club_no);
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

	//메이드 바이 우철 / 내가만든 클럽을 리스트 검색
	@Override
	public List<ClubVO> getMyClub(String mem_id) throws SQLException {
	
		List<ClubVO> myClubList = clubDAO.myClub(mem_id);
		
		return myClubList;
	}


	@Override
	public String getClubSeq() throws SQLException {
		int cno = clubDAO.selectClubSeq();
		String club_no = "c" + cno;
		return club_no;
	}


	@Override
	public int countClub(String club_name) throws SQLException {
		int count = clubDAO.selectClubCount(club_name);
		return count;
	}
	

}