package com.blood.coding.service.common;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.blood.coding.dao.local.LocalDAO;
import com.blood.coding.dto.local.LocalVO;

public class LocalServiceImpl implements LocalService{
	
	private LocalDAO localDAO;
	public void setLocalDAO(LocalDAO localDAO) {
		this.localDAO = localDAO;
	}
	@Override
	public Map<String, List<LocalVO>> localList() throws SQLException {
		Map <String,List<LocalVO>> map = new HashMap();
		List<LocalVO> list = localDAO.selectLocalList();
		map.put("localList", list);
		return map;
	}
	@Override
	public List<LocalVO> subLocalList(int local_no) throws SQLException {

		List<LocalVO> list = localDAO.selectSubLocalList(local_no);

		return list;
	}
	@Override
	public int localNo(String local_name) throws Exception {
		int local_no = localDAO.selectLocalNo(local_name);
		return local_no;
	}
	

}
