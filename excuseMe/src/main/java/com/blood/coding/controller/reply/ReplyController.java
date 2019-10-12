package com.blood.coding.controller.reply;

import java.sql.SQLException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.blood.coding.controller.common.Criteria;
import com.blood.coding.dto.reply.ReplyVO;
import com.blood.coding.service.reply.ReplyService;


//url : /replies
///replies/all/{bno}		list : GET방식, bno번 게시글의 댓글 목록
///replies/{rno}			modify : PUT,PATCH방식, rno 댓글의 수정 
///replies/{rno}			remove : DELETE 방식, rno 댓글의 삭제
///replies 					regist : POST 방식 : 댓글 입력
///replies/{bno}/{page} 	page list: GET방식 
//bno번 게시글의 페이징 처리된 댓글 목록

@RestController
@RequestMapping("/replies")
public class ReplyController {

	@Autowired
	private ReplyService service;
	
	
	@RequestMapping(value="/{club_no}/{page}", method=RequestMethod.GET)
	public ResponseEntity<Map<String,Object>> listPage(@PathVariable("club_no") String club_no, 
														@PathVariable("page") int page) throws Exception {
		ResponseEntity<Map<String, Object>> entity = null;
		Criteria cri = new Criteria();
		cri.setPage(page);

		try {
			Map<String, Object> dataMap = service.getReplyList(club_no, cri);
			entity = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
			
		}catch(SQLException e) {
			e.printStackTrace();;
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}

	@RequestMapping(value="", method=RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody ReplyVO reply) throws Exception{
		
		ResponseEntity<String> entity = null;

		try {
			service.registReply(reply);
			
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}
		catch(SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}

	@RequestMapping(value="/{reply_no}", method= {RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> update(@PathVariable("reply_no") int reply_no, @RequestBody ReplyVO reply) throws Exception {
		ResponseEntity<String> entity = null;
		
		reply.setReply_no(reply_no);

		try {
			service.modifyReply(reply);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}
		catch(SQLException e) {
			e.printStackTrace();

			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}


	@RequestMapping(value="/{reply_no}", method=RequestMethod.DELETE)
	public ResponseEntity<String> remove(@PathVariable("reply_no") int reply_no) throws Exception{
		ResponseEntity<String> entity = null;
		
		try {
			service.removeReply(reply_no);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}
		catch(SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}

}
