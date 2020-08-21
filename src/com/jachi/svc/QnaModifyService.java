package com.jachi.svc;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.QnABBS;

public class QnaModifyService {

		public boolean plzup(QnABBS qnam) throws Exception{
			
			boolean isWriteSuccess = false;
			
			SqlSessionFactory sqlfactory = BoardDAO.getConn();
			SqlSession sqlsession = sqlfactory.openSession();
			
			int insert = sqlsession.update("update_qna",qnam);
			
			if(insert > 0) {
				sqlsession.commit();
				isWriteSuccess = true;
			}
			
			sqlsession.close();
			
			return isWriteSuccess;
			
		}
}
