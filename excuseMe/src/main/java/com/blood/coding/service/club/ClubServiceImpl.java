package com.blood.coding.service.club;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.blood.coding.controller.common.Criteria;
import com.blood.coding.controller.common.PageMaker;
import com.blood.coding.dao.club.ClubDAO;
import com.blood.coding.dao.member.MemberDAO;
import com.blood.coding.dto.club.ClubVO;
import com.blood.coding.dto.member.MemberVO;

public class ClubServiceImpl implements ClubService {

	private ClubDAO clubDAO;
	public void setClubDAO(ClubDAO clubDAO) {
		this.clubDAO = clubDAO;
	}
	
/*	private AttachDAO attachDAO;
	public void setAttachDAO(AttachDAO attachDAO) {
		this.attachDAO = attachDAO;
	}

	private ReplyDAO replyDAO;
	public void setRelyDAO(ReplyDAO replyDAO) {
		this.replyDAO = replyDAO;
	}

	private UpDAO upDAO;
	public void setUpDAO(UpDAO upDAO) {
		this.upDAO = upDAO;
	}

	private DownDAO downDAO;
	public void setDownDAO(DownDAO downDAO) {
		this.downDAO = downDAO;
	}*/
	
	private MemberDAO memberDAO;
	public void setMemberDAO(MemberDAO memberDAO) {
		this.memberDAO=memberDAO;
	}
	
/*	private MemberVO memberVO;
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO=memberVO;
	}*/
	
	// wish랑 join은 나중에 협의해야함
	

	
	@Override
	public Map<String, Object> getClubList(Criteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<ClubVO> clubList = clubDAO.selectSearchClubList(cri);
		
		int totalCount = clubDAO.selectSearchClubCount(cri);
		
		/*int cno = clubDAO.selectClubSeq();
		System.out.println("+++++++++++++++++++++");
		System.out.println("+++++++++++++++++++++");
		System.out.println(cno);
		System.out.println("+++++++++++++++++++++");
		System.out.println("+++++++++++++++++++++");
		String club_no = "c_" + cno;
		for(ClubVO club : clubList) {
			int replycnt = replyDAO.selectReplyListCount(club_no);
			
			club.setReplycnt(replycnt);
		}
*/
		// pagination
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		
		
		// dataMap에 넣기
		dataMap.put("clubList", clubList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
 	}

	//동호회 조회[디테일]:replycnt 있는거
	//reply,attach,mem_nick이 나와야함
	@Override
	public Map readClub(String club_no) throws SQLException {
		Map dataMap = new HashMap();
		ClubVO club = clubDAO.selectClub(club_no);
		String mem_id = club.getMem_id();
		MemberVO member = memberDAO.selectMember(mem_id);

		
		
		// reply리스트(reply_no,mem_id,club_no,reply_content,reply_regDate)
		//int replycnt = replyDAO.selectReplyListCount(club_no);
		//club.setReplycnt(replycnt);
		dataMap.put("club", club);
		dataMap.put("member", member);
		
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
		int cno = clubDAO.selectClubSeq();
		String club_no = "c_" + cno;
		System.out.println(club_no);
		club.setClub_no(club_no);
		clubDAO.insertClub(club);
	}

	//수정하고 submit버튼을 클릭했을때
	@Override
	public void modify(ClubVO club) throws SQLException {
//		테스트
//		club.setMem_id("m_03");
//		club.setClub_name("태극권동호회");
//		club.setClub_content("허이짜 허이짜 몸과 마음을 단련해보세요");
//		club.setClub_local("충남 논산시");
//		club.setCate_name("운동");
//		club.setClub_no("c_16");
		
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
	public void updateClub(String club_no) throws SQLException {
		clubDAO.updateClubStatus(club_no);
	}

	@Override
	public void updateStopClub(String club_no) throws SQLException {
		clubDAO.updateStopClubStatus(club_no);
	}

}