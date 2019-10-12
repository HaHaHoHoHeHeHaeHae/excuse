package com.blood.coding.dao.category;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.blood.coding.dto.category.CategoryVO;

public class CategoryDAOImpl implements CategoryDAO {
	
	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}
	//대분류 카테고리 조회
	@Override
	public List<CategoryVO> selectCategoryList() throws SQLException {
		 
		List<CategoryVO> categoryList=session.selectList("Category.selectCategory");
		
		return categoryList;
	}
	//대분류 카테고리를 참조한 소분류 카테고리 리스트 조회
	@Override
	public List<CategoryVO> selectSubCategoryList(int cate_no) throws SQLException {	
		List<CategoryVO> subCategoryList=session.selectList("Category.selectSubCategory",cate_no);
		for(CategoryVO vo :subCategoryList) {
			System.out.println(vo.getCate_sub_name());
		}
		return subCategoryList;
	}
	
	@Override
	public int findCateNo(String cate_name) throws SQLException {
		int cate_no = session.selectOne("Category.findCateNo",cate_name);
		return cate_no;
	}
	
	
}
