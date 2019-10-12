package com.blood.coding.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.blood.coding.dto.down.DownVO;
import com.blood.coding.dto.up.UpVO;
import com.blood.coding.service.upndown.UpnDownService;
import com.sun.mail.imap.protocol.Status;

@Controller
public class UpnDownController {
	
	@Autowired
	private UpnDownService service;
	
	//매핑의 예
	//http://localhost/coding/upcheck?mem_id=momo&club_no=c12
	
	@RequestMapping("upcheck")
	public ResponseEntity upCheck(UpVO up, HttpServletResponse response) throws Exception {
		System.out.println(up);
		boolean bool = service.registUp(up);
		
		System.out.println(bool);
		
/*		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		if(bool == false)
			out.println("alert('당신은 이미 추천을 하셨습니다.')");
		else
			out.println("alert('추천을 하셨습니다.')");
//		out.println("self.location.href='/coding/mypage/myclub';");
		out.println("</script>");*/
		
		ResponseEntity<Boolean> entity = new ResponseEntity<Boolean>(bool,HttpStatus.OK);
		
		return entity;		
	}
	
	//매핑의 예
	//http://localhost/coding/downcheck?mem_id=momo&club_no=c12
	
	@RequestMapping("downcheck")
	public ResponseEntity<Boolean> downCheck(DownVO down, HttpServletResponse response) throws Exception {
		boolean bool = service.registDown(down);
		System.out.println(bool);
		
		/*response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		if(bool == false)
			out.println("alert('당신은 이미 비추천을 하셨습니다.')");
		else
			out.println("alert('비추천을 하셨습니다.')");
		out.println("</script>");*/
		
		ResponseEntity entity = new ResponseEntity(bool,HttpStatus.OK);
		
		return entity;	
	}	
	
	
}
