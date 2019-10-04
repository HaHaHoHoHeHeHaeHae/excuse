package com.blood.coding.controller.common;

import java.io.File;

import org.springframework.http.MediaType;

import com.blood.coding.dto.attach.AttachVO;

public class DeleteFileUtils {
	
	public static void delete(String uploadPath, AttachVO attach) throws Exception {
		
		MediaType imgCheck = ImgCheck.getImgCheck(attach.getAttach_type());
		
		
		
		//이프문 충족시 이미지 파일
		if(imgCheck != null) {
			File thumbnail = new File(uploadPath + attach.getAttach_path() + File.separator + "s_" + attach.getAttach_uuid() + "$$" + attach.getAttach_name());
			thumbnail.delete();
		}
		File realFile = new File(uploadPath + attach.getAttach_path() + File.separator + attach.getAttach_uuid()+ "$$" + attach.getAttach_name());
		System.out.println(realFile.toString());
		realFile.delete();
	}

}
