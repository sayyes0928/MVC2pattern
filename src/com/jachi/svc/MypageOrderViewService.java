package com.jachi.svc;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.DeliveryDTO;

public class MypageOrderViewService {
        public List<Integer> getDeliveryCount(String userID) {
        	
    		
   		 SqlSessionFactory sqlfactory = BoardDAO.getConn();
   		 SqlSession sqlsession = sqlfactory.openSession();
   		 List<Integer> deliveryCount = sqlsession.selectList("select_orderview_count", userID);
   		
   		sqlsession.close();
   		
   		return deliveryCount;
        
        }
        


}
