package com.jachi.svc;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.BeautyRoomDTO;

public class BTListService {

	
	public int getListCount() throws Exception{
		
		int listCount = 0;
		
		SqlSessionFactory sqlfactory = BoardDAO.getConn();
		SqlSession sqlsession = sqlfactory.openSession();
		listCount = sqlsession.selectOne("btselect_list");
		
		return listCount;
	}
	
	public List<BeautyRoomDTO> getArticleList(int page, int limit) throws Exception{
		
		SqlSessionFactory sqlfactory = BoardDAO.getConn();
		SqlSession sqlsession = sqlfactory.openSession();
		
		int starrow=(page-1)*12;
		
		List<BeautyRoomDTO> selectList =sqlsession.selectList("btselect_listall",starrow);
		
		return selectList;
	}
	
}
