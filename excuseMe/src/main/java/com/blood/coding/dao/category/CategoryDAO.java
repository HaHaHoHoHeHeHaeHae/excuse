package com.blood.coding.dao.category;

import java.sql.SQLException;
import java.util.List;

import com.blood.coding.dto.category.CategoryVO;

public interface CategoryDAO {
	public List<CategoryVO> selectCategoryList() throws SQLException;
	public List<CategoryVO> selectSubCategoryList(int cate_no) throws SQLException;
	public int findCateNo(String cate_name) throws SQLException;
}
