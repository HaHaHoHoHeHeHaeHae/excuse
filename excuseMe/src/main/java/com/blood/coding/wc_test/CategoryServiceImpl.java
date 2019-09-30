package com.blood.coding.wc_test;

import java.sql.SQLException;
import java.util.List;

import com.blood.coding.dao.category.CategoryDAO;
import com.blood.coding.dto.category.CategoryVO;

//서비스 필요없을듯
public class CategoryServiceImpl {

	private CategoryDAO categoryDAO;
	public void setCategoryDAO(CategoryDAO categoryDAO) {
		this.categoryDAO  = categoryDAO;
	}
	
	
	//대분류 카테고리 조회
	public List<CategoryVO> getCategoryList() throws SQLException {
		
		return categoryDAO.selectCategoryList();
	}
	
	//대분류 카테고리를 참조한 소분류 카테고리 리스트 조회
	public List<CategoryVO> getSubCategoryList(int cate_no) throws SQLException {
		
		return categoryDAO.selectSubCategoryList(cate_no);
	}
	

}
