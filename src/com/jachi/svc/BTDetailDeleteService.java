package com.jachi.svc;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.BeautyRoomDTO;

public class BTDetailDeleteService {

	public List<BeautyRoomDTO> deletebtpost(int bt_num) throws Exception{
		SqlSessionFactory sqlfactory = BoardDAO.getConn();
		SqlSession sqlsession = sqlfactory.openSession();
		
		List<BeautyRoomDTO> btdel = sqlsession.selectList("bt_del",bt_num);
		sqlsession.close();
		
		return btdel;
		
	}
}
