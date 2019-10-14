package com.blood.coding.dao.wish;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.blood.coding.controller.common.Criteria;
import com.blood.coding.dto.wish.WishVO;

public class WishDAOImpl implements WishDAO {
	
	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public WishVO checkWish(WishVO wishVO) throws SQLException {
		return session.selectOne("Wish.selectCheck", wishVO);
	}
	
	@Override
	public void insertWish(WishVO wishVO) throws SQLException {
		session.update("Wish.insertWish", wishVO);
	}

	@Override
	public void deleteWish(WishVO wishVO) throws SQLException {
		session.update("Wish.deleteWish", wishVO);		
	}
	
	@Override
	public List<WishVO> selectWishList(Criteria cri, String mem_id) throws SQLException {
		
		RowBounds rowBounds = new RowBounds(cri.getPageStartRowNum(), cri.getPerPageNum());
		
		List<WishVO> wishList = session.selectList("Wish.selectWishList",mem_id,rowBounds);
		
		return wishList;
	}

	@Override
	public int selectWishListCount(WishVO wishVO) throws SQLException {
		
		List<WishVO> wishList = session.selectList("Wish.selectWishList",wishVO);
		
		int count =  wishList.size();
		
		return count;
	}

}
