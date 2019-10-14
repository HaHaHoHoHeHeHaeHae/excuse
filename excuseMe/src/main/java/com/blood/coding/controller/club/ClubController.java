package com.blood.coding.controller.club;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.blood.coding.controller.common.Criteria;
import com.blood.coding.controller.common.DeleteFileUtils;
import com.blood.coding.controller.common.UploadFileUtils;
import com.blood.coding.dao.attach.AttachDAO;
import com.blood.coding.dao.attach.AttachDAO;
import com.blood.coding.dao.category.CategoryDAO;
import com.blood.coding.dao.joinclub.JoinClubDAO;
import com.blood.coding.dao.local.LocalDAO;
import com.blood.coding.dto.attach.AttachVO;
import com.blood.coding.dto.category.CategoryVO;
import com.blood.coding.dto.club.ClubVO;
import com.blood.coding.dto.joinClub.JoinClubVO;
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
	
	@Autowired
	private AttachDAO attachDAO;
	
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@ModelAttribute("categoryclub")
	public String category() throws Exception{
		return "club";
	}
	
	//private static final Logger logger = LoggerFactory.getLogger(ClubController.class);

	@RequestMapping("/list") //동호회 리스트보기
	public ModelAndView clubList(Criteria cri, ModelAndView modelnView, HttpServletRequest request) throws SQLException{ //session에서 멤버VO(local)가져올거기 떄문에 request 추가해줌.
		
		String url = "/club/list";	
		//로그인유저 정보
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("loginUser");
	
		Map<String, Object> dataMap = clubService.getClubList(cri, memberVO);

		if(cri.getCategory().length()>0) {
			String[] split = cri.getCategory().split("_");
			dataMap.put("split", split);
		}
		
		if(cri.getLocal().length()>0) {
			String[] split_sub = cri.getLocal().split("_");
			//System.out.println("$$$$$$$$$$");
			//System.out.println(split_sub[1]);
			//System.out.println("$$$$$$$$$$");
			dataMap.put("split_sub", split_sub);
		}

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
	@RequestMapping(value="/regist", method=RequestMethod.GET)
	public ModelAndView clubRegistForm() throws Exception{
		ModelAndView mav = new ModelAndView();
		String url = "/club/regist";
		List<CategoryVO> category = categoryDAO.selectCategoryList();
		List<LocalVO> local = localDAO.selectLocalList();
		
		mav.addObject("categoryList", category);
		mav.addObject("localList",local);
		mav.setViewName(url);
		
		return mav;
	}
	@RequestMapping(value="/regist", method=RequestMethod.POST) //동호회 등록
	public ResponseEntity<String> clubRegist(ClubVO club, HttpServletResponse response) throws SQLException, IOException{
		ResponseEntity<String> entity = null;
		try {
			String club_no = clubService.getClubSeq();
			club.setClub_no(club_no);

			clubService.regist(club);
			
			
			entity = new ResponseEntity<String>(club_no,HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.GET) //디테일에서 수정버튼 누를때(수정하기 위해 가져온다)
	public ModelAndView modifyClubForm(String club_no) throws Exception{
		
		ModelAndView mav = new ModelAndView();
		String url = "/club/modify";
		ClubVO club = clubService.getClub(club_no);
		String club_noForThum = club_no + "c";
		AttachVO attachThum = attachDAO.selectAttachesByAttachBoardOne(club_noForThum);
		List<AttachVO> attach = attachDAO.selectAttachesByAttachBoard(club_no);
		
		System.out.println("sssssssssss");
		System.out.println("sssssssssss");
		System.out.println("sssssssssss");
		System.out.println("sssssssssss");
		
		System.out.println("sssssssssss");
		System.out.println("sssssssssss");
		
		String local = club.getClub_local();
		int local_count = local.indexOf("_");
		String sub_local = local.substring(local_count+1);
	    String main_local = local.substring(0,local_count);
	    System.out.println(sub_local+main_local);
	    
	    List <LocalVO> localList = localDAO.selectLocalList();
	    
	    int main_local_no= localDAO.selectLocalNo(main_local);
	    
	    List <LocalVO> subLocalList = localDAO.selectSubLocalList(main_local_no);
	
	    mav.addObject("main_local",main_local);
	    mav.addObject("sub_local",sub_local);
	    mav.addObject("localList",localList);
	    mav.addObject("subLocalList",subLocalList);
		mav.addObject("attachThum",attachThum);
		mav.addObject("attach",attach);
		mav.addObject("club", club);
		mav.setViewName(url);

		return mav;
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.POST) //수정하고 submit버튼 누를때
	public ResponseEntity <String> modifyClubUpdate(ClubVO club, HttpServletResponse response) throws SQLException, IOException{
		ResponseEntity<String> entity = null;
		try {
			clubService.modify(club);
			String club_no = club.getClub_no();
			entity = new ResponseEntity<String>(club_no,HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
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
	@RequestMapping(value="/findName",produces = "application/text; charset=utf8")
	public ResponseEntity <String> findName(String club_name) throws Exception{
		ResponseEntity <String> entity = null;
		try {
			int count = clubService.countClub(club_name);
			if(count>=1) {
				entity = new ResponseEntity <String>(HttpStatus.INTERNAL_SERVER_ERROR);
			}else {
				entity = new ResponseEntity<String>(club_name,HttpStatus.OK);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity <String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}

	@RequestMapping(value = "/registAttach", method = RequestMethod.POST)
	public void registAttach(MultipartFile[] uploadFile, String club_no) throws Exception {
	
		try {
			ClubVO clubVO = clubService.getClub(club_no);
			AttachVO attach = new AttachVO();
			//파일등록
			String mem_id = clubVO.getMem_id();
		
			if(uploadFile != null) {
				for (MultipartFile file : uploadFile) {
					
					attach.setAttach_writer(mem_id);
					attach = UploadFileUtils.uploadFile("d:\\upload", file.getOriginalFilename(), mem_id,
							file.getBytes());
					attach.setAttach_board(club_no);
					System.out.println(attach);
					attachDAO.insertAttach(attach);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	@RequestMapping(value = "/registAttachThum", method = RequestMethod.POST)
	public void registAttachThum(MultipartFile[] uploadThum, String club_no) throws Exception {
		
		try {
			ClubVO clubVO = clubService.getClub(club_no);
			AttachVO attach = new AttachVO();
			//파일등록
			String mem_id = clubVO.getMem_id();
	
			club_no = club_no + "c";
			
			
			if(uploadThum != null) {
				for (MultipartFile file : uploadThum) {
					String fileName = file.getOriginalFilename();
					if(fileName!="") {
						attach.setAttach_writer(mem_id);
						attach = UploadFileUtils.uploadFile("d:\\upload", file.getOriginalFilename(), mem_id,
								file.getBytes());
						attach.setAttach_board(club_no);
						
						attachDAO.insertAttach(attach);
					}
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	@RequestMapping(value = "/modifyAttach", method = RequestMethod.POST)
	public void attachModify(String club_no, MultipartFile[] uploadFile, int[] deleteFile) throws Exception {
		ClubVO clubVO = clubService.getClub(club_no);
		
		if (deleteFile != null) {
			for (int attach_no : deleteFile) {
				AttachVO attach = attachDAO.selectAttachByAttachno(attach_no);

				DeleteFileUtils.delete(uploadPath, attach);

				attachDAO.deleteAttach(attach_no);
			}
		}else {System.out.println("아아아");}
		List<AttachVO> attachList = new ArrayList<AttachVO>();
		
		if(uploadFile!=null) {
			

			 for(MultipartFile file : uploadFile) {
				
				// System.out.println("upload file : "+file.getOriginalFilename());
				 AttachVO attach = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), "admin@naver.com", file.getBytes());
				 
				 attach.setAttach_board(club_no);
				 attachList.add(attach);
				 attachDAO.insertAttach(attach);
			 }
			 clubVO.setAttachList(attachList);;
		}
		clubService.modify(clubVO);
		 
	}
	
	@RequestMapping(value = "/modifyAttachThum", method = RequestMethod.POST)
	public void attachModifyThum(MultipartFile[] uploadThum, String club_no) throws Exception {
		try {
			ClubVO clubVO = clubService.getClub(club_no);
			AttachVO attach = new AttachVO();
			//파일등록
			String mem_id = clubVO.getMem_id();
			
			club_no = club_no + "c";
			int count = attachDAO.selectAttachThumCount(club_no);
			if(uploadThum != null) {
				for (MultipartFile file : uploadThum) {
					String fileName = file.getOriginalFilename();
					System.out.println(fileName);
					
					if(fileName!="") {
						if(count >=1) {
							attachDAO.deleteAllAttach(club_no);
							DeleteFileUtils.delete(uploadPath, attach);
						}
						attach.setAttach_writer(mem_id);
						attach = UploadFileUtils.uploadFile("d:\\upload", file.getOriginalFilename(), mem_id,
								file.getBytes());
						attach.setAttach_board(club_no);
						
						attachDAO.insertAttach(attach);
					}
				}
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
