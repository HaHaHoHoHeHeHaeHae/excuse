package com.blood.coding.dao.up;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;

import com.blood.coding.dto.up.UpVO;

public class UpDAOImpl implements UpDAO {
		private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	/*셀랙트는 클럽에서 카운트하기때문에 생략한다.
	 @Override
	public int selectUpCount(String club_no) throws SQLException {
		
		return 0;
	}*/

	

	/*
	 	String mem_id는 세션에 있는 로그인값 넣어주고, String club_no는 현재 클럽번호를 넣어주고 
		select한 값이 있으면 중복 없으면 insert가능
		*/
	@Override
	public UpVO checkUp(UpVO up) throws SQLException {
		UpVO upvo = session.selectOne("Up.selectCheck",up); 
		System.out.println(upvo);
		return upvo;
	}
	
	@Override
	public void insertUp(UpVO up) throws SQLException {
		session.update("Up.insertUp",up);		
	}

}
