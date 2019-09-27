package com.blood.coding.dao.local;

import java.sql.SQLException;
import java.util.List;

import com.blood.coding.dto.local.LocalVO;

public interface LocalDAO {
	public List<LocalVO> selectLocalList() throws SQLException;
	public List<LocalVO> selectSubLocalList(int local_no) throws SQLException;
	public int selectLocalNo(String local_name) throws Exception;
}
