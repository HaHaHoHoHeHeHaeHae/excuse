package com.blood.coding.service.wish;

import java.sql.SQLException;
import java.util.Map;

import com.blood.coding.controller.common.Criteria;
import com.blood.coding.dto.wish.WishVO;

public interface WishService {

	//위시에 등록
	public boolean registWish(WishVO wishVO) throws SQLException;
	//위시에서 삭제
	public boolean removeWish(WishVO wishVO) throws SQLException;
	//리스트업
	public Map<String, Object> selectWishList(Criteria cri, WishVO wishVO) throws SQLException;
	
}
