package com.blood.coding.dao.member;

import java.sql.SQLException;
import java.util.List;

import com.blood.coding.controller.common.MemberCriteria;
import com.blood.coding.dto.member.MemberVO;

public interface MemberDAO {
	//리스트
	public List<MemberVO> selectMemberList() throws SQLException;
	public List<MemberVO> selectMemberList(MemberCriteria cri) throws SQLException;
	
	//리스트 카운트
	public int selectMemberListCount() throws SQLException;
	public int selectMemberListCount(MemberCriteria cri) throws SQLException;
	
	//상세보기
	public MemberVO selectMember(String mem_id) throws SQLException;
	public MemberVO selectMember2(String mem_nick) throws SQLException;
	
	//등록, 수정
	public void insertMember(MemberVO memberVO) throws SQLException;
	public void updateMember(MemberVO memberVO) throws SQLException;
	
	//회원상태
	public void updateMemberStatus(String mem_id)throws SQLException;
	public void updateStopMemberStatus(String mem_id)throws SQLException;
	
	//로그인
	public MemberVO loginMain(String mem_id) throws SQLException;
	
	//아이디 중복 체크
	public int checkId(String mem_id) throws SQLException;
	
	//닉네임 중복 체크
	public int checkNick(String mem_nick) throws SQLException;
	
	//비밀번호 찾기
	public String findPwd(String mem_id, String mem_name) throws SQLException;
	
	//아이디 찾기
	public String findId(MemberVO memberVO) throws SQLException;
	
	//공개여부 체크
	public int infoPhone(String mem_id) throws SQLException;
	public int infoName(String mem_id) throws SQLException;
	public int infoId(String mem_id) throws SQLException;
}
