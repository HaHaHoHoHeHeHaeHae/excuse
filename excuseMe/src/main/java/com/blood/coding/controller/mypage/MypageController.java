
package com.blood.coding.controller.mypage;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.blood.coding.controller.common.Criteria;
import com.blood.coding.controller.common.DeleteFileUtils;
import com.blood.coding.controller.common.UploadFileUtils;
import com.blood.coding.dao.attach.AttachDAO;
import com.blood.coding.dto.attach.AttachVO;
import com.blood.coding.dto.club.ClubVO;
import com.blood.coding.dto.member.MemberVO;
import com.blood.coding.service.club.ClubService;

@Controller
@RequestMapping("mypage")
public class MypageController {

	@Autowired
	private ClubService clubService;
	
	@Autowired
	private AttachDAO attachDAO;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@RequestMapping("joinclub")
	public ModelAndView mypagejoinclub(Criteria cri, ModelAndView modelnView, HttpServletRequest request) throws Exception {
		
		//?Ñ∏?Öò?óê?Ñú Î°úÍ∑∏?ù∏?ïú ?ú†?? ?†ïÎ≥? Í∞??†∏?ò§Í∏?
		HttpSession session = request.getSession();
		
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
				
		String url = "mypage/joinclub";
		Map<String, Object> dataMap = clubService.getClubList(cri, member);
		modelnView.addObject("dataMap",dataMap);
		modelnView.setViewName(url);
		return modelnView;
		
	}
	
	@RequestMapping("myclub")
	public ModelAndView myClub(Criteria cir, ModelAndView modelnView, HttpServletRequest request) throws Exception {
		
		//?Ñ∏?Öò?óê?Ñú Î°úÍ∑∏?ù∏?ïú ?ú†?? ?†ïÎ≥? Í∞??†∏?ò®?ã§.
		HttpSession session = request.getSession();
		
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		
		List<ClubVO> myClubList = clubService.getMyClub(member.getMem_id()); 
		
		String url = "mypage/myclub";
		
		modelnView.addObject("myClubList",myClubList);
		modelnView.addObject("member",member);
		modelnView.setViewName(url);
		
		return modelnView;
	}
	
	@RequestMapping("wishclub")
	public ModelAndView wishClub(Criteria cir, ModelAndView modelnView, HttpServletRequest request) throws Exception {
		
		//?Ñ∏?Öò?óê?Ñú Î°úÍ∑∏?ù∏?ïú ?ú†?? ?†ïÎ≥? Í∞??†∏?ò®?ã§.
		HttpSession session = request.getSession();
		
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		
		List<ClubVO> myClubList = clubService.getMyClub(member.getMem_id()); 
		
		String url = "mypage/myclub";
		
		modelnView.addObject("myClubList",myClubList);
		modelnView.addObject("member",member);
		modelnView.setViewName(url);
		
		return modelnView;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value="testRegist", method=RequestMethod.GET)
	public String testRegistget() throws Exception {
		return "mypage/fileUploadTest";
	}
	
	@RequestMapping(value="testRegist", method=RequestMethod.POST)
	public void testRegistpost(MultipartFile[] uploadFile, HttpServletResponse response) throws Exception {
		System.out.println("?ûê ?ù¥?†ú ?óÖÎ°úÎìú ?ïú?ã§??");
		AttachVO attach=null;
		
		for(MultipartFile file : uploadFile) {
			attach = UploadFileUtils.uploadFile("d:\\upload", file.getOriginalFilename(), "roro", file.getBytes());
		}
		
		attach.setAttach_board("c01");
		System.out.println(attach);
		attachDAO.insertAttach(attach);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('Ïª®Ìä∏Î°§Îü¨ ?Åù?ÇòÍ≥? ?ôï?ù∏?ï®')");
		out.println("</script>");
			
	}
	
	@RequestMapping(value="removeAttach", method=RequestMethod.GET)
	public void testRemove(int attach_no) throws Exception {
		
		AttachVO attach = attachDAO.selectAttachByAttachno(attach_no);
		
		DeleteFileUtils.delete(uploadPath, attach);
		
		/*attachDAO.deleteAllAttach(attach_board);*/
		attachDAO.deleteAttach(attach_no);
		System.out.println("dk ?Ç≠?†ú?ï® ?îîÎπÑÍ??Ñú ?ôï?ù∏?ï¥Î¥?");
		
		
		
	}
	
}
