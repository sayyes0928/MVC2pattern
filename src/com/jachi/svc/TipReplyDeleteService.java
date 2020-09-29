package com.jachi.svc;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.TipReplyDTO;

public class TipReplyDeleteService {
      
	    public boolean removeAticle(TipReplyDTO rep_dto) throws Exception{
	    	
	    	boolean RemoveSuccess = false;
	    	SqlSessionFactory sqlfactory = BoardDAO.getConn();
	    	SqlSession sqlsession = sqlfactory.openSession();
	    	
	        int deleteCount = sqlsession.delete("tip_comment_delete", rep_dto);
	        
	        if(deleteCount > 0) {
	        	 sqlsession.commit();
	        	 RemoveSuccess = true;	        
	        }
	        
	        sqlsession.close();
	        
	        return RemoveSuccess;
	    	
	    }
}
