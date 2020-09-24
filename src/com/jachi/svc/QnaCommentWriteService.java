package com.jachi.svc;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.QnA_Comment;

public class QnaCommentWriteService {

	
	public boolean insertreply(QnA_Comment qcw) throws Exception{
		
		boolean isWriteSuccess = false;
		
		SqlSessionFactory sqlfactory = BoardDAO.getConn();
		SqlSession sqlsession = sqlfactory.openSession();
		int insert = sqlsession.insert("qna_comment_write",qcw);
		
		if(insert > 0) {
			sqlsession.commit();
			isWriteSuccess = true;
		}
		
		sqlsession.close();
		
		return isWriteSuccess;
		
	}
}
