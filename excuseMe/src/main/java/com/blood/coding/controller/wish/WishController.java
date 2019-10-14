package com.blood.coding.controller.wish;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.blood.coding.dto.wish.WishVO;
import com.blood.coding.service.wish.WishService;

@Controller
public class WishController {

	@Autowired
	private WishService wishService;
	
	
	//위시에 추가
	//http://localhost/coding/wishclub?mem_id=momo&club_no=c12
	@RequestMapping("wishclub")
	public ResponseEntity<Boolean> wishClub(WishVO wishVO) throws Exception {
		boolean bool = wishService.registWish(wishVO);
		
		ResponseEntity<Boolean> entity = new ResponseEntity<Boolean>(bool,HttpStatus.OK);
		
		return entity;		
	}
	
	
	//위시에서 삭제하는거
	//http://localhost/coding/wishremove?mem_id=momo&club_no=c12
	@RequestMapping("wishremove")
	public ResponseEntity<Boolean> wishRemoveClub(WishVO wishVO) throws Exception {
		boolean bool = wishService.removeWish(wishVO);
		
		ResponseEntity<Boolean> entity = new ResponseEntity<Boolean>(bool,HttpStatus.OK);
		
		return entity;
	}
	
	
} 
