package com.blood.coding.controller.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/main")
public class MainController {
	
	@RequestMapping("/test")
	public String test() throws Exception{
		return "main/test";
	}
}
