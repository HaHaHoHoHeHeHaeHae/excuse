package com.blood.coding.dao.down;

import java.sql.SQLException;

public interface DownDAO {
	//Down갯수 확인
	public int selectDownCount(String club_no) throws SQLException;
	
	//Down 누르기
	public void insertDown(String mem_id, String club_no) throws SQLException;
	
	//중복 체크
	public int checkDown(String mem_id, String club_no) throws SQLException;
	
	//시퀀스 번호
	public int selectDownSeq() throws SQLException;
}
