package com.jachi.svc;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.BeautyRoomDTO;
import com.jachi.DTO.ProductinfoDTO;

public class JachiMainService {
	SqlSession sqlsession = BoardDAO.getInstance();

		public int mainbestbtListCount() throws Exception{
			
			int listCount =0;
			

			listCount = sqlsession.selectOne("mainbestbtselect_list");
			
			return listCount;
			
		}
		
		public List<BeautyRoomDTO> getmainbestbtall() throws Exception{

			
			List<BeautyRoomDTO> selectList = sqlsession.selectList("mainbestbtall");
			
			return selectList;
			
		}
		
		public int getbestplListCount() throws Exception{
			
			int pllistCount = 0;

			pllistCount = sqlsession.selectOne("mainbestplselect_list");
			
			return pllistCount;
			
		}
		
		public List<ProductinfoDTO> getbestplListall() throws Exception{
			
			
			List<ProductinfoDTO> selectbestplList = sqlsession.selectList("mainbestplall");
			
			return selectbestplList;
			
		}
}
