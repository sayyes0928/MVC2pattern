package com.jachi.svc;


import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.BoardBean;
import com.jachi.DTO.ProductinfoDTO;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class BoardWriteProService {
	SqlSession sqlsession = BoardDAO.getInstance();

	public boolean registArticle(BoardBean boardBean) throws Exception{
		
		boolean isWriteSuccess = false;

		 int insert = sqlsession.insert("insert_qna_board",boardBean);
				
		
		if(insert > 0){
			sqlsession.commit();
			isWriteSuccess = true;
		}
		
		
		return isWriteSuccess;
		
	}

}
