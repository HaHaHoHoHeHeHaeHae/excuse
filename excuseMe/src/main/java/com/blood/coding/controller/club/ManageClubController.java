package com.blood.coding.controller.club;

import java.sql.SQLException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.blood.coding.controller.common.Criteria;
import com.blood.coding.controller.common.MemberCriteria;
import com.blood.coding.controller.common.MemberPageMaker;
import com.blood.coding.controller.common.PageMaker;
import com.blood.coding.dto.club.ClubVO;
import com.blood.coding.service.club.ClubService;

@Controller
@RequestMapping("/manage/club")
public class ManageClubController {
	
	@Autowired
	private ClubService service;
	
	@RequestMapping("/clublist")
	public String memberSearchList(Criteria cri,Model model)throws Exception{
		String url="manage/club/clublist";
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		Map<String,Object> dataMap=service.getClubList(cri);
		
		model.addAllAttributes(dataMap);
		
		return url;		
	}
	
	@RequestMapping("/listSearch")
	public String noticeSearchList(Criteria cri,Model model)throws Exception{
		System.out.println(123);
		String url="manage/club/clublist";
		
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		Map<String,Object> dataMap=service.getClubList(cri);
		
		model.addAllAttributes(dataMap);
		
		return url;		
	}
	
	@RequestMapping("/detail") //동호회 상세보기
	public ModelAndView clubDetail(String club_no, ModelAndView modelnView) throws SQLException {
		String url = "manage/club/detail";
		Map dataMap =service.readClub(club_no);//디테일에 댓글보여야 되니까 readClub.(replycnt가 있음)
		
		modelnView.addObject("dataMap",dataMap);
		modelnView.setViewName(url);
		return modelnView;
	}
	
	
	

}
