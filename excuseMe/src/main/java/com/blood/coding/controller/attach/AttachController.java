package com.blood.coding.controller.attach;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.blood.coding.dao.attach.AttachDAO;

@RestController
@RequestMapping("/attach")
public class AttachController {

	@Autowired
	private AttachDAO attachDAO;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	//첨부파일 클릭시 다운로드 하는 메소드!!
	@RequestMapping("/get")
	public ResponseEntity<byte[]> getAttach(int attach_no) throws Exception {
		
		ResponseEntity<byte[]> entity = null;
		
		/*AttachVO attach = attach*/
		
//		String fi
		
		return null;
	}
	
}
