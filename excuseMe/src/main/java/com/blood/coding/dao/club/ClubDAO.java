package com.blood.coding.dao.club;

import java.sql.SQLException;
import java.util.List;

import com.blood.coding.controller.common.Criteria;
import com.blood.coding.dto.club.ClubVO;

public interface ClubDAO {
	//서치리스트
	   public List<ClubVO> selectSearchClubList(Criteria cri) throws SQLException; 
	   
	//페이지 카운트
	   public int selectSearchClubCount(Criteria cri) throws SQLException;
	   
	//동호회 상세보기
	   public ClubVO selectClub(String club_no) throws SQLException;
	   
	//시퀀스(나중에 service에서 "c" 붙여서 String으로 만들어주세요)
	   public int selectClubSeq() throws SQLException;

    //등록, 업데이트, 삭제
	   public void insertClub(ClubVO clubVO) throws SQLException;
	   public void updateClub(ClubVO clubVO) throws SQLException;
	   public void deleteClub(String club_no) throws SQLException;
	   
	//승인 ,운영중지
	   public void updateClubStatus(ClubVO clubVO) throws SQLException;

}
