
package com.blood.coding.controller.mail;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blood.coding.service.common.LoginService;


@Controller
@RequestMapping("/mail")
public class MailController extends Authenticator{
	
	@Autowired
	private LoginService service;
	
	@RequestMapping(value="/sendPwd", method=RequestMethod.POST)
	@ResponseBody
    public ResponseEntity<Object> mailSend(@RequestParam("mem_id") String mem_id, @RequestParam("mem_name") String mem_name) throws Exception{
		ResponseEntity<Object> mailSend = null;
		
        Properties prop = System.getProperties();
        prop.put("mail.smtp.ssl.enable", "true");
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.ssl.trust","smtp.gmail.com" );
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.port", 465);
        
        Message msg = new MimeMessage(Session.getDefaultInstance(prop, new Authenticator(){
        	protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("mhhan2004@gmail.com", "min0147!");
            }
        }
		));

    
        try {
        	String mem_pwd = service.pwdFind(mem_id, mem_name);
            msg.setSentDate(new Date());
            
            
            
            if(mem_pwd != null) {
            
            msg.setFrom(new InternetAddress("mhhan2004@gmail.com", "VISITOR"));
            InternetAddress to = new InternetAddress(mem_id);         
            msg.setRecipient(Message.RecipientType.TO, to);            
            msg.setSubject("회원님의 Excuse Me 비밀번호입니다.");            
            msg.setText("비밀번호는"+mem_pwd+"입니다.");            
           
            Transport.send(msg);
            mailSend = new ResponseEntity<Object>(HttpStatus.OK);
            }else {
            mailSend=new ResponseEntity<Object>(HttpStatus.INTERNAL_SERVER_ERROR);	
            }
            
            
        } catch(Exception e) {            
      			e.printStackTrace();
      			mailSend=new ResponseEntity<Object>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
            
        return mailSend;
    }

}
