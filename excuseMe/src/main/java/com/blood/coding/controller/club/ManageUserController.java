package com.blood.coding.controller.club;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.blood.coding.controller.common.MemberCriteria;
import com.blood.coding.controller.common.MemberPageMaker;
import com.blood.coding.dto.member.MemberVO;
import com.blood.coding.service.member.MemberService;


@Controller
@RequestMapping("/manage")
public class ManageUserController {
	
	
	@Autowired
	private MemberService service;
	
	@RequestMapping("/userlist")
	public String noticeSearchList(MemberCriteria cri,Model model)throws Exception{
		String url="manage/userlist";
		
		MemberPageMaker pageMaker = new MemberPageMaker();
		pageMaker.setCri(cri);
		
		Map<String,Object> dataMap=service.memberlistByAdmin(pageMaker);
		
		model.addAllAttributes(dataMap);
		
		return url;		
	}
	
	@RequestMapping("/detail")
	public String detail(String mem_id, Model model)throws Exception{
		System.out.println(mem_id);
		String url="manage/detail";
		MemberVO member = service.selectMember(mem_id);
		
		model.addAttribute("member", member);
		
		return url;
		
	}
	
	
	
	/*@RequestMapping(value="/status",method=RequestMethod.POST)
	public void updateStatus(MemberVO member, HttpServletResponse response)throws Exception{
		
		service.updateMem(memberVO);
		
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("window.opener.location.reload();");
		out.println("location.href='detail?bno="+board.getBno()+"';");
		out.println("</script>");
	}*/
	
	

}
