package com.jachi.svc;


import com.jachi.DAO.BoardDAO;
import com.jachi.Dto.BoardBean;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class BoardWriteProService {

	public boolean registArticle(BoardBean boardBean) throws Exception{
		
		boolean isWriteSuccess = false;
		
		 SqlSessionFactory sqlfactory = BoardDAO.getConn();
		 SqlSession sqlsession = sqlfactory.openSession();
		 int insert = sqlsession.insert("insert_qna_board",boardBean);
				
		
		if(insert > 0){
			sqlsession.commit();
			isWriteSuccess = true;
		}
		
		sqlsession.close();
		return isWriteSuccess;
		
	}

}
