package com.blood.coding.controller.main;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.blood.coding.dto.club.ClubVO;
import com.blood.coding.dto.member.MemberVO;
import com.blood.coding.dto.notice.NoticeVO;
import com.blood.coding.service.club.ClubService;
import com.blood.coding.service.member.MemberService;
import com.blood.coding.service.notice.NoticeService;

@Controller
@RequestMapping("/main")
public class MainController {
	@Autowired
	private NoticeService noticeService;
	@Resource(name="clubService")
	private ClubService clubService;
	@Resource(name="memberService")
	private MemberService memberService;
	
	@RequestMapping("/main_frame")
	public String test() throws Exception{
		return "main/main_frame";
	}
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public ModelAndView mainPage(String mem_nick) throws Exception{
		
		ModelAndView mav = new ModelAndView();
		String url = "/main/main";
		MemberVO memberVO = memberService.selectMember2(mem_nick);
		String mem_local = memberVO.getMem_local();
		
		Map<String, List<NoticeVO>> noticeMap = noticeService.noticeRecentList();
		Map<String, List<ClubVO>> clubMap1 = clubService.getClubListMain(mem_local);
		Map<String, List<ClubVO>> clubMap2 = clubService.getClubListMainRecent();
		
		mav.addObject("noticeList",noticeMap);
		mav.addObject("recommendClubList",clubMap1);
		mav.addObject("recentClubList",clubMap2);
		mav.setViewName(url);
		return mav;
	}
	@RequestMapping("/detail") //동호회 상세보기
	public ModelAndView clubDetail(String club_no, ModelAndView modelnView) throws SQLException {
		String url = "club/detail";
		Map<String, Object> dataMap = clubService.readClub(club_no);//디테일에 댓글보여야 되니까 readClub.(replycnt가 있음)
		
		modelnView.addObject("dataMap",dataMap);
		modelnView.setViewName(url);
		return modelnView;
	}
}
