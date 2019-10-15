package com.blood.coding.dao.club;

import java.sql.SQLException;
import java.util.List;

import com.blood.coding.controller.common.Criteria;
import com.blood.coding.dto.club.ClubVO;

public interface ClubDAO {
	//서치리스트
	   public List<ClubVO> selectSearchClubList(Criteria cri) throws SQLException; 
	   public List<ClubVO> selectSearchClubListForAdmin(Criteria cri) throws SQLException;
	//페이지 카운트
	   public int selectSearchClubCount(Criteria cri) throws SQLException;
	   public int selectSearchClubCountForAdmin(Criteria cri) throws SQLException;
	 //승인요청 클럽리스트
	   public List<ClubVO> selectNewClubList(Criteria cri)throws SQLException;
	   public int selectNewClubListCount(Criteria cri)throws SQLException;
	   
	//동호회 상세보기
	   public ClubVO selectClub(String club_no) throws SQLException;
	   
	//시퀀스(나중에 service에서 "c" 붙여서 String으로 만들어주세요)
	   public int selectClubSeq() throws SQLException;

    //등록, 업데이트, 삭제
	   public void insertClub(ClubVO clubVO) throws SQLException;
	   public void updateClub(ClubVO clubVO) throws SQLException;
	   public void deleteClub(String club_no) throws SQLException;
	   
	//승인 ,운영중지
	   public void updateClubStatus(String club_no) throws SQLException;
	   public void updateStopClubStatus(String club_no) throws SQLException;
	   
	
	//Made by minho
	   public List<ClubVO> recommendClubMain(String mem_local) throws SQLException;
	   public List<ClubVO> recentClubMain() throws SQLException;
	
	//메이드 바이 우철 / 내가만든 클럽을 리스트 검색
	   public List<ClubVO> myClub(String mem_id) throws SQLException;
	   
	   public int selectClubCount(String club_name) throws SQLException;
	   
	  //메바지선 블랙리스트
	   public List<ClubVO> selectBlackList(Criteria cri)throws SQLException;
	   public int selectBlackListCount(Criteria cri)throws SQLException;
}
