package com.blood.coding.controller.club;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.blood.coding.controller.common.MemberCriteria;
import com.blood.coding.controller.common.MemberPageMaker;
import com.blood.coding.dto.member.MemberVO;
import com.blood.coding.dto.reply.ReplyVO;
import com.blood.coding.service.member.MemberService;


@Controller
@RequestMapping("/manage/user")
public class ManageUserController {
	
	
	@Autowired
	private MemberService service;
	
	
	
	@RequestMapping("/userlist")
	public String memberSearchList(MemberCriteria cri,Model model)throws Exception{
		String url="manage/user/userlist";
		
		MemberPageMaker pageMaker = new MemberPageMaker();
		pageMaker.setCri(cri);
		
		Map<String,Object> dataMap=service.memberlistByAdmin(pageMaker);
		
		model.addAllAttributes(dataMap);
		
		return url;		
	}
	
	@RequestMapping("/list")
	public String noticeSearchList(MemberCriteria cri,Model model)throws Exception{
		System.out.println(123);
		String url="manage/user/userlist";
		
		
		MemberPageMaker pageMaker = new MemberPageMaker();
		pageMaker.setCri(cri);
		
		Map<String,Object> dataMap=service.memberlistByAdmin(pageMaker);
		
		model.addAllAttributes(dataMap);
		
		return url;		
	}
	
	@RequestMapping("/detail")
	public String detail(String mem_id, Model model)throws Exception{
		System.out.println(mem_id);
		String url="manage/user/detail";
		MemberVO member = service.selectMember(mem_id);
		
		model.addAttribute("member", member);
		
		return url;
		
	}
	
	
	@RequestMapping(value="/status",method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> update(@RequestParam("mem_id") String mem_id) throws Exception{
		  System.out.println(123);
		  ResponseEntity<String> entity = null;
		  
		 
		  try {
		  service.updateMem(mem_id);
		  entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		  }catch(SQLException e) {
		  e.printStackTrace();
		  entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		  }
		  return entity;
  }
	
	
	/*@RequestMapping("/replyList")
	public String  memberReplyList(String mem_id, Model model)throws Exception{
		System.out.println(mem_id);
		String url="manage/user/replyList";
		ReplyVO reply = service.getReply(mem_id);
		
		model.addAttribute("reply", reply);
		
		return url;
		
	}
	*/
	@RequestMapping("/replyList")
	public ModelAndView memberReplyList(MemberCriteria cri,String mem_id)throws Exception{
		
		ModelAndView mav = new ModelAndView();
		
		String url="manage/user/replyList";
		System.out.println(1234);
		
		MemberPageMaker pageMaker = new MemberPageMaker();
		pageMaker.setCri(cri);
		
		List<ReplyVO> dataMap=service.getReply(mem_id);
		mav.setViewName(url);
		mav.addObject("dataMap",dataMap);
		mav.addObject("pageMaker", pageMaker);
		mav.addObject("mem_id", mem_id);
		
		return mav;		
	}
	
	
	
	

}
