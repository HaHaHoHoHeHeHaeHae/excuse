package com.blood.coding.controller.common;

import java.io.File;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;


/*섬머노트 본문에 이미지 추가할때 쓰이는 컨트롤러*/
@Controller
public class EditorUploadController {
	
	@Resource(name="imgPath")
	private String imgPath;
	
//	섬머노트 iframe 사용하기위함
/*	@RequestMapping("/summernote")
	public String summernote() throws Exception{
		
		return "common/summernote";
<<<<<<< HEAD
	}
	*/
	
	@RequestMapping("/uploadImg")
	public ResponseEntity<String> uploadImg(MultipartFile file, String id, HttpServletRequest request) throws Exception {
		
		ResponseEntity<String> result = null;
		
		String savePath = request.getServletContext().getRealPath(imgPath + id + "/"); 
		String uuidName = UUID.randomUUID().toString().replace("-", "");
		String fileFormat = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
		
		String fileName = uuidName + fileFormat;
		
		File saveFile = new File(savePath + fileName);
		
		if(!saveFile.exists()) {
			saveFile.mkdirs();
		}
		
		try {
			file.transferTo(saveFile);
			result = new ResponseEntity<String>(request.getContextPath() + imgPath + id + "/" + fileName, HttpStatus.OK);
		} 
		catch(Exception e){
			result = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return result;
	}
	
	
	@RequestMapping("/deleteImg")
	public ResponseEntity<String> deleteImg(String fileName, String id, HttpServletRequest request) throws Exception {
		
		ResponseEntity<String> result = null;
		
		String savePath = request.getServletContext().getRealPath(imgPath + "/" + id + "/" );
		
		File delFile = new File(savePath + fileName);
		
		if(!delFile.exists()) {
			result = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		else {
			try {
				delFile.delete();
				result = new ResponseEntity<String>(HttpStatus.OK);
			}
			catch(Exception e) {
				result = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
				
		}
		
		
		return result;
	}

}
