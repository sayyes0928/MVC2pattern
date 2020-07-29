package com.jachi.svc;
import static com.jachi.ConnectionDB.JdbcUtil.*;
import java.sql.Connection;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.UserinfoDTO;

public class UserLoginService {

	public Boolean logingo(String us_id, String us_pw) {
		
		Boolean userlogininfo = false;
		SqlSessionFactory sqlfactory = BoardDAO.getConn();
		SqlSession sqlsession = sqlfactory.openSession();
		
		List<UserinfoDTO> sllogininfo = sqlsession.selectList("select_logininfo");
		
		if(us_pw.equals(sllogininfo.get(0).getUs_pw())) {
			userlogininfo = true;
		};
		
		return userlogininfo;
		
	}
	
}
