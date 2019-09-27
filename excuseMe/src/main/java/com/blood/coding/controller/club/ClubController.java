package com.blood.coding.controller.club;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.blood.coding.controller.common.Criteria;
import com.blood.coding.dto.club.ClubVO;
import com.blood.coding.service.club.ClubService;

@Controller
@RequestMapping("/club")
public class ClubController {
	
	@Autowired
	private ClubService clubService;
	
	//private static final Logger logger = LoggerFactory.getLogger(ClubController.class);

	@RequestMapping("/list") //동호회 리스트보기
	public ModelAndView clubList(Criteria cri, ModelAndView modelnView) throws SQLException{
		String url = "/club/list";
		Map<String, Object> dataMap = clubService.getClubList(cri);
		modelnView.addObject("dataMap",dataMap);
		modelnView.setViewName(url);
		return modelnView;
	}
	
	@RequestMapping("/detail") //동호회 상세보기
	public ModelAndView clubDetail(String club_no, ModelAndView modelnView) throws SQLException {
		String url = "club/detail";
		Map dataMap = clubService.readClub(club_no);//디테일에 댓글보여야 되니까 readClub.(replycnt가 있음)
		
		modelnView.addObject("dataMap",dataMap);
		modelnView.setViewName(url);
		return modelnView;
	}
	
	@RequestMapping(value="/regist", method=RequestMethod.POST) //동호회 등록
	public void clubRegist(ClubVO club, HttpServletResponse response) throws SQLException, IOException{
		clubService.regist(club);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");//브라우저로 바로 넘겨버림. opener는 list.jsp입니다.
		out.println("window.opener.location.href='/club/list';window.close();");
		out.println("</script>");
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.GET) //디테일에서 수정버튼 누를때(수정하기 위해 가져온다)
	public void modifyClubForm(String club_no, Model model) throws SQLException{
		ClubVO club = clubService.getClub(club_no);
		model.addAttribute("club",club);
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.POST) //수정하고 submit버튼 누를때
	public void modifyClubUpdate(ClubVO club, HttpServletResponse response) throws SQLException, IOException{
		clubService.modify(club);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("window.opener.location.reload();"); //수정완료 버튼을 누르면 reload한번 하고
		out.println("location.href='detail?club_no="+club.getClub_no()+"';"); //club_no의 detail로 가세요
		out.println("</script>");
	}
	
	@RequestMapping(value="/remove", method=RequestMethod.GET)
	public void remove(String club_no, HttpServletResponse response) throws Exception {
		clubService.remove(club_no);
		response.setContentType("text/html;charset=urt-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("window.opener.location.reload();window.close();");//지웠으니까 reload한번 하고 창닫아죠
		out.println("</script>");
	}
}


























