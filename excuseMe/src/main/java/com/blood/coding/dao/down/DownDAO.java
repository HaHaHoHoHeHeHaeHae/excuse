package com.blood.coding.dao.down;

import java.sql.SQLException;

import com.blood.coding.dto.down.DownVO;

public interface DownDAO {
	//Down갯수 확인
	/* 셀랙트는 클럽에서 카운트하기때문에 생략한다.
	 * public int selectDownCount(String club_no) throws SQLException;*/
	
	//Down 누르기
	public void insertDown(DownVO down) throws SQLException;
	
	//중복 체크
	public DownVO checkDown(DownVO down) throws SQLException;
	
}
