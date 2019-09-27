package com.blood.coding.controller.common;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.blood.coding.dto.local.LocalVO;
import com.blood.coding.dto.member.MemberVO;
import com.blood.coding.service.common.LocalService;
import com.blood.coding.service.common.LoginService;

@Controller
@RequestMapping("/common")
public class LoginController {
	@Autowired
	private LoginService service;
	
	@Resource(name="localService")
	private LocalService localService;
	
	@RequestMapping("/login")
	public String login() throws Exception{
		String URL = "common/login";
		return URL;
	}
	
	
/*	@RequestMapping("/login")
	public String login(MemberVO memberVO) throws Exception{
		String URL = "/common/login";
		String check = service.loginCheck(memberVO);
		if(check.equals("success")) {
			
		}else if(check.equals("fail")) {
			
		}
		return URL;
	}*/
	@RequestMapping("/regist")
	public ModelAndView registMember() throws Exception{
		ModelAndView mav = new ModelAndView();
		String url = "/common/regist";
		
		Map<String,List<LocalVO>> map = localService.localList();
		
		mav.addObject("localList", map);
		mav.setViewName(url);
		return mav;
	}
	
	@RequestMapping(value = "/registLocal", method=RequestMethod.GET)
	public ResponseEntity<Object> ListSubLocal(@RequestParam("local_name") String local_name) throws Exception{

		ResponseEntity<Object> entity = null;
		try {
			int local_no = localService.localNo(local_name);
			System.out.println(local_no);
			List<LocalVO> localList = localService.subLocalList(local_no);
			
			entity = new ResponseEntity<Object>(localList,HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Object>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	@RequestMapping(value = "/signup", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Object> signUp(MemberVO memberVO) throws Exception{
		ResponseEntity<Object> entity = null;
		
		try {
			String id = memberVO.getMem_id();
			System.out.println(id);
			service.signUp(memberVO);
			entity = new ResponseEntity<Object>(id,HttpStatus.OK);
			
			
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Object>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	@RequestMapping("/searchIdPwd")
	public String searchIdPwd() throws Exception{
		return "/common/searchIdPwd";
	}
	
	@RequestMapping("/searchId")
	public String searchId() throws Exception{
		return "/common/searchId";
	}
	@RequestMapping("/searchPwd")
	public String searchPwd() throws Exception{
		return "/common/searchPwd";
	}
	@RequestMapping("/findId")
	public ModelAndView findMemId(HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView();
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		String mem_name = request.getParameter("mem_name");
		String mem_phone = request.getParameter("mem_phone");
		Date mem_birthDate =  transFormat.parse(request.getParameter("mem_birthDate"));
		
		MemberVO vo = new MemberVO();
		vo.setMem_birthDate(mem_birthDate);
		vo.setMem_name(mem_name);
		vo.setMem_phone(mem_phone);
		
		String mem_id = service.idFind(vo);
		vo.setMem_id(mem_id);
		mav.addObject("memberVO",vo);
		mav.setViewName("/findId");
		return mav;
		
	}
	
	@RequestMapping("/findPwd")
	public ModelAndView findMemPwd(HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView();
		
		
		return mav;
	}
	
	@RequestMapping(value = "/searchNickForCheck", method=RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<String> searchNickForCheck(@RequestParam("mem_nick") String mem_nick)throws Exception{
		System.out.println(mem_nick);
		int check = service.nickCheck(mem_nick);
		ResponseEntity<String> entity = null;
		

		if(check>=1) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
			
		}else {
			
			entity = new ResponseEntity<String>(mem_nick,HttpStatus.OK);
		}
			
		return entity;
	}
	@RequestMapping(value = "/searchIdForCheck", method=RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<String> searchIdForCheck(@RequestParam("mem_id") String mem_id)throws Exception{
		System.out.println(mem_id);
		int check = service.idCheck(mem_id);
		ResponseEntity<String> entity = null;
		

		if(check>=1) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
			
		}else {
			
			entity = new ResponseEntity<String>(mem_id,HttpStatus.OK);
		}
			
		return entity;
	}
	@RequestMapping(value = "/test", method=RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<String> test()throws Exception{
		ResponseEntity<String> entity =  new ResponseEntity<String>("1",HttpStatus.OK);
		return entity;
	}
}
