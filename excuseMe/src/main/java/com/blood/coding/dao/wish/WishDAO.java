package com.blood.coding.dao.wish;

import java.sql.SQLException;

import com.blood.coding.controller.common.Criteria;
import com.blood.coding.dto.wish.WishVO;

public interface WishDAO {
	//관심 동호회 리스트
	public int selectWishList(Criteria cri, String mem_id) throws SQLException;
	
	//관심 동호회 추가, 삭제
	public void insertWish(WishVO wishVO) throws SQLException;
	public void deleteWish(int wish_no) throws SQLException;
	
	//중복 체크
	public int checkWish(String mem_id, String club_no) throws SQLException;
	
	//시퀀스 번호
	public int selectWishSeq() throws SQLException;
}
