package com.jachi.svc;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.BeautyRoomDTO;

public class BTListService {
	SqlSession sqlsession = BoardDAO.getInstance();

	
	public int getListCount() throws Exception{
		
		int listCount = 0;
		
		listCount = sqlsession.selectOne("btselect_list");
		System.out.println(listCount);
		return listCount;
	}
	
	public List<BeautyRoomDTO> getArticleList(int page, int limit) throws Exception{
		

		int starrow=(page-1)*12;
		
		List<BeautyRoomDTO> selectList = sqlsession.selectList("btselect_listall",starrow);
		
		return selectList;
	}
	
}
