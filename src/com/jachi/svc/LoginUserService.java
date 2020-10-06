package com.jachi.svc;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DTO.ProductinfoDTO;
import com.jachi.DAO.BoardDAO;

public class LoginUserService {
	SqlSession sqlsession = BoardDAO.getInstance();

	public String loginUser(String us_id) {
		  String login_pw = null;
		   login_pw = sqlsession.selectOne("select_login_user", us_id);
		  

		return login_pw;
		
	}
	
	public String loginnkname(String us_id) {
		  String login_nkname = sqlsession.selectOne("select_nkname", us_id);
		  
		  
		
		return login_nkname;
		
	}
	public String loginnpw(String us_id) {
		  String login_nkname = sqlsession.selectOne("select_pw", us_id);
		  
		  
		
		return login_nkname;
		
	}
}
