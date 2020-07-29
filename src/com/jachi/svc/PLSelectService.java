package com.jachi.svc;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DTO.ProductinfoDTO;
import com.jachi.DAO.BoardDAO;

public class PLSelectService {
	
	public List<ProductinfoDTO> getproinfo() {
		System.out.println("서비스 들어왔니?");
		SqlSessionFactory sqlfactory = BoardDAO.getConn();
		SqlSession sqlsession = sqlfactory.openSession();
		List<ProductinfoDTO> ProListAll = sqlsession.selectList("select_listall");
		
		sqlsession.close();
		System.out.println("네드렁왔어여");
		return ProListAll;
		
	}
}
