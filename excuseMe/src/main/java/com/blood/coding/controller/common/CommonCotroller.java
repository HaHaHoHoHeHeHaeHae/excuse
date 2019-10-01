package com.blood.coding.controller.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class CommonCotroller {
	@RequestMapping("/summernote")
	public String summernote() throws Exception{
		return "common/summernote";
	}
	

}
