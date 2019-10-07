package com.blood.coding.dao.member;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.blood.coding.controller.common.MemberCriteria;
import com.blood.coding.dto.member.MemberVO;

public class MemberDAOImpl implements MemberDAO {

	
	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<MemberVO> selectMemberList(MemberCriteria cri) throws SQLException {
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		int alignment = cri.getAlignment();
		int sort = cri.getSort();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
	    cri.setAlignment(alignment);
	    cri.setSort(sort);
	    
		List<MemberVO> memberList = session.selectList("Member.selectMemberList",cri,rowBounds);
		return memberList;
	}

	@Override
	public MemberVO selectMember(String mem_id) throws SQLException {
		MemberVO vo = session.selectOne("Member.selectMember",mem_id);
		return vo;
	}
	@Override
	public MemberVO selectMember2(String mem_nick) throws SQLException {
		MemberVO vo = session.selectOne("Member.selectMember2",mem_nick);
		return vo;
	}

	@Override
	public void insertMember(MemberVO memberVO) throws SQLException {
		session.update("Member.insertMember",memberVO);
	}

	@Override
	public void updateMember(MemberVO memberVO) throws SQLException {
		session.update("Member.updateMember",memberVO);
	}
	
	@Override
	public void updateStopMemberStatus(String mem_id) throws SQLException {
		session.update("Member.updateStopMemberStatus",mem_id);
	}
	
	@Override
	public void updateMemberStatus(String mem_id) throws SQLException {
		session.update("Member.updateMemberStatus",mem_id);
		
		/*
		 * int num = 0; member.setMem_id(mem_id); member.setMem_status(num); if(num==0){
		 * member.setMem_status(1); }else { member.setMem_status(0);
		 */
	}

	@Override
	public int selectMemberListCount(MemberCriteria cri) throws SQLException {
		int count = session.selectOne("Member.selectMemberListCount",cri);
		return count;
	}

	@Override
	public MemberVO loginMain(String mem_id) throws SQLException {
		System.out.println(mem_id);
		MemberVO count = session.selectOne("Member.login", mem_id);
		return count;
	}

	@Override
	public int checkId(String mem_id) throws SQLException {
		
		int count = session.selectOne("Member.checkId", mem_id);
		return count;
	}

	@Override
	public String findPwd(String mem_id,String mem_name) throws SQLException {
		MemberVO memberVO = new MemberVO();
		memberVO.setMem_id(mem_id);
		memberVO.setMem_name(mem_name);
		String pwd = session.selectOne("Member.findPwd",memberVO);
		return pwd;
	}

	@Override
	public String findId(MemberVO memberVO) throws SQLException {
		String id = session.selectOne("Member.findId",memberVO);
		return id;
	}

	@Override
	public int checkNick(String mem_nick) throws SQLException {
		int count = session.selectOne("Member.checkNick", mem_nick);
		return count;
	}
	
	@Override
	public List<MemberVO> selectMemberList() throws SQLException {
		List<MemberVO> list = session.selectList("Member.selectMemberListNormal");
		return list;
	}

	@Override
	public int infoPhone(String mem_id) throws SQLException {
		int count = session.selectOne("Member.infoPhone",mem_id);
		return count;
	}

	@Override
	public int infoName(String mem_id) throws SQLException {
		int count = session.selectOne("Member.infoName",mem_id);
		return count;
	}

	@Override
	public int infoId(String mem_id) throws SQLException {
		int count = session.selectOne("Member.infoId",mem_id);
		return count;
	}

	@Override
	public int selectMemberListCount() throws SQLException {
		int count = session.selectOne("Member.selectMemberListCount");
		return count;
	}

	

	

	
}
