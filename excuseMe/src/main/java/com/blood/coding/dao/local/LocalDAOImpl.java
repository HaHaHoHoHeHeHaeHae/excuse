package com.blood.coding.dao.local;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.blood.coding.dto.local.LocalVO;

public class LocalDAOImpl implements LocalDAO {
   


   private SqlSession session;
   public void setSession(SqlSession session){
      this.session = session;
   }

   @Override
   public List<LocalVO> selectLocalList() throws SQLException {
      List<LocalVO> localList = session.selectList("Local.selectLocalList");
      return localList;
   }

   @Override
   public List<LocalVO> selectSubLocalList(int local_no) throws SQLException {
      List<LocalVO> sublocalList = session.selectList("Local.selectSubLocalList",local_no);
      return sublocalList;
   }

	@Override
	public int selectLocalNo(String local_name) throws SQLException {
		int local_no = session.selectOne("Local.selectLocalNo",local_name);
		return local_no;
	}

}