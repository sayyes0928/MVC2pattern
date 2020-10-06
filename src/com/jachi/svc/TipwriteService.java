package com.jachi.svc;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.TipDTO;;

public class TipwriteService {
	public boolean registArticle(TipDTO tipDTO) throws Exception {

		boolean isWriteSuccess = false;
		SqlSession sqlsession = BoardDAO.getInstance();
		int insert = sqlsession.insert("insert_tip", tipDTO);

		if (insert > 0) {
			sqlsession.commit();
			isWriteSuccess = true;
		}

		
		return isWriteSuccess;

	}

}
