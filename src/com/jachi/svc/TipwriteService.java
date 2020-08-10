package com.jachi.svc;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.TipDTO;;

public class TipwriteService {
	public boolean registArticle(TipDTO tipDTO) throws Exception{
		
		boolean isWriteSuccess = false;
		System.out.println(tipDTO.getTip_nickname());
		System.out.println(tipDTO.getTip_post());
		System.out.println(tipDTO.getTip_title());
		 SqlSessionFactory sqlfactory = BoardDAO.getConn();
		 SqlSession sqlsession = sqlfactory.openSession();
		 int insert = sqlsession.insert("insert_tip",tipDTO);
				
		
		if(insert > 0){
			sqlsession.commit();
			isWriteSuccess = true;
		}
		
		sqlsession.close();
		return isWriteSuccess;
		
	}

}


