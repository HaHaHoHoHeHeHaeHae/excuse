package com.blood.coding.controller.mypage;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.blood.coding.controller.common.Criteria;
import com.blood.coding.service.club.ClubService;

@Controller
@RequestMapping("mypage")
public class MypageController {

	@Autowired
	private ClubService clubService;
	
	@RequestMapping("joinclub")
	public ModelAndView mypagejoinclub(Criteria cri, ModelAndView modelnView) throws Exception {
		
		String url = "mypage/joinclub";
		Map<String, Object> dataMap = clubService.getClubList(cri);
		modelnView.addObject("dataMap",dataMap);
		modelnView.setViewName(url);
		return modelnView;
		
	}
}
