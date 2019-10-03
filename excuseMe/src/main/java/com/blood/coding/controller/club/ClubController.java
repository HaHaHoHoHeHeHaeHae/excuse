package com.blood.coding.controller.club;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.blood.coding.controller.common.Criteria;
import com.blood.coding.dao.category.CategoryDAO;
import com.blood.coding.dao.local.LocalDAO;
import com.blood.coding.dto.category.CategoryVO;
import com.blood.coding.dto.club.ClubVO;
import com.blood.coding.dto.local.LocalVO;
import com.blood.coding.dto.member.MemberVO;
import com.blood.coding.service.club.ClubService;

@Controller
@RequestMapping("/club")
public class ClubController {
	
	@Autowired
	private ClubService clubService;
	
	@Autowired
	private CategoryDAO categoryDAO;
	
	@Autowired
	private LocalDAO localDAO;
	
	
	//private static final Logger logger = LoggerFactory.getLogger(ClubController.class);

	@RequestMapping("/list") //동호회 리스트보기
	public ModelAndView clubList(Criteria cri, ModelAndView modelnView, HttpServletRequest request) throws SQLException{ //session에서 멤버VO(local)가져올거기 떄문에 request 추가해줌.
		String url = "/club/list";
		//로그인유저 정보
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("loginUser");
	
		
		
		
		Map<String, Object> dataMap = clubService.getClubList(cri, memberVO);

		modelnView.addObject("dataMap",dataMap);
		modelnView.setViewName(url);
		return modelnView;
	}
	
	
	@RequestMapping("/detail") //동호회 상세보기
	public ModelAndView clubDetail(String club_no, ModelAndView modelnView) throws SQLException {
		String url = "club/detail";
		Map<String, Object> dataMap = clubService.readClub(club_no);//디테일에 댓글보여야 되니까 readClub.(replycnt가 있음)
		
		modelnView.addObject("dataMap",dataMap);
		modelnView.setViewName(url);
		return modelnView;
	}
	
	@RequestMapping(value="/regist", method=RequestMethod.POST) //동호회 등록
	public void clubRegist(ClubVO club, HttpServletResponse response) throws SQLException, IOException{
		clubService.regist(club);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");//브라우저로 바로 넘겨버림. opener는 list.jsp입니다.
		out.println("window.opener.location.href='/club/list';window.close();");
		out.println("</script>");
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.GET) //디테일에서 수정버튼 누를때(수정하기 위해 가져온다)
	public void modifyClubForm(String club_no, Model model) throws SQLException{
		ClubVO club = clubService.getClub(club_no);
		model.addAttribute("club",club);
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.POST) //수정하고 submit버튼 누를때
	public void modifyClubUpdate(ClubVO club, HttpServletResponse response) throws SQLException, IOException{
		clubService.modify(club);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("window.opener.location.reload();"); //수정완료 버튼을 누르면 reload한번 하고
		out.println("location.href='detail?club_no="+club.getClub_no()+"';"); //club_no의 detail로 가세요
		out.println("</script>");
	}
	
	@RequestMapping(value="/remove", method=RequestMethod.GET)
	public void remove(String club_no, HttpServletResponse response) throws Exception {
		clubService.remove(club_no);
		response.setContentType("text/html;charset=urt-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("window.opener.location.reload();window.close();");//지웠으니까 reload한번 하고 창닫아죠
		out.println("</script>");
	}
	
	@RequestMapping("/subcategory")
	   @ResponseBody //data형식으로 리턴 (ajax와 함께 사용),자바 객체를 HTTP 응답 몸체로 전송함, 자바 객체를 HTTP 요청의 body 내용으로 매핑하는 역할
	   public ResponseEntity<List<CategoryVO>> subCategoryList(@RequestBody CategoryVO categoryVO) throws Exception {//@RequestBody: fHTTP 요청 몸체를 자바 객체로 전달받음, HTTP 요청의 body 내용을 자바 객체로 매핑하는 역할

	      ResponseEntity<List<CategoryVO>> entity = null;

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
		
	
	@RequestMapping(value= {"/sublocal"})
	@ResponseBody
	public ResponseEntity<List<LocalVO>> subLocalList(@RequestBody LocalVO localVO) throws SQLException{
		ResponseEntity<List<LocalVO>> entity = null;
	      
	      System.out.println("@");
	      System.out.println(localVO);
	      System.out.println("@");
	      
	      try {
	    	  List<LocalVO> subLocalList = localDAO.selectSubLocalList(localVO.getLocal_no());
	    	  entity = new ResponseEntity<List<LocalVO>>(subLocalList,HttpStatus.OK);
	      }
	      catch(SQLException e) {
	    	  e.printStackTrace();
	    	  entity = new ResponseEntity<List<LocalVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
	      }
	      return entity;
		
	}
}


























