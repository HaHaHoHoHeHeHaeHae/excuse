
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
import com.blood.coding.controller.common.MemberCriteria;
import com.blood.coding.controller.common.UploadFileUtils;
import com.blood.coding.dao.attach.AttachDAO;
import com.blood.coding.dao.local.LocalDAO;
import com.blood.coding.dto.attach.AttachVO;
import com.blood.coding.dto.club.ClubVO;
import com.blood.coding.dto.local.LocalVO;
import com.blood.coding.dto.member.MemberVO;
import com.blood.coding.dto.wish.WishVO;
import com.blood.coding.service.club.ClubService;
import com.blood.coding.service.joinclub.JoinClubService;
import com.blood.coding.service.member.MemberService;
import com.blood.coding.service.reply.ReplyService;
import com.blood.coding.service.wish.WishService;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	@Autowired
	private JoinClubService joinClubService;

	@Autowired
	private ClubService clubService;
	
	@Autowired
	private AttachDAO attachDAO;
	
	@Autowired
	private WishService wishService;
	
	@Autowired
	private LocalDAO localDAO;
	
	@Autowired
	private ReplyService replyService;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@Autowired
	private MemberService memberservice;
	
	//내가 가입한 클럽 리스트
	@RequestMapping("/myjoinlist")
	public ModelAndView myJoinList(Criteria cri, HttpServletRequest request, ModelAndView modelnView) throws Exception {
			
		//세션에서 로그인한놈 빼오기
		HttpSession session = request.getSession();
		
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		
		String url = "mypage/myjoinlist";
		Map<String, Object> dataMap = joinClubService.selectJoinClubList(cri, member.getMem_id());
		
		modelnView.addObject("dataMap",dataMap);
		modelnView.setViewName(url);
		
		return modelnView;
	}
	
	//내가 만든 클럽리스트
	@RequestMapping("/myclub")
	public ModelAndView myClub(Criteria cir, ModelAndView modelnView, HttpServletRequest request) throws Exception {
		
		//세션에서 로그인한 유저 정보 가져온다.
		HttpSession session = request.getSession();
		
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		
		List<ClubVO> myClubList = clubService.getMyClub(member.getMem_id()); 
		
		String url = "mypage/myclub";
		
		modelnView.addObject("myClubList",myClubList);
		modelnView.addObject("member",member);
		modelnView.setViewName(url);
		
		return modelnView;
	}
	
	@RequestMapping("/wishlist")
	public ModelAndView wishClub(Criteria cri, ModelAndView modelnView, HttpServletRequest request) throws Exception {
		
		//세션에서 로그인한 유저 정보 가져온다.
		HttpSession session = request.getSession();
		
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		
		WishVO wishVO = new WishVO();
		wishVO.setMem_id(member.getMem_id());
		
		Map<String, Object> dataMap = wishService.selectWishList(cri, wishVO);
		
		String url = "mypage/wishlist";
		
		modelnView.addObject("dataMap",dataMap);
		modelnView.setViewName(url);
		
		return modelnView;
	}

	
	@RequestMapping(value="/myinfo", method=RequestMethod.GET)
	public String myinfoGet() throws Exception {
		return "mypage/myinfo_pw";
		
	}

	
	@RequestMapping(value="/myinfo", method=RequestMethod.POST)
	public ModelAndView myinfo(ModelAndView modelnView) throws Exception {
		String url = "mypage/myinfo";
				
		List<LocalVO> localList = localDAO.selectLocalList();
					
		modelnView.addObject("localList",localList);
		modelnView.setViewName(url);
		
		return modelnView;
		
	}
		
	
	@RequestMapping("/myclubuser")
	public ModelAndView memberListForm(Criteria cri,String club_no)throws Exception{
		String url="mypage/myclubuser";
		ModelAndView mav = new ModelAndView();
		
		Map<String,Object> dataMap=joinClubService.selectMyClubList(cri, club_no);
		dataMap.put("cri", cri);
		dataMap.put("club", club_no);
		
		mav.addObject("dataMap",dataMap);
		mav.setViewName(url);
		
		return mav;		
	}
	
	//내가 쓴 댓글 내역
	@RequestMapping("/myreply")
	public ModelAndView memberReplyList(MemberCriteria cri, HttpServletRequest request)throws Exception{
		
		ModelAndView modlenView = new ModelAndView();
		
		MemberVO loginUser = (MemberVO)request.getSession().getAttribute("loginUser");
		
		String url="mypage/myreply";
		
		Map<String,Object> dataMap=replyService.getMypageReplyList(cri, loginUser.getMem_id());
		dataMap.put("cri", cri);
		
		modlenView.setViewName(url);
		modlenView.addObject("dataMap",dataMap);
		return modlenView;		
	}

	
	
	
	
	
	
	
	@RequestMapping(value="testRegist", method=RequestMethod.GET)
	public String testRegistget() throws Exception {
		return "mypage/fileUploadTest";
	}
	
	@RequestMapping(value="testRegist", method=RequestMethod.POST)
	public void testRegistpost(MultipartFile[] uploadFile, HttpServletResponse response) throws Exception {
		System.out.println("자 이제 업로드 한다??");
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
		out.println("alert('컨트롤러 끝나고 확인함')");
		out.println("</script>");
			
	}
	
	@RequestMapping(value="removeAttach", method=RequestMethod.GET)
	public void testRemove(int attach_no) throws Exception {
		
		AttachVO attach = attachDAO.selectAttachByAttachno(attach_no);
		
		DeleteFileUtils.delete(uploadPath, attach);
		
		/*attachDAO.deleteAllAttach(attach_board);*/
		attachDAO.deleteAttach(attach_no);
		System.out.println("dk 삭제함 디비가서 확인해봐");
		
		
		
	}
	
}
