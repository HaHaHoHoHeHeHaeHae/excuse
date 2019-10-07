package com.blood.coding.controller.notice;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.blood.coding.controller.common.Criteria;
import com.blood.coding.controller.common.DeleteFileUtils;
import com.blood.coding.controller.common.UploadFileUtils;
import com.blood.coding.dao.attach.AttachDAO;
import com.blood.coding.dto.attach.AttachVO;
import com.blood.coding.dto.notice.NoticeVO;
import com.blood.coding.service.notice.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	@Autowired
	private NoticeService service;
	@Autowired
	private AttachDAO attachDAO;

	@Resource(name = "uploadPath")
	private String uploadPath;

	// 리스트
	@RequestMapping("/list")
	public ModelAndView ListNotice(Criteria cri) throws Exception {
		String url = "/notice/list";
		ModelAndView mav = new ModelAndView();

		Map<String, Object> map = service.noticeList(cri);

		mav.addObject("dataMap", map);
		mav.setViewName(url);

		return mav;
	}
	
	@RequestMapping("/list_admin")
	public ModelAndView ListNoticeAdmin(Criteria cri) throws Exception {
		String url = "/notice/listAll";
		ModelAndView mav = new ModelAndView();

		Map<String, Object> map = service.noticeListAll(cri);

		mav.addObject("dataMap", map);
		mav.setViewName(url);

		return mav;
	}

	// 상세보기

	@RequestMapping("/detail")
	public ModelAndView DetailNoticer(String not_no, String page, String mem_nick) throws Exception {
		String url = "/notice/detail";

		ModelAndView mav = new ModelAndView();
		NoticeVO vo = service.noticeDetailByMember(not_no);
		
		mav.addObject("page", page);
		mav.addObject("notice", vo);
		mav.addObject("mem_nick", mem_nick);
		mav.setViewName(url);

		return mav;
	}

	@RequestMapping("/noticeDetail")
	public ModelAndView DetailNotice(String not_no, String page, String mem_nick) throws Exception {
		String url = null;
		if(mem_nick.equals("admin")) {
			url = "/notice_sub/detail_admin_form";
		}else {
			url = "/notice_sub/detail_form";
		}
		

		ModelAndView mav = new ModelAndView();
		mav.addObject("page", page);
		NoticeVO vo = service.noticeDetailByMember(not_no);
		List<AttachVO> attachList = attachDAO.selectAttachesByAttachBoard(not_no);
		vo.setAttachList(attachList);
		mav.addObject("notice", vo);
		mav.setViewName(url);

		return mav;
	}

	// 등록, 수정, 삭제
	@RequestMapping(value = "/regist", method = RequestMethod.GET)
	public String registGet() throws Exception {

		return "notice/regist";
	}

	@RequestMapping("/noticeRegist")
	public String noticeRegistForm() throws Exception {
		return "notice_sub/regist_form";
	}

	@RequestMapping(value = "/regist", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Object> registPost(NoticeVO noticeVO) throws Exception {
		ResponseEntity<Object> entity = null;
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		System.out.println(0);
		try {
			// 게시글 내용 등록
			String not_no = service.noticeSeq();
			String mem_id = "admin@naver.com";
			noticeVO.setMem_id(mem_id);

			String endDate = noticeVO.getNot_endDate2();
			String startDate = noticeVO.getNot_startDate2();
			System.out.println(endDate);
			Date not_startDate = transFormat.parse(startDate);
			Date not_endDate = transFormat.parse(endDate);
			noticeVO.setNot_no(not_no);
			noticeVO.setNot_startDate(not_startDate);
			noticeVO.setNot_endDate(not_endDate);
			service.registNotice(noticeVO);
			entity = new ResponseEntity<Object>(not_no, HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Object>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return entity;

	}

	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public ModelAndView modifyGet(String not_no) throws Exception {
		String url = "/notice/modify";
		ModelAndView mav = new ModelAndView();
		NoticeVO vo = service.noticeDetailByAdmin(not_no);

		mav.addObject("notice", vo);
		mav.setViewName(url);

		return mav;
	}

	@RequestMapping(value = "/noticeModify", method = RequestMethod.GET)
	public ModelAndView modifynotice(String not_no) throws Exception {
		String url = "/notice_sub/modify_form";
		ModelAndView mav = new ModelAndView();
		NoticeVO vo = service.noticeDetailByAdmin(not_no);
		List<AttachVO> attachList = attachDAO.selectAttachesByAttachBoard(not_no);
		vo.setAttachList(attachList);
		mav.addObject("notice", vo);
		mav.setViewName(url);

		return mav;
	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public ResponseEntity<Object> modifyPOST(NoticeVO noticeVO) throws Exception {
		ResponseEntity<Object> entity = null;
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		try {
			String not_no = noticeVO.getNot_no();
			String endDate = noticeVO.getNot_endDate2();
			String startDate = noticeVO.getNot_startDate2();
			Date not_startDate = transFormat.parse(startDate);
			Date not_endDate = transFormat.parse(endDate);
			noticeVO.setNot_startDate(not_startDate);
			noticeVO.setNot_endDate(not_endDate);
			service.modifyNotice(noticeVO);
			entity = new ResponseEntity<Object>(not_no, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<Object>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return entity;

	}

	@RequestMapping("/remove")
	public ResponseEntity<Object> noticeRemove(String not_no, HttpServletResponse response) throws Exception {
		ResponseEntity<Object> entity = null;

		try {
			service.removeNotice(not_no);
			attachRemove(not_no);
			entity = new ResponseEntity<Object>(HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Object>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return entity;

	}
	// 파일 업로드,삭제

	@RequestMapping(value = "/modifyAttach", method = RequestMethod.POST)
	public void attachModify(String not_no, MultipartFile[] uploadFile, int[] deleteFile) throws Exception {
		NoticeVO noticeVO = service.noticeDetailByAdmin(not_no);
		
		if (deleteFile != null) {
			for (int attach_no : deleteFile) {
				AttachVO attach = attachDAO.selectAttachByAttachno(attach_no);

				DeleteFileUtils.delete(uploadPath, attach);

				attachDAO.deleteAttach(attach_no);
			}
		}
		List<AttachVO> attachList = new ArrayList<AttachVO>();
		
		if(uploadFile!=null) {
			
			 for(MultipartFile file : uploadFile) {
				// System.out.println("upload file : "+file.getOriginalFilename());
				 AttachVO attach = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), "admin@naver.com", file.getBytes());
				 
				 attach.setAttach_board(not_no);
				 attachList.add(attach);
				 attachDAO.insertAttach(attach);
			 }
			 noticeVO.setAttachList(attachList);
		}
		service.modifyNotice(noticeVO);
		 
	}

	@RequestMapping(value = "/removeAttach", method = RequestMethod.POST)
	public void attachRemove(String not_no) throws Exception {
		try {
			System.out.println(1);
			List<AttachVO> attach = attachDAO.selectAttachesByAttachBoard(not_no);
			DeleteFileUtils.delete(uploadPath, attach);
			for (AttachVO attachVO : attach) {
				int attach_no = attachVO.getAttach_no();

				attachDAO.deleteAttach(attach_no);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@RequestMapping(value = "/registAttach", method = RequestMethod.POST)
	public void registAttach(MultipartFile[] uploadFile, String not_no) throws Exception {

		try {
			AttachVO attach = new AttachVO();
			//파일등록
			for (MultipartFile file : uploadFile) {
				attach = UploadFileUtils.uploadFile("d:\\upload", file.getOriginalFilename(), "admin@naver.com",
						file.getBytes());
				attach.setAttach_board(not_no);
				System.out.println(attach);
				attachDAO.insertAttach(attach);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
