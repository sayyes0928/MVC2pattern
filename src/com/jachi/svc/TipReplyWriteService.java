package com.jachi.svc;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.TipReplyDTO;

public class TipReplyWriteService {
    
public boolean registArticle(TipReplyDTO repdto) throws Exception{
		
		boolean isWriteSuccess = false;
		
		SqlSessionFactory sqlfactory = BoardDAO.getConn();
		SqlSession sqlsession = sqlfactory.openSession();
		int insert = sqlsession.insert("insert_TipReply", repdto);
		
		if(insert > 0) {
			sqlsession.commit();
			isWriteSuccess = true;
		}
		
		sqlsession.close();
		
		return isWriteSuccess;
		
		
	}
}
