package com.blood.coding.controller;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blood.coding.dao.category.CategoryDAO;
import com.blood.coding.dto.category.CategoryVO;
import com.blood.coding.wc_test.CategoryServiceImpl;

@Controller
public class CategoryController {
	@Autowired
	private CategoryDAO categoryDAO;
	
	@RequestMapping("/categoryry")
	public String categoryList(Model model) throws Exception {
		
		List<CategoryVO> categoryList = categoryDAO.selectCategoryList();
		
		System.out.println("@@@@@@@@@@@");
		System.out.println(categoryList);
		System.out.println("@@@@@@@@@@@");
		
		model.addAttribute("categoryList", categoryList);
		
		return "Category_Test";
	}
	
	@RequestMapping("/subcategory")
	@ResponseBody
	public ResponseEntity<List<CategoryVO>> subCategoryList(@RequestBody CategoryVO categoryVO) throws Exception {
		
		ResponseEntity<List<CategoryVO>> entity = null;
		
		System.out.println("@");
		System.out.println(categoryVO);
		System.out.println("@");
		
		try {
			List<CategoryVO> subCategoryList = categoryDAO.selectSubCategoryList(categoryVO.getCate_no());
			
			entity = new ResponseEntity<List<CategoryVO>>(subCategoryList,HttpStatus.OK);
		}
		catch(SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<CategoryVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
			
		
		return entity;
	}
	
	

	
	
}
