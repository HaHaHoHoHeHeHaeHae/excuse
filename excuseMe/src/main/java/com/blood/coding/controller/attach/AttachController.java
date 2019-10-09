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
	
	//첨부파일 클릭시 다운로드 하는 메소드!!
	@RequestMapping(value = "/get", method=RequestMethod.GET)
	public ResponseEntity<byte[]> getAttach(int attach_no) throws Exception {
		
		ResponseEntity<byte[]> entity = null;
		
		System.out.println(attach_no);
		
		//첨부파일 하나를 어테치테이블 PK값으로 조회해서 디비에서 가져온다.
		AttachVO attach = attachDAO.selectAttachByAttachno(attach_no);
		
		//어테치 테이블에서 꺼낸 첨부파일 이름을 만들어준다. 
		String fileName = attach.getAttach_uuid() + "$$" + attach.getAttach_name();
		//디비에 저장된 디렉토리 구조를 받아온다.
		String filePath = attach.getAttach_path();
		
		//실제 파일위치경로 만들기
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
	//대표사진 들고오는 메서드
	@RequestMapping("/img")
	public ResponseEntity<byte[]> getImg(int attach_no)throws Exception{
		
		ResponseEntity<byte[]> entity = null;
		
		AttachVO attach=attachDAO.selectAttachByAttachno(attach_no);
		String fileName=attach.getAttach_uuid()+"$$"+attach.getAttach_name();
		String filePath=attach.getAttach_path();
		
		filePath = uploadPath+filePath+File.separator+fileName;
		
		return DownloadFileUtils.download(filePath);
	}
	
}
