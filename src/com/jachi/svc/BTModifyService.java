package com.jachi.svc;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.BeautyRoomDTO;

public class BTModifyService {

	public boolean btmo(BeautyRoomDTO btm) throws Exception{
		
		boolean isWriteSuccess =false;
		
		SqlSession sqlsession = BoardDAO.getInstance();
		
		int insert = sqlsession.update("update_btm",btm);
		
		
		if(insert > 0) {
			sqlsession.commit();
			isWriteSuccess = true;
		}
		
		sqlsession.close();
		
		return isWriteSuccess;
		
	}
}
