package com.jachi.svc;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.BeautyRoomDTO;

public class JachiMainService {

		public int mainbestbtListCount() throws Exception{
			
			int listCount =0;
			
			SqlSessionFactory sqlfactory = BoardDAO.getConn();
			SqlSession sqlsession = sqlfactory.openSession();
			listCount = sqlsession.selectOne("mainbestbtselect_list");
			
			return listCount;
			
		}
		
		public List<BeautyRoomDTO> getmainbestbtall() throws Exception{
			
			SqlSessionFactory sqlfactory = BoardDAO.getConn();
			SqlSession sqlsession = sqlfactory.openSession();
			
			List<BeautyRoomDTO> selectList = sqlsession.selectList("mainbestbtall");
			
			return selectList;
			
		}
}
