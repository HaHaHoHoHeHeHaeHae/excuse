package com.blood.coding.dao.notice;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.blood.coding.controller.common.Criteria;
import com.blood.coding.dto.notice.NoticeVO;

public class NoticeDAOImpl implements NoticeDAO {

	
	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<NoticeVO> selectNoticeList(Criteria cri) throws SQLException {
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		List<NoticeVO> list = session.selectList("Notice.selectNoticeList",cri,rowBounds);
		
		return list;
	}

	@Override
	public int selectNoticeCount() throws SQLException {
		int count = session.selectOne("Notice.selectNoticeCount");
		return count;
	}

	@Override
	public void insertNotice(NoticeVO noticeVO) throws SQLException {
		session.update("Notice.insertNotice", noticeVO);

	}

	@Override
	public void updateNotice(NoticeVO noticeVO) throws SQLException {
		session.update("Notice.updateNotice", noticeVO);

	}

	@Override
	public void deleteNotice(String not_no) throws SQLException {
		session.update("Notice.deleteNotice",not_no);

	}

	@Override
	public NoticeVO selectNotice(String not_no) throws SQLException {
		NoticeVO vo = session.selectOne("Notice.selectNotice",not_no);
		return vo;
	}

	@Override
	public void updateNoticeViewcnt(String not_no) throws SQLException {
		session.update("Notice.updateNoticeViewcnt", not_no);

	}

	@Override
	public String selectNoticeSeq() throws SQLException {
		int seq = session.selectOne("Notice.selectNoticeSeq");
		String no = "n"+ seq;
		return no;
	}

}
