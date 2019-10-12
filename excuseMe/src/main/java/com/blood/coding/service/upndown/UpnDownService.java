package com.blood.coding.service.upndown;

import java.sql.SQLException;

import com.blood.coding.dao.down.DownDAO;
import com.blood.coding.dao.up.UpDAO;
import com.blood.coding.dto.down.DownVO;
import com.blood.coding.dto.up.UpVO;

public class UpnDownService {

	private UpDAO upDAO;
	public void setUpDAO(UpDAO upDAO) {
		this.upDAO = upDAO;
	}
	
	private DownDAO downDAO;
	public void setDownDAO(DownDAO downDAO) {
		this.downDAO = downDAO;
	}
	
	
	public boolean registUp(UpVO up) throws SQLException {
		UpVO upvo = upDAO.checkUp(up);
		
		if(upvo != null)  {
			System.out.println("널이아니면 값이있다는거지");
			return false;
		}
		else {
			System.out.println("요거는 출력함??");
			upDAO.insertUp(up);
			System.out.println("업을 인설트했다잉");
			return true;
		}
		
	}
	
	public boolean registDown(DownVO down) throws SQLException {
		DownVO downvo = downDAO.checkDown(down);
		
		if(downvo != null)  {
			return false;
		}
		else {
			downDAO.insertDown(down);
			System.out.println("다운을 인설트했다잉");
			return true;
		}
		
	}
	
}
