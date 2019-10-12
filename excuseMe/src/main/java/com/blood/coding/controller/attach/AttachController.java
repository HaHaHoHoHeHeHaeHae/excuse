
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
import com.blood.coding.dto.attach.AttachVO;
import com.blood.coding.service.club.ClubService;

@RestController
@RequestMapping("/attach")
public class AttachController {

	@Autowired
	private ClubService clubService;
	
	@Autowired
	private AttachDAO attachDAO;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	//파일 꺼내서 다운로드할수 있게 하는 메서드
	@RequestMapping(value = "/get", method=RequestMethod.GET)
	public ResponseEntity<byte[]> getAttach(int attach_no) throws Exception {
		
		ResponseEntity<byte[]> entity = null;
		
		System.out.println(attach_no);
		
		
		AttachVO attach = attachDAO.selectAttachByAttachno(attach_no);
		
		String fileName = attach.getAttach_uuid() + "$$" + attach.getAttach_name();
		
		String filePath = attach.getAttach_path();
		
		//?��?�� ?��?��?��치경�? 만들�?
		filePath = uploadPath + filePath + File.separator + fileName;	
		System.out.println(filePath);
		return DownloadFileUtils.downloadAll(filePath);
	}
	
	//첨부파일 썸네일
	@RequestMapping("/thum")
	public ResponseEntity<byte[]> getThumbnail(int attach_no)throws Exception{
		
		ResponseEntity<byte[]> entity = null;
		
		AttachVO attach=attachDAO.selectAttachByAttachno(attach_no);
		String fileName="s_"+attach.getAttach_uuid()+"$$"+attach.getAttach_name();
		String filePath=attach.getAttach_path();
		
		filePath = uploadPath+filePath+File.separator+fileName;
		
		return DownloadFileUtils.download(filePath);
	}
	
	//동호회 대표사진
	@RequestMapping("/img")
	public ResponseEntity<byte[]> getImg(int attach_no) throws Exception{
		ResponseEntity<byte[]> entity = null;
		
		AttachVO attach = attachDAO.selectAttachByAttachno(attach_no);
		String fileName = attach.getAttach_uuid()+"$$"+attach.getAttach_name();
		String filePath = attach.getAttach_path();
		
		filePath = uploadPath + filePath + File.separator + fileName;
		
		return DownloadFileUtils.download(filePath);
	}
}

