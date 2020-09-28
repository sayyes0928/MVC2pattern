package com.jachi.svc;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DAO.BoardDAO;

public class TipDeleteService {
       
	   public boolean removeTip(int tip_num) throws Exception{
		   
		   boolean RemoveSuccess = false;
		   SqlSessionFactory sqlfactory = BoardDAO.getConn();
		   SqlSession sqlsession = sqlfactory.openSession();
		   
		   int deleteCount = sqlsession.delete("delete_Tip", tip_num);
		   
		   if(deleteCount > 0) {
			   sqlsession.commit();
			   RemoveSuccess = true;
		   }
		   
		   sqlsession.close();
		   
		   return RemoveSuccess;
	   }
	   
	   public void removeComment(int tip_num) throws Exception{
		   
		   boolean RemoveComment = false;
		   SqlSessionFactory sqlfactory = BoardDAO.getConn();
		   SqlSession sqlsession = sqlfactory.openSession();
		   
		   sqlsession.delete("delete_Tip_inComment", tip_num);   
		   sqlsession.commit();		   
		   sqlsession.close();
		   
	   }
}
