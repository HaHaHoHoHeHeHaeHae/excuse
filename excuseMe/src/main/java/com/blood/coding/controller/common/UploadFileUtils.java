package com.blood.coding.controller.common;

import java.awt.image.BufferedImage;
import java.io.File;

import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.util.FileCopyUtils;

import com.blood.coding.dto.attach.AttachVO;

public class UploadFileUtils {

	public static AttachVO uploadFile(String uploadPath, String originalName, String login_mem_id, byte[] fileData) throws Exception{
		AttachVO attach = new AttachVO();
		
		//로그인유저아이디 VO에 넣기
		attach.setAttach_writer(login_mem_id);
		
		String uid = UUID.randomUUID().toString().replace("-", "");
		
		attach.setAttach_uuid(uid);
		
		//uuid에 $$ 추가하고 실제파일이름
		String saveName = uid + "$$" + originalName;
		//저장 경로
		String savePath = calcPath(uploadPath, login_mem_id);
		
		attach.setAttach_path(savePath);
		attach.setAttach_type(originalName.substring(originalName.lastIndexOf(".")+1));
		attach.setAttach_name(originalName);
		
		
		File target = new File(uploadPath + savePath, saveName);
						//byte[] fileData
		FileCopyUtils.copy(fileData, target);
		
		String formatName = originalName.substring(originalName.lastIndexOf(".")+1);
		
		if(ImgCheck.getImgCheck(formatName)!=null) {
			makeThumbnail(uploadPath, savePath, saveName);
		}
		
		
		return attach;
	}
	
	//날짜형식, 로그인한아이디 로 폴더새로만들고 경로만든다.
	private static String calcPath(String uploadPath, String login_mem_id) throws Exception {
		
		Calendar cal = Calendar.getInstance();
		
		String yearPath = File.separator+cal.get(Calendar.YEAR);
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		
		String savePath = File.separator + login_mem_id + datePath;
		
		File path = new File(uploadPath + savePath);
		
		if(!path.exists()) {
			path.mkdirs();
		}
		
		System.out.println(savePath);
		
		return savePath;
	}
	
	private static void makeThumbnail(String uploadPath, String savePath, String saveName) throws Exception {
				
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath + savePath, saveName));
		
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT,70);
		
		String thumbnailName = uploadPath + savePath + File.separator + "s_" + saveName;
		File newFile = new File(thumbnailName);
		
		String formatName = saveName.substring(saveName.lastIndexOf(".") + 1);
		
		//썸네일파일 포맷 확인해보기
		/*ImageIO.write(destImg, formatName.toUpperCase(), newFIle);*/
		ImageIO.write(destImg, formatName, newFile);
	}
	
	
	
		
		
	
}