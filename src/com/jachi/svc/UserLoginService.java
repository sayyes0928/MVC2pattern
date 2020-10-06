package com.jachi.svc;
import static com.jachi.ConnectionDB.JdbcUtil.*;
import java.sql.Connection;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.UserinfoDTO;

public class UserLoginService {

	public String logingo(String us_id) throws Exception {
		
		
		SqlSession sqlsession = BoardDAO.getInstance();		
		String sllogininfo = sqlsession.selectOne("select_logininfo",us_id);
	
		
		return sllogininfo;
		
	}
	
}
