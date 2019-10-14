package com.blood.coding.dao.attach;

import java.sql.SQLException;
import java.util.List;

import com.blood.coding.dto.attach.AttachVO;

public interface AttachDAO {
	//상세보기 시 첨부파일 리스트
	public List<AttachVO> selectAttachesByAttachBoard(String attach_board) throws SQLException;
	
	//대표사진 존재 유무 확인
	public int selectAttachThumCount(String attach_board) throws SQLException;
	
	public AttachVO selectAttachesByAttachBoardOne(String attach_board) throws SQLException;
	
	//다운로드 시 해당 파일 정보 가져오기
    public AttachVO selectAttachByAttachno(int attach_no) throws SQLException;
    
    //첨부 파일 저장, 삭제
    public void insertAttach(AttachVO attach) throws SQLException;
    public void deleteAttach(int attach_no) throws SQLException;
    
    //게시글 삭제 시 첨부파일 같이 삭제
    public void deleteAllAttach(String attach_board) throws SQLException;
}
