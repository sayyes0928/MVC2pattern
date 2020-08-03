package com.jachi.svc;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DTO.ProductinfoDTO;
import com.jachi.DAO.BoardDAO;

public class JoinIdcheckUserinfoService {
	
	public String checkUserID(String us_id) {
		SqlSessionFactory factory = BoardDAO.getConn();
		  SqlSession sqlsession = factory.openSession();
		  String id_se = sqlsession.selectOne("us_id_select", us_id);
		  sqlsession.close();

		return id_se;
		
	}
}
