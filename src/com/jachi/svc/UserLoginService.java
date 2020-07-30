package com.jachi.svc;
import static com.jachi.ConnectionDB.JdbcUtil.*;
import java.sql.Connection;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.UserinfoDTO;

public class UserLoginService {

	public String logingo(String us_id, String us_pw) throws Exception {
		
		boolean userlogininfo = false;
		SqlSessionFactory sqlfactory = BoardDAO.getConn();
		SqlSession sqlsession = sqlfactory.openSession();
		
		UserinfoDTO sllogininfo = sqlsession.selectOne("select_logininfo",us_id);
		System.out.println(sllogininfo+"¼¿·º°ªÀº ¶ß´Ï?");
		
		System.out.println(userlogininfo+"¶°Áà¶óÁ»");
		
		
		return userlogininfo;
		
	}
	
}
