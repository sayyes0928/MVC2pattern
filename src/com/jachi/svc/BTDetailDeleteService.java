package com.jachi.svc;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.BeautyRoomDTO;

public class BTDetailDeleteService {
	SqlSession sqlsession = BoardDAO.getInstance();

	public List<BeautyRoomDTO> deletebtpost(int bt_num) throws Exception{

		
		List<BeautyRoomDTO> btdel = sqlsession.selectList("bt_del",bt_num);
		
		
		return btdel;
		
	}
}
