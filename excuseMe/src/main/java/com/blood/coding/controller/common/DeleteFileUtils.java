
package com.blood.coding.controller.common;

import java.io.File;
import java.util.List;

import org.springframework.http.MediaType;

import com.blood.coding.dto.attach.AttachVO;

public class DeleteFileUtils {
	
	public static void delete(String uploadPath, AttachVO attach) throws Exception {
		
		MediaType imgCheck = ImgCheck.getImgCheck(attach.getAttach_type());
		
		
		
		//?ù¥?îÑÎ¨? Ï∂©Ï°±?ãú ?ù¥ÎØ∏Ï? ?åå?ùº
		if(imgCheck != null) {
			File thumbnail = new File(uploadPath + attach.getAttach_path() + File.separator + "s_" + attach.getAttach_uuid() + "$$" + attach.getAttach_name());
			thumbnail.delete();
		}
		File realFile = new File(uploadPath + attach.getAttach_path() + File.separator + attach.getAttach_uuid()+ "$$" + attach.getAttach_name());
		System.out.println(realFile.toString());
		realFile.delete();
	}
	
	public static void delete(String uploadPath, List<AttachVO> attach) throws Exception {
		for(AttachVO attachVO : attach) {
		MediaType imgCheck = ImgCheck.getImgCheck(attachVO.getAttach_type());
		
		
		
		//?ù¥?îÑÎ¨? Ï∂©Ï°±?ãú ?ù¥ÎØ∏Ï? ?åå?ùº
		if(imgCheck != null) {
			File thumbnail = new File(uploadPath + attachVO.getAttach_path() + File.separator + "s_" + attachVO.getAttach_uuid() + "$$" + attachVO.getAttach_name());
			thumbnail.delete();
		}
		File realFile = new File(uploadPath + attachVO.getAttach_path() + File.separator + attachVO.getAttach_uuid()+ "$$" + attachVO.getAttach_name());
		System.out.println(realFile.toString());
		realFile.delete();
		}
	}

}
