package com.jachi.svc;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.ProductinfoDTO;

public class CateSearchService {

	
	public List<ProductinfoDTO> getcatesearch(String cate1){
		
		SqlSessionFactory sqlfactory = BoardDAO.getConn();
		SqlSession sqlsession = sqlfactory.openSession();
		
		List<ProductinfoDTO> prod = sqlsession.selectList("cate_searchtest", cate1);
		sqlsession.close();
		
		return prod;
		
	}
}
