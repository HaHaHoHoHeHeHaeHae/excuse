package com.blood.coding.controller.notice;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	@RequestMapping("/detail/{not_no}")
	public ModelAndView DetailNotice(@PathVariable("not_no") String not_no) throws Exception{
		String url = "";
		ModelAndView mav = new ModelAndView();
		NoticeVO vo = service.noticeDetail(not_no);
		
		mav.addObject("noticeVO",vo);
		mav.setViewName(url);
		
		return mav;
	}
	
	//등록, 수정, 삭제
	
	@RequestMapping(value="/regist", method=RequestMethod.GET)
	public String registGet() throws Exception{
		return "notice/form";
	}
	
/*	@RequestMapping(value="/regist", method=RequestMethod.POST)
	public void registPost(NoticeVO noticeVO, HttpServletResponse response) throws Exception{
		
		service.registNotice(noticeVO);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('글등록을 완료했습니다.');");
		out.println("window.opener.location.reload(); window.close();");
		out.println("</script>");
	}*/
	
	@RequestMapping("/modify")
	public void noticeModify(NoticeVO noticeVO,HttpServletRequest request, HttpServletResponse response) throws Exception{
		service.modifyNotice(noticeVO);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println("<script>");
		out.println("alert('글을 수정하였습니다.');");
		out.println("window.opener.location.reload();");
		out.println("self.location.href='"+request.getContextPath()+"/board/notice/admin/detail/"+noticeVO.getNot_no()+"';");
		out.println("</script>");
	}
	
	@RequestMapping("/remove/{not_no}")
	public void noticeRemove(@PathVariable("nno") String not_no, HttpServletResponse response) throws Exception{
		service.removeNotice(not_no);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println("<script>");
		out.println("alert('글을 삭제하였습니다.');");
		out.println("window.opener.location.reload();window.close();");
		out.println("</script>");
	}
}
