package com.jachi.svc;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DTO.ProductinfoDTO;
import com.jachi.DAO.BoardDAO;

public class LoginUserService {
	
	public String loginUser(String us_id) {
		SqlSessionFactory factory = BoardDAO.getConn();
		  SqlSession sqlsession = factory.openSession();
		  String login_pw = null;
		   login_pw = sqlsession.selectOne("select_login_user", us_id);
		  sqlsession.close();

		return login_pw;
		
	}
	
	public String loginnkname(String us_id) {
		SqlSessionFactory factory = BoardDAO.getConn();
		  SqlSession sqlsession = factory.openSession();
		  String login_nkname = null;
		  login_nkname = sqlsession.selectOne("select_nkname", us_id);
		  sqlsession.close();
		
		return login_nkname;
		
	}
}
