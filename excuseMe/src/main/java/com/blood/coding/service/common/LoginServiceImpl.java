package com.blood.coding.service.common;

import java.sql.SQLException;

import com.blood.coding.dao.member.MemberDAO;
import com.blood.coding.dto.member.MemberVO;

public class LoginServiceImpl implements LoginService {

	private MemberDAO memberDAO;
	public void setMemberDAO(MemberDAO memberDAO) {
		this.memberDAO = memberDAO;
	}

	
	//회원가입
	@Override
	public void signUp(MemberVO memberVO) throws SQLException{
		memberDAO.insertMember(memberVO);
	}
	
	//아이디 중복 체크
	@Override
	public int idCheck(String mem_id) throws SQLException{
		int count = memberDAO.checkId(mem_id);
		
		return count;
	}

	@Override
	public String idFind(MemberVO memberVO) throws SQLException {
		String mem_id = memberDAO.findId(memberVO);
		return mem_id;
	}

	@Override
	public String pwdFind(String mem_id) throws SQLException {
		String mem_pwd = memberDAO.findPwd(mem_id);
		return mem_pwd;
	}


	@Override
	public int nickCheck(String mem_nick) throws SQLException {
		int count = memberDAO.checkNick(mem_nick);
		return count;
	}

}
