package com.blood.coding.dao.up;

import java.sql.SQLException;

import com.blood.coding.dto.up.UpVO;

public interface UpDAO {
	//Up갯수 확인
	/* 셀랙트는 클럽에서 카운트하기때문에 생략한다.
	 * public int selectUpCount(String club_no) throws SQLException;*/
	
	//Up 누르기
	public void insertUp(UpVO up) throws SQLException;
	
	//중복 체크
	public UpVO checkUp(UpVO up) throws SQLException;
	
}
