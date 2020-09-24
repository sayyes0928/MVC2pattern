package com.jachi.svc;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.BeautyRoomDTO;

public class BookMarkCheckService {
	SqlSessionFactory factory = BoardDAO.getConn();
	SqlSession sqlsession = factory.openSession();
	int result = 0;

	public int likeCheck(Map<String, Object> m) throws Exception {
		try {

			result = sqlsession.selectOne("book_check", m);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;

	}

	public void recUpdate(Map<String, Object> m) throws Exception {
		try {
			int insert = sqlsession.insert("book_update", m);
			sqlsession.commit();
			sqlsession.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// �Խñ� ��õ ����
	public void recDelete(Map<String, Object> m) throws Exception {
		try {
			int insert = sqlsession.delete("book_delete", m);
			sqlsession.commit();
			sqlsession.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<BeautyRoomDTO> getBookmarkList(String us_id){
	
			List<BeautyRoomDTO> getBookmarkList = sqlsession.selectList("select_getScrapList", us_id);
			sqlsession.close();
			
		return getBookmarkList;
	}
}
