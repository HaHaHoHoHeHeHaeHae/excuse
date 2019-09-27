package com.blood.coding.service.notice;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.blood.coding.controller.common.Criteria;
import com.blood.coding.controller.common.PageMaker;
import com.blood.coding.dao.notice.NoticeDAO;
import com.blood.coding.dto.notice.NoticeVO;

public class NoticeServiceImpl implements NoticeService {

	private NoticeDAO noticeDAO;
	public void setNoticeDAO(NoticeDAO noticeDAO) {
		this.noticeDAO = noticeDAO;
	}
	
	@Override
	public Map<String, Object> noticeList(Criteria cri) throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();
		List<NoticeVO> list = noticeDAO.selectNoticeList(cri);
		
		PageMaker page = new PageMaker();
		
		int count = noticeDAO.selectNoticeCount();
		page.setCri(cri);
		page.setTotalCount(count);
		
		map.put("pageMaker",page);
		map.put("noticeList", list);
		
		return map;
	}

	@Override
	public NoticeVO noticeDetail(String not_no) throws SQLException {
		NoticeVO vo = noticeDAO.selectNotice(not_no);
		return vo;
	}

	@Override
	public void registNotice(NoticeVO noticeVO) throws SQLException {
		noticeDAO.insertNotice(noticeVO);

	}

	@Override
	public void modifyNotice(NoticeVO noticeVO) throws SQLException {
		noticeDAO.updateNotice(noticeVO);

	}

	@Override
	public void removeNotice(String not_no) throws SQLException {
		noticeDAO.deleteNotice(not_no);

	}

}
