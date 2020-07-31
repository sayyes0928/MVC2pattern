package com.jachi.svc;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.OrderListDTO;

public class MypageOrderViewService {
        public List<Integer> getDeliveryCount(String userID) {
        	
    		
   		 SqlSessionFactory sqlfactory = BoardDAO.getConn();
   		 SqlSession sqlsession = sqlfactory.openSession();
   		 List<Integer> deliveryCount = sqlsession.selectList("select_orderview_count", userID);
   		
   		sqlsession.close();
   		
   		return deliveryCount;
        
        }
        
        public List<Object> getOrderList_status(String us_id, String status) {
        	
        	OrderListDTO orderListDTO = new OrderListDTO();
        	orderListDTO.setOr_id(us_id);
        	orderListDTO.setStatus(status);
      		 SqlSessionFactory sqlfactory = BoardDAO.getConn();
      		 SqlSession sqlsession = sqlfactory.openSession();
      		 List<Object> OrderList_status = sqlsession.selectList("orderList_status", orderListDTO);
      		
      		sqlsession.close();
      		
      		return OrderList_status;
           
           }
        


}
