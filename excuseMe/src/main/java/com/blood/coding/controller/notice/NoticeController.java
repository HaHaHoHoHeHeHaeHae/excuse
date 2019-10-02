package com.blood.coding.controller.notice;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.blood.coding.controller.common.Criteria;
import com.blood.coding.dto.notice.NoticeVO;
import com.blood.coding.service.notice.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	private NoticeService service;
	
/*	@RequestMapping("/list_test")
	public String ListTest() throws Exception{
		return "/notice/list";
	}*/
	//리스트
	@RequestMapping("/list")
	public ModelAndView ListNotice(Criteria cri) throws Exception{
		String url="/notice/list";
		ModelAndView mav = new ModelAndView();
	
		Map<String, Object> map = service.noticeList(cri);
		mav.addObject("dataMap",map);
		mav.setViewName(url);
		
		return mav;
	}
	
	//상세보기
	
	@RequestMapping("/detail")
	public ModelAndView DetailNoticer(String not_no, String page) throws Exception{
		String url = "/notice/detail";
		

		ModelAndView mav = new ModelAndView();
		NoticeVO vo = service.noticeDetailByMember(not_no);
		mav.addObject("page",page);
		mav.addObject("notice",vo);
		mav.setViewName(url);
		
		return mav;
	}
	
	@RequestMapping("/noticeDetail")
	public ModelAndView DetailNotice(String not_no, String page) throws Exception{
		String url = "/notice_sub/detail_form";
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("page",page);
		NoticeVO vo = service.noticeDetailByMember(not_no);
		
		mav.addObject("notice",vo);
		mav.setViewName(url);
		
		return mav;
	}
	
	//등록, 수정, 삭제
	@RequestMapping(value="/regist", method=RequestMethod.GET)
	public String registGet() throws Exception{
		
		return "notice/regist";
	}
	
	@RequestMapping("/noticeRegist")
	public String noticeRegistForm() throws Exception{
		return "notice_sub/regist_form";
	}
	
	@RequestMapping(value="/regist", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Object> registPost(NoticeVO noticeVO) throws Exception{
		ResponseEntity<Object> entity = null;
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		try {
			String endDate = noticeVO.getNot_endDate2();
			String startDate = noticeVO.getNot_startDate2();
			Date not_startDate = transFormat.parse(startDate);
			Date not_endDate = transFormat.parse(endDate);
			noticeVO.setNot_startDate(not_startDate);
			noticeVO.setNot_endDate(not_endDate);
			service.registNotice(noticeVO);
			entity = new ResponseEntity<Object>(HttpStatus.OK);
		}catch(Exception e){
			entity = new ResponseEntity<Object>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;

	}
	
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public ModelAndView modifyGet(String not_no) throws Exception{
		String url = "/notice/modify";
		ModelAndView mav = new ModelAndView();
		NoticeVO vo = service.noticeDetailByAdmin(not_no);
		
		mav.addObject("notice",vo);
		mav.setViewName(url);
		
		return mav;
	}
	@RequestMapping(value="/noticeModify", method=RequestMethod.GET)
	public ModelAndView modifynotice(String not_no) throws Exception{
		String url = "/notice_sub/modify_form";
		ModelAndView mav = new ModelAndView();
		NoticeVO vo = service.noticeDetailByAdmin(not_no);
		
		mav.addObject("notice",vo);
		mav.setViewName(url);
		
		return mav;
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public ResponseEntity<Object> modifyPOST(NoticeVO noticeVO) throws Exception{
		ResponseEntity<Object> entity = null;
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		try {
			String endDate = noticeVO.getNot_endDate2();
			String startDate = noticeVO.getNot_startDate2();
			Date not_startDate = transFormat.parse(startDate);
			Date not_endDate = transFormat.parse(endDate);
			noticeVO.setNot_startDate(not_startDate);
			noticeVO.setNot_endDate(not_endDate);
			service.modifyNotice(noticeVO);
			entity = new ResponseEntity<Object>(HttpStatus.OK);
		}catch(Exception e){
			entity = new ResponseEntity<Object>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
		
	}
	
	@RequestMapping("/remove")
	public ResponseEntity<Object> noticeRemove(String not_no,HttpServletResponse response) throws Exception{
		ResponseEntity<Object> entity=null;
	
		try {
			service.removeNotice(not_no);
			entity = new ResponseEntity<Object>(HttpStatus.OK);
			
			
		}catch(Exception e){
			e.printStackTrace();
			entity= new ResponseEntity<Object>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;



		
	}
}
