
package com.blood.coding.controller.attach;

import java.io.File;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.blood.coding.controller.common.DownloadFileUtils;
import com.blood.coding.dao.attach.AttachDAO;
import com.blood.coding.dao.club.ClubDAO;
import com.blood.coding.dto.attach.AttachVO;

@RestController
@RequestMapping("/attach")
public class AttachController {

	@Autowired
	private ClubDAO clubDAO;
	
	@Autowired
	private AttachDAO attachDAO;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	//ì²¨ë??ŒŒ?¼ ?´ë¦??‹œ ?‹¤?š´ë¡œë“œ ?•˜?Š” ë©”ì†Œ?“œ!!
	@RequestMapping(value = "/get", method=RequestMethod.GET)
	public ResponseEntity<byte[]> getAttach(int attach_no) throws Exception {
		
		ResponseEntity<byte[]> entity = null;
		
		System.out.println(attach_no);
		
		//ì²¨ë??ŒŒ?¼ ?•˜?‚˜ë¥? ?–´?…Œì¹˜í…Œ?´ë¸? PKê°’ìœ¼ë¡? ì¡°íšŒ?•´?„œ ?””ë¹„ì—?„œ ê°?? ¸?˜¨?‹¤.
		AttachVO attach = attachDAO.selectAttachByAttachno(attach_no);
		
		//?–´?…Œì¹? ?…Œ?´ë¸”ì—?„œ êº¼ë‚¸ ì²¨ë??ŒŒ?¼ ?´ë¦„ì„ ë§Œë“¤?–´ì¤??‹¤. 
		String fileName = attach.getAttach_uuid() + "$$" + attach.getAttach_name();
		//?””ë¹„ì— ???¥?œ ?””? ‰?† ë¦? êµ¬ì¡°ë¥? ë°›ì•„?˜¨?‹¤.
		String filePath = attach.getAttach_path();
		
		//?‹¤? œ ?ŒŒ?¼?œ„ì¹˜ê²½ë¡? ë§Œë“¤ê¸?
		filePath = uploadPath + filePath + File.separator + fileName;	
		System.out.println(filePath);
		return DownloadFileUtils.downloadAll(filePath);
	}
	
	@RequestMapping("/thum")
	public ResponseEntity<byte[]> getThumbnail(int attach_no)throws Exception{
		
		ResponseEntity<byte[]> entity = null;
		
		AttachVO attach=attachDAO.selectAttachByAttachno(attach_no);
		String fileName="s_"+attach.getAttach_uuid()+"$$"+attach.getAttach_name();
		String filePath=attach.getAttach_path();
		
		filePath = uploadPath+filePath+File.separator+fileName;
		
		return DownloadFileUtils.download(filePath);
	}
	
}
