package com.jachi.svc;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.BeautyRoomDTO;

public class BestBTService {
	SqlSession sqlsession = BoardDAO.getInstance();
	
	public List<BeautyRoomDTO> getbestbt() throws Exception{

		
		List<BeautyRoomDTO> selectList = sqlsession.selectList("bestbt");
		
		return selectList;
		
	}
	
}
