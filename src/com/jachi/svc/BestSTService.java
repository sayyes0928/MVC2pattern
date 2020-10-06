package com.jachi.svc;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.ProductinfoDTO;


public class BestSTService {

	
SqlSession sqlsession = BoardDAO.getInstance();
	
	public List<ProductinfoDTO> getbestst() throws Exception{

		
		List<ProductinfoDTO> selectList = sqlsession.selectList("bestst");
		
		return selectList;
		
	}
}
