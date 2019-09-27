package com.blood.coding.service.common;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.blood.coding.dto.local.LocalVO;

public interface LocalService {
    public Map<String,List<LocalVO>> localList() throws SQLException;
    public int localNo(String local_name) throws Exception;
    
     public List<LocalVO> subLocalList(int local_no) throws SQLException;
}
