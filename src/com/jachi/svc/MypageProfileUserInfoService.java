package com.jachi.svc;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.OrderListDTO;
import com.jachi.DTO.UserinfoDTO;

public class MypageProfileUserInfoService {
        public List<UserinfoDTO> getUserInfo_list(String us_id) {
        	
    		
   		 SqlSessionFactory sqlfactory = BoardDAO.getConn();
   		 SqlSession sqlsession = sqlfactory.openSession();
   		 List<UserinfoDTO> deliveryCount = sqlsession.selectList("select_mypage_userinfo", us_id);
   		
   		sqlsession.close();
   		
   		return deliveryCount;
        
        }
}
