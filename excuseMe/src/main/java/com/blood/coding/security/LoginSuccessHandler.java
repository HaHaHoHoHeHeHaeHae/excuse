package com.blood.coding.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

import com.blood.coding.dto.member.MemberVO;

public class LoginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler{

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, 
										HttpServletResponse response,
					Authentication authentication) throws ServletException, IOException {
		
		User user = (User)authentication.getDetails();
		
		MemberVO loginUser = user.getMemberVO();
		System.out.println(33);
		System.out.println(loginUser.getMem_id());
		HttpSession session = request.getSession();
		
		session.setAttribute("loginUser", loginUser);
		
		session.setMaxInactiveInterval(60*5); //세션 유지(상태유지)
		
		super.onAuthenticationSuccess(request, response, authentication);
	}
	
	
	
}
