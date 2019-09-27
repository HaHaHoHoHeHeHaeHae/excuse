package com.blood.coding.dao.up;

import java.sql.SQLException;

public interface UpDAO {
	//Up갯수 확인
	public int selectUpCount(String club_no) throws SQLException;
	
	//Up 누르기
	public void insertUp(String mem_id, String club_no) throws SQLException;
	
	//중복 체크
	public int checkUp(String mem_id, String club_no) throws SQLException;
	
}
