
package com.blood.coding.controller.club;

import java.sql.SQLException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.blood.coding.controller.common.Criteria;
import com.blood.coding.controller.common.PageMaker;
import com.blood.coding.dto.member.MemberVO;
import com.blood.coding.service.club.ClubService;

@Controller
@RequestMapping("/manage")
public class ManageClubController {

	@Autowired
	private ClubService service;
	
	@ModelAttribute("categoryclub")
	public String category() throws Exception{
		return "manage/club";
	}

	@RequestMapping("/club/list")
	public ModelAndView clubList(Criteria cri) throws Exception {
		String url = "manage/club/list";

		ModelAndView mav = new ModelAndView();
		
		MemberVO memberVO = new MemberVO();
		Map<String, Object> dataMap = service.getClubListByAdmin(cri, memberVO);
		mav.addObject("dataMap", dataMap);
		mav.setViewName(url);

		return mav;
	}
	
	@RequestMapping("/blacklist/list")
	public ModelAndView blackList(Criteria cri) throws Exception {
		String url = "manage/blacklist/list";

		ModelAndView mav = new ModelAndView();
		
		MemberVO memberVO = new MemberVO();
		Map<String, Object> dataMap = service.getClubListByAdmin(cri, memberVO);
		mav.addObject("dataMap", dataMap);
		mav.setViewName(url);

		return mav;
	}

	@RequestMapping("/club/detail") // ?èô?ò∏?öå ?ÉÅ?Ñ∏Î≥¥Í∏∞
	public ModelAndView clubDetail(String club_no, ModelAndView modelnView) throws SQLException {
		String url = "manage/club/detail";
		Map dataMap = service.readClub(club_no);// ?îî?Öå?ùº?óê ?åìÍ∏?Î≥¥Ïó¨?ïº ?êò?ãàÍπ? readClub.(replycntÍ∞? ?ûà?ùå)

		modelnView.addObject("dataMap", dataMap);
		modelnView.setViewName(url);
		return modelnView;
	}

	@RequestMapping("/newclub/list")
	public ModelAndView newclubList(Criteria cri, Model model) throws Exception {
		String url = "manage/newclub/list";
		ModelAndView mav = new ModelAndView();

		Map<String, Object> dataMap = service.getNewClubList(cri);
		mav.addObject("dataMap", dataMap);
		mav.setViewName(url);

		return mav;
	}
	//?ö¥?òÅÏ§ëÏ?
	@RequestMapping(value="/club/stopstatus",method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> stopupdate(@RequestParam("club_no") String club_no)throws Exception{
		ResponseEntity<String> entity = null;
		
		try {
			service.updateStopClub(club_no);
			entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		}catch(SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}

	
	//?äπ?ù∏,?ö¥?òÅÏ§ëÏ? ?ï¥?†ú
		@RequestMapping(value="/club/status",method=RequestMethod.POST)
		@ResponseBody
		public ResponseEntity<String> update(@RequestParam("club_no") String club_no)throws Exception{
			 ResponseEntity<String> entity = null;
			 try {
				 service.updateClub(club_no);
				 entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
			 }catch(SQLException e) {
				 e.printStackTrace();
				 entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
				 }
			 return entity;
		}


	
	@RequestMapping("/newclub/detail") // ?èô?ò∏?öå ?ÉÅ?Ñ∏Î≥¥Í∏∞
	public ModelAndView newDetail(String club_no, ModelAndView modelnView) throws SQLException {
		String url = "manage/newclub/detail";
		Map dataMap = service.readClub(club_no);

		modelnView.addObject("dataMap", dataMap);
		modelnView.setViewName(url);
		return modelnView;
	}
	
	



}
