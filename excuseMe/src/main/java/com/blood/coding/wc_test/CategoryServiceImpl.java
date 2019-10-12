
package com.blood.coding.wc_test;

import java.sql.SQLException;
import java.util.List;

import com.blood.coding.dao.category.CategoryDAO;
import com.blood.coding.dto.category.CategoryVO;

//?��비스 ?��?��?��?��?��
public class CategoryServiceImpl {

	private CategoryDAO categoryDAO;
	public void setCategoryDAO(CategoryDAO categoryDAO) {
		this.categoryDAO  = categoryDAO;
	}
	
	
	//??분류 카테고리 조회
	public List<CategoryVO> getCategoryList() throws SQLException {
		//커밋?��문에 ?��?��?��
		return categoryDAO.selectCategoryList();
	}
	
	//??분류 카테고리�? 참조?�� ?��분류 카테고리 리스?�� 조회
	public List<CategoryVO> getSubCategoryList(int cate_no) throws SQLException {
		
		return categoryDAO.selectSubCategoryList(cate_no);
	}
	

}
