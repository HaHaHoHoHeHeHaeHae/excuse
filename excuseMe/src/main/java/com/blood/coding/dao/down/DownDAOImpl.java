package com.blood.coding.dao.down;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;

import com.blood.coding.dto.down.DownVO;

public class DownDAOImpl implements DownDAO {

	private SqlSession session;
	public void setSesssion(SqlSession session) {
		this.session = session;
	}
 
	/*
 	String mem_id는 세션에 있는 로그인값 넣어주고, String club_no는 현재 클럽번호를 넣어주고 
	select한 값이 있으면 중복 없으면 insert가능
	*/
	@Override
	public DownVO checkDown(DownVO down) throws SQLException {
		DownVO downvo = session.selectOne("Down.selectCheck",down);
		return  downvo;
	}
	
	@Override
	public void insertDown(DownVO down) throws SQLException {
		session.update("Down.insertDown",down);
	}

}
