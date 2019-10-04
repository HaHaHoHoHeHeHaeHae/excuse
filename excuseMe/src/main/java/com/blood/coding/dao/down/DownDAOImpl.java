package com.blood.coding.dao.down;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;

public class DownDAOImpl implements DownDAO {
	
	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public int selectDownCount(String club_no) throws SQLException {
		int downcount = session.selectOne("Down.selectDownCount",club_no);
		return downcount;
	}

	@Override
	public void insertDown(String mem_id, String club_no) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public int checkDown(String mem_id, String club_no) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int selectDownSeq() throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

}
