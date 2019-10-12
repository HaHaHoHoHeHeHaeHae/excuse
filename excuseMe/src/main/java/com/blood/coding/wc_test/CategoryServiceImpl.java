
package com.blood.coding.wc_test;

import java.sql.SQLException;
import java.util.List;

import com.blood.coding.dao.category.CategoryDAO;
import com.blood.coding.dto.category.CategoryVO;

//?„œë¹„ìŠ¤ ?•„?š”?—†?„?“¯
public class CategoryServiceImpl {

	private CategoryDAO categoryDAO;
	public void setCategoryDAO(CategoryDAO categoryDAO) {
		this.categoryDAO  = categoryDAO;
	}
	
	
	//??ë¶„ë¥˜ ì¹´í…Œê³ ë¦¬ ì¡°íšŒ
	public List<CategoryVO> getCategoryList() throws SQLException {
		//ì»¤ë°‹?•Œë¬¸ì— ?ˆ˜? •?•¨
		return categoryDAO.selectCategoryList();
	}
	
	//??ë¶„ë¥˜ ì¹´í…Œê³ ë¦¬ë¥? ì°¸ì¡°?•œ ?†Œë¶„ë¥˜ ì¹´í…Œê³ ë¦¬ ë¦¬ìŠ¤?Š¸ ì¡°íšŒ
	public List<CategoryVO> getSubCategoryList(int cate_no) throws SQLException {
		
		return categoryDAO.selectSubCategoryList(cate_no);
	}
	

}
