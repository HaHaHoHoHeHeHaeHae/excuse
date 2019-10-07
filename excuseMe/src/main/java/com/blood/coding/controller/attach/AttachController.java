
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
	
	//첨�??��?�� ?���??�� ?��?��로드 ?��?�� 메소?��!!
	@RequestMapping(value = "/get", method=RequestMethod.GET)
	public ResponseEntity<byte[]> getAttach(int attach_no) throws Exception {
		
		ResponseEntity<byte[]> entity = null;
		
		System.out.println(attach_no);
		
		//첨�??��?�� ?��?���? ?��?��치테?���? PK값으�? 조회?��?�� ?��비에?�� �??��?��?��.
		AttachVO attach = attachDAO.selectAttachByAttachno(attach_no);
		
		//?��?���? ?��?��블에?�� 꺼낸 첨�??��?�� ?��름을 만들?���??��. 
		String fileName = attach.getAttach_uuid() + "$$" + attach.getAttach_name();
		//?��비에 ???��?�� ?��?��?���? 구조�? 받아?��?��.
		String filePath = attach.getAttach_path();
		
		//?��?�� ?��?��?��치경�? 만들�?
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
