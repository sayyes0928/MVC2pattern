package com.jachi.svc;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.ProductinfoDTO;

public class PLIndexService {

	
	public List<ProductinfoDTO> getproindexinfo() {
		
		SqlSessionFactory sqlfactory = BoardDAO.getConn();
		SqlSession sqlsession = sqlfactory.openSession();
		List<ProductinfoDTO> ProListAll = sqlsession.selectList("select_listall");
		
		sqlsession.close();
		
		return ProListAll;
		
	}
}
