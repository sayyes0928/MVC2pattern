package com.jachi.svc;


import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.BoardBean;
import com.jachi.DTO.ProductinfoDTO;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class ProductinfoWriteProService {

	public boolean registArticle(ProductinfoDTO productinfoDTO) throws Exception{
		
		boolean isWriteSuccess = false;
		
		 SqlSessionFactory sqlfactory = BoardDAO.getConn();
		 SqlSession sqlsession = sqlfactory.openSession();
		 int insert = sqlsession.insert("insert_productinfo",productinfoDTO);
				
		
		if(insert > 0){
			sqlsession.commit();
			isWriteSuccess = true;
		}
		
		sqlsession.close();
		return isWriteSuccess;
		
	}

}
