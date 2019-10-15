package com.blood.coding.controller.manage;

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

import com.blood.coding.controller.common.Criteria;
import com.blood.coding.controller.common.MemberCriteria;
import com.blood.coding.controller.common.PageMaker;
import com.blood.coding.dto.member.MemberVO;
import com.blood.coding.dto.reply.ReplyVO;
import com.blood.coding.service.member.MemberService;


@Controller
@RequestMapping("/manage/member")
public class ManageUserController {
	
	
	@Autowired
	private MemberService service;
	
	

	//회원목록
	@RequestMapping("/list")
	public ModelAndView memberList(MemberCriteria cri)throws Exception{
		String url="manage/member/list";
		ModelAndView mav = new ModelAndView();
		
		Map<String,Object> map=service.memberlistByAdmin(cri);
		mav.addObject("dataMap",map);
		mav.setViewName(url);
		
		return mav;		
	}
	@RequestMapping("/listForm")
	public ModelAndView memberListForm(MemberCriteria cri)throws Exception{
		String url="manage/member/list_form";
		ModelAndView mav = new ModelAndView();
		
		Map<String,Object> map=service.memberlistByAdmin(cri);
		mav.addObject("dataMap",map);
		mav.setViewName(url);
		
		return mav;		
	}
	
	//상세보기
	@RequestMapping("/detail")
	public String detail(String mem_id, Model model)throws Exception{
		System.out.println(mem_id);
		String url="manage/member/detail";
		MemberVO member = service.selectMember(mem_id);
		
		model.addAttribute("member", member);
		
		return url;
		
	}
	
	//활동중지
	@RequestMapping(value="/stopstatus",method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> updateStop(@RequestParam("mem_id") String mem_id) throws Exception{
		  ResponseEntity<String> entity = null;
		  
		  try {
			  service.updateStopMem(mem_id);
		  entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		  }catch(SQLException e) {
		  e.printStackTrace();
		  entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		  }
		  return entity;
  }
	//활동중지 해제
		@RequestMapping(value="/status",method=RequestMethod.POST)
		@ResponseBody
		public ResponseEntity<String> update(@RequestParam("mem_id") String mem_id) throws Exception{
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
	
	
	
	//멤버가 쓴 댓글 내역
	@RequestMapping("/replyList")
	public ModelAndView memberReplyList(MemberCriteria cri,String mem_id,String mem_name)throws Exception{
		
		ModelAndView mav = new ModelAndView();
		
		String url="manage/member/replyList";
		System.out.println(1234);
		
		Map<String,Object> dataMap=service.getReply(mem_id, cri);
		mav.setViewName(url);
		mav.addObject("dataMap",dataMap);
		mav.addObject("mem_name", mem_name);
		mav.addObject("mem_id", mem_id);
		return mav;		
	}
	
	
}
