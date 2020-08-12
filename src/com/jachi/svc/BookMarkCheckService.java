package com.jachi.svc;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DAO.BoardDAO;

public class BookMarkCheckService {
	SqlSessionFactory factory = BoardDAO.getConn();
	  SqlSession sqlsession = factory.openSession();
	  int result = 0;
	public int likeCheck(Map<String, Object> m) throws Exception{
		try {
		
		
		  result = sqlsession.selectOne("book_check", m);
		  System.out.println(result);
		}catch (Exception e) {
			System.out.println("recCheck : " + e);
			e.printStackTrace();
		}
		 

		return result;
		
	}
	public void recUpdate(Map<String, Object> m)throws Exception{
		try {
			int insert =sqlsession.insert("book_update", m);
			System.out.println(insert);
			sqlsession.commit();
			 sqlsession.close();
		} catch (Exception e) {
			System.out.println("recUpdate : " + e);
			e.printStackTrace();
		}
	}
	
	// �Խñ� ��õ ����
	public void recDelete(Map<String, Object> m)throws Exception{
		try {
			int insert =sqlsession.delete("book_delete", m);
			System.out.println(insert);
			sqlsession.commit();
			 sqlsession.close();
		} catch (Exception e) {
			System.out.println("recDelete : " + e);
			e.printStackTrace();
		}
	}
}
