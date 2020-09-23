package com.jachi.svc;


import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.UserinfoDTO;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class JoinInsertUserInfoService {

	public boolean registArticle(UserinfoDTO userinfoDTO) throws Exception{
		
		boolean isWriteSuccess = false;
		
		 SqlSessionFactory sqlfactory = BoardDAO.getConn();
		 SqlSession sqlsession = sqlfactory.openSession();
		 int insert = sqlsession.insert("insert_join_userinfo",userinfoDTO);
				
		 System.out.println("서비스서비스서비스"+insert);
		if(insert > 0){
			sqlsession.commit();
			isWriteSuccess = true;
		}
		
		sqlsession.close();
		return isWriteSuccess;
		
	}
	public boolean updateUserinfo(UserinfoDTO userinfoDTO) throws Exception{
		
		boolean isWriteSuccess = false;
		
		 SqlSessionFactory sqlfactory = BoardDAO.getConn();
		 SqlSession sqlsession = sqlfactory.openSession();
		 int insert = sqlsession.update("update_userinfo",userinfoDTO);
				
			sqlsession.commit();
			sqlsession.close();
			isWriteSuccess = true;	

		return isWriteSuccess;
		
	}

}
