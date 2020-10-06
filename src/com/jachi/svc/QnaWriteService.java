package com.jachi.svc;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.BeautyRoomDTO;
import com.jachi.DTO.QnABBS;

public class QnaWriteService {
	SqlSession sqlsession = BoardDAO.getInstance();
	
	
public boolean registArticle(QnABBS qna) throws Exception{
		
		boolean isWriteSuccess = false;
		
		int insert = sqlsession.insert("insert_qna",qna);
		
		if(insert > 0) {
			sqlsession.commit();
			isWriteSuccess = true;
		}
		
		
		
		return isWriteSuccess;
		
		
	}
}
