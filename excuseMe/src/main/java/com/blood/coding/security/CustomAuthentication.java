package com.blood.coding.security;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

import com.blood.coding.dto.member.MemberVO;
import com.blood.coding.service.member.MemberService;

public class CustomAuthentication implements AuthenticationProvider{
	
	private MemberService memberService;
	public void setMemberService(MemberService memberService) {
		this.memberService=memberService;
	}

	@Override
	public Authentication authenticate(Authentication auth) throws AuthenticationException {
		String login_id = (String) auth.getPrincipal(); //로그인 시도한 ID를 가져온다
		String login_pwd = (String) auth.getCredentials(); //로그인 시도한 pwd가져온다
		
		MemberVO member =null;
		
		try {
			member=memberService.loginMember(login_id);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new BadCredentialsException("Internal server error!");
		}
		
		if(member != null && login_pwd.equals(member.getMem_pwd())) {
			if(member.getMem_status()==1) {
				List<GrantedAuthority> roles = new ArrayList<GrantedAuthority>();
				
				
				roles.add(new SimpleGrantedAuthority("admin"));
				
				//스프링 시큐리티 내부 클래스로 인증 토큰 생성한다.
				UsernamePasswordAuthenticationToken result = new UsernamePasswordAuthenticationToken(member.getMem_id(), member.getMem_pwd(),roles);
				
				// 전달할 내용을 설정한 후
				result.setDetails(new User(member));
				
				//리턴한다. default-target-url 로 전송된다.
				return result;
			}else {
				// enabled : 0,2 상태 예외처리
				throw new BadCredentialsException("This account is locked");
			}
			
		}else {
			//실패시 예외처리
			throw new BadCredentialsException("아이디 혹은 패스워드가 일치하지 않습니다.");			
		}
		
	}

	@Override
	public boolean supports(Class<?> arg) {
		/*UsernamePasswordAuthenticationToken 리턴할때
		파라미터와 같은 레퍼런스인지 비교를 하고 리턴을 한다.
		default-target-url 로 전송된다*/
		return arg.equals(UsernamePasswordAuthenticationToken.class);
	}
	

}
