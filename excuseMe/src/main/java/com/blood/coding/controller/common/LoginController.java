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

import com.blood.coding.dao.category.CategoryDAO;
import com.blood.coding.dto.category.CategoryVO;
import com.blood.coding.dto.local.LocalVO;
import com.blood.coding.dto.member.MemberVO;
import com.blood.coding.service.common.LocalService;
import com.blood.coding.service.common.LoginService;

@Controller
@RequestMapping("/common")
public class LoginController {
	@Autowired
	private LoginService service;
	
	@Autowired
	private CategoryDAO categoryDAO;
	
	@Resource(name="localService")
	private LocalService localService;
	
	
	@RequestMapping("/login")
	public String login() throws Exception{
		String URL = "common/login";
		return URL;
	}
	
	@RequestMapping("/test123")
	public String testwe() {
		return "/notice_sub/regist_test";
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
	@RequestMapping(value="/registCategory", method=RequestMethod.GET)
	public ResponseEntity<Object> ListSubCategory(@RequestParam("cate_name") String cate_name) throws Exception{

		ResponseEntity<Object> entity = null;
		try {
			int cate_no = categoryDAO.findCateNo(cate_name);
			System.out.println(cate_no);
			List<CategoryVO> categoryList = categoryDAO.selectSubCategoryList(cate_no);
			
			entity = new ResponseEntity<Object>(categoryList,HttpStatus.OK);
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
			String birthDate = memberVO.getBirthDate();

			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date mem_birthDate = transFormat.parse(birthDate);
			memberVO.setMem_birthDate(mem_birthDate);
			int check = memberVO.getMem_name_check();
			System.out.println(check);
			String id = memberVO.getMem_id();

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
	
	@RequestMapping(value="/searchId", method=RequestMethod.GET)
	public String searchIdGET() throws Exception{
		return "/common/searchId";
	}
	
	@RequestMapping(value="/searchId", method=RequestMethod.POST)
	public ResponseEntity<String> searchIdPOST(@RequestParam("mem_name") String mem_name, @RequestParam("mem_phone") String mem_phone, @RequestParam("mem_birthDate") String mem_birthDate) throws Exception{
		ResponseEntity<String> entity = null;
		MemberVO vo = new MemberVO();
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");

		Date birthDate = transFormat.parse(mem_birthDate);

		vo.setMem_birthDate(birthDate);
		vo.setMem_name(mem_name);
		vo.setMem_phone(mem_phone);
		
		try {
			String mem_id = service.idFind(vo);

			entity = new ResponseEntity<String>(mem_id,HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	@RequestMapping("/searchPwd")
	public String searchPwd() throws Exception{
		return "/common/searchPwd";
	}
	
	
	@RequestMapping("/findPwd")
	public ModelAndView findMemPwd(HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView();
		
		
		return mav;
	}
	
	//우철 수정함
	@RequestMapping(value = "/searchNickForCheck", method=RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<String> searchNickForCheck(@RequestParam("mem_nick") String mem_nick, HttpServletRequest request)throws Exception{
		System.out.println(mem_nick);
		int check = service.nickCheck(mem_nick);
		ResponseEntity<String> entity = null;
		
		//로그인한 유저가 있을시에 자기 닉네임을 중복검사시 사용가능 메세지가 뜨게한다.
		MemberVO loginUser = (MemberVO) request.getSession().getAttribute("loginUser");
		if(loginUser != null) {
			if(mem_nick.equals(loginUser.getMem_nick())) {
				check = 0;
			}
		}
			

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
	
	// By 우철 _ 멤버 정보 수정
	@RequestMapping(value = "/modify", method=RequestMethod.POST)
	public ResponseEntity<HttpStatus> modify(MemberVO memberVO, HttpServletRequest request) throws Exception{
		MemberVO loginUser = (MemberVO) request.getSession().getAttribute("loginUser");
		
		if(memberVO.getMem_pwd().length()>2)
			loginUser.setMem_pwd(memberVO.getMem_pwd());
		loginUser.setMem_nick(memberVO.getMem_nick());
		loginUser.setMem_local(memberVO.getMem_local());
		loginUser.setMem_phone(memberVO.getMem_phone());
		loginUser.setMem_id_check(memberVO.getMem_id_check());
		loginUser.setMem_name_check(memberVO.getMem_name_check());
		loginUser.setMem_phone_check(memberVO.getMem_phone_check());
		
		service.modify(loginUser);
		
		ResponseEntity<HttpStatus> entity =  new ResponseEntity<HttpStatus>(HttpStatus.OK);
			
		return entity;
	}
	
	
}
