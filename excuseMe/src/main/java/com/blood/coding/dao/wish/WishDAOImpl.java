package com.blood.coding.dao.wish;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;

import com.blood.coding.controller.common.Criteria;
import com.blood.coding.dto.wish.WishVO;

public class WishDAOImpl implements WishDAO {
	
	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session=session;
	}

	@Override
	public int selectWishList(Criteria cri, String mem_id) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void insertWish(WishVO wishVO) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteWish(int wish_no) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public int checkWish(String mem_id, String club_no) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int selectWishSeq() throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

}
