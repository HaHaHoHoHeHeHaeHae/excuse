package com.blood.coding.controller.common;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

public class DownloadFileUtils {

	public static ResponseEntity<byte[]> download(String filePath) throws Exception {
		
		InputStream input = null;
		ResponseEntity<byte[]> entity = null;
		
		String formatName=filePath.substring(filePath.lastIndexOf(".")+1);
		MediaType imgCheck = ImgCheck.getImgCheck(formatName);
		
		HttpHeaders headers = new HttpHeaders();
		
		try {
			input = new FileInputStream(filePath);
			
			if(imgCheck!=null) {
				headers.setContentType(imgCheck);
			}
			else {
				String fileName = filePath.substring(filePath.indexOf("$$")+2);
				
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition", "attachment;filename=\""+new String(fileName.getBytes("utf-8"),"ISO-8859-1")+"\"");
			}
		}
		catch(IOException e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		finally {
			input.close();
		}
		return entity;
	}
	
}
