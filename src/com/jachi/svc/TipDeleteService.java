package com.jachi.svc;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DAO.BoardDAO;

public class TipDeleteService {
	SqlSession sqlsession = BoardDAO.getInstance();
	   public boolean removeTip(int tip_num) throws Exception{
		   
		   boolean RemoveSuccess = false;
		   
		   int deleteCount = sqlsession.delete("delete_Tip", tip_num);
		   
		   if(deleteCount > 0) {
			   sqlsession.commit();
			   RemoveSuccess = true;
		   }
		   
		   
		   
		   return RemoveSuccess;
	   }
	   
	   public void removeComment(int tip_num) throws Exception{
		   
		   boolean RemoveComment = false;
		   
		   sqlsession.delete("delete_Tip_inComment", tip_num);   
		   sqlsession.commit();		   
		   
		   
	   }
}
