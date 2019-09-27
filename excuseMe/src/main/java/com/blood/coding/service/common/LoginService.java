package com.blood.coding.service.common;

import java.sql.SQLException;

import com.blood.coding.controller.common.MemberCriteria;
import com.blood.coding.dto.member.MemberVO;

public interface LoginService {

	//회원가입
	public void signUp(MemberVO memberVO) throws SQLException;
	
	//아이디 중복 체크
	public int idCheck(String mem_id) throws SQLException;
	
	//닉네임 중복 체크
	public int nickCheck(String mem_nick) throws SQLException;
	
	//아이디 찾기
	public String idFind(MemberVO memberVO) throws SQLException;
	
	//비밀번호 찾기
	public String pwdFind(String mem_id) throws SQLException;
	
}
