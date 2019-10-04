package com.blood.coding.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.blood.coding.dto.down.DownVO;
import com.blood.coding.dto.up.UpVO;
import com.blood.coding.service.upndown.UpnDownService;

@Controller
@RequestMapping("upndown")
public class UpnDownController {
	
	@Autowired
	private UpnDownService service;
	
	//매핑의 예
	//http://localhost/coding/upndown/upcheck?mem_id=momo&club_no=c12
	
	@RequestMapping("upcheck")
	public void upCheck(UpVO up, HttpServletResponse response) throws Exception {
		System.out.println(up);
		boolean bool = service.registUp(up);
		
		System.out.println(bool);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		if(bool == false)
			out.println("alert('당신은 이미 추천을 하셨습니다.')");
		else
			out.println("alert('추천을 하셨습니다.')");
		out.println("</script>");
		
	}
	
	//매핑의 예
	//http://localhost/coding/upndown/downcheck?mem_id=momo&club_no=c12
	
	@RequestMapping("downcheck")
	public void downCheck(DownVO down, HttpServletResponse response) throws Exception {
		boolean bool = service.registDown(down);
		System.out.println(bool);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		if(bool == false)
			out.println("alert('당신은 이미 비추천을 하셨습니다.')");
		else
			out.println("alert('비추천을 하셨습니다.')");
		out.println("</script>");
	}	
	
	
}
