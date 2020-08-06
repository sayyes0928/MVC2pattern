package com.jachi.svc;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.BeautyRoomDTO;

public class MyhomeDetailService {

	public List<BeautyRoomDTO> getArticle(int board_num) throws Exception{
		// TODO Auto-generated method stub
		
		SqlSessionFactory sqlfactory = BoardDAO.getConn();
		SqlSession sqlsession = sqlfactory.openSession();
		List<BeautyRoomDTO> beautylistall = sqlsession.selectList("select_beautyall");
		
		sqlsession.close();

		return beautylistall;
		
	}

}
