package com.blood.coding.dao.up;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;

public class UpDAOImpl implements UpDAO {
	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public int selectUpCount(String club_no) throws SQLException {
		int upcount = session.selectOne("Up.selectUpCount",club_no);
		return upcount;
	}

	@Override
	public void insertUp(String mem_id, String club_no) throws SQLException {
		
		
	}

	@Override
	public int checkUp(String mem_id, String club_no) throws SQLException {
		
		return 0;
	}

}
