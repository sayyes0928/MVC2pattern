package com.jachi.svc;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.BeautyRoomDTO;

public class BTindexService {
	SqlSession sqlsession = BoardDAO.getInstance();

	public int btindexListCount() throws Exception{
		
		int listCount =0;

		listCount = sqlsession.selectOne("mainbestbtselect_list");
		
		return listCount;
		
	}
	
	public List<BeautyRoomDTO> btindexall() throws Exception{
		

		
		List<BeautyRoomDTO> selectList = sqlsession.selectList("mainbestbtall");
		
		return selectList;
		
	}
}
