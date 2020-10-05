package com.jachi.svc;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.TipReplyDTO;

public class TipReplyDeleteService {
      
	    public boolean removeAticle(TipReplyDTO rep_dto) throws Exception{
	    	
	    	boolean RemoveSuccess = false;
	    	SqlSession sqlsession = BoardDAO.getInstance();
	    	
	        int deleteCount = sqlsession.delete("tip_comment_delete", rep_dto);
	        
	        if(deleteCount > 0) {
	        	 sqlsession.commit();
	        	 RemoveSuccess = true;	        
	        }
	        
	        
	        
	        return RemoveSuccess;
	    	
	    }
}
