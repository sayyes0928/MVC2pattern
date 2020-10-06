package com.jachi.svc;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.BeautyRoomDTO;

public class LikePostinCheckService {
	
	SqlSession sqlsession = BoardDAO.getInstance();
	  
	  int result = 0;
	public int likeCheck(Map<String, Object> m) throws Exception{
		try {

		  result = sqlsession.selectOne("rec_check", m);
		}catch (Exception e) {
			System.out.println("recCheck : " + e);
			e.printStackTrace();
		}
		 

		return result;
		
	}
	public void recUpdate(Map<String, Object> m)throws Exception{
		try {
			int insert =sqlsession.insert("rec_update", m);
			sqlsession.commit();
			 
		} catch (Exception e) {
			System.out.println("recUpdate : " + e);
			e.printStackTrace();
		}
	}
	
	// 게시글 추천 제거
	public void recDelete(Map<String, Object> m)throws Exception{
		try {
			int insert =sqlsession.delete("rec_delete", m);
			sqlsession.commit();
			 
		} catch (Exception e) {
			System.out.println("recDelete : " + e);
			e.printStackTrace();
		}
	}
	public List<BeautyRoomDTO> getLikeList(String us_id){
		
		List<BeautyRoomDTO> getBookmarkList = sqlsession.selectList("select_getLikeList", us_id);
		
		
	return getBookmarkList;
}
}
