package com.blood.coding.dao.wish;

import java.sql.SQLException;
import java.util.List;

import com.blood.coding.controller.common.Criteria;
import com.blood.coding.dto.wish.WishVO;

public interface WishDAO {
	//관심 동호회 리스트
	public List<WishVO> selectWishList(Criteria cri, String mem_id) throws SQLException;
	
	//관심 동호회 추가, 삭제
	public void insertWish(WishVO wishVO) throws SQLException;
	public void deleteWish(WishVO wishVO) throws SQLException;
	
	//중복 체크
	public WishVO checkWish(WishVO wishVO) throws SQLException;
	
	//페이지메이커를 위한 리스트 카운트
	public int selectWishListCount(WishVO wishVO) throws SQLException;
	
}
