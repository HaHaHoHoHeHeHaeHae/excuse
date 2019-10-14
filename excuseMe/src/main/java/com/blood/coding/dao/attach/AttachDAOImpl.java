package com.blood.coding.dao.attach;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.blood.coding.dto.attach.AttachVO;

public class AttachDAOImpl implements AttachDAO {

	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
		//상세보기 시 첨부파일 리스트
		public List<AttachVO> selectAttachesByAttachBoard(String attach_board) throws SQLException{
			List<AttachVO> list = session.selectList("Attach.selectAttachesByAttachBoard",attach_board);
			return list;
		}
		
		//다운로드 시 해당 파일 정보 가져오기
	    public AttachVO selectAttachByAttachno(int attach_no) throws SQLException{
	    	AttachVO attach = session.selectOne("Attach.selectAttachByAttachno",attach_no);
	    	return attach;
	    }
	    
	    //첨부 파일 저장, 삭제
	    public void insertAttach(AttachVO attach) throws SQLException{
	    	session.update("Attach.insertAttach", attach);
	    }
	    
	    public void deleteAttach(int attach_no) throws SQLException{
	    	session.update("Attach.deleteAttach", attach_no);
	    }
	    
	    //게시글 삭제 시 첨부파일 같이 삭제
	    public void deleteAllAttach(String attach_board) throws SQLException{
	    	session.update("Attach.deleteAllAttach", attach_board);
	    }

		

		@Override
		public int selectAttachThumCount(String attach_board) throws SQLException {
			int count = session.selectOne("Attach.selectAttachThumCount", attach_board);
			return count;
		}

		@Override
		public AttachVO selectAttachesByAttachBoardOne(String attach_board) throws SQLException {
			AttachVO list = session.selectOne("Attach.selectAttachesByAttachBoard",attach_board);
			return list;
		}
}
