package com.jachi.svc;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.OrderListDTO;
import com.jachi.DTO.UserinfoDTO;

public class MypageProfileUserInfoService {
	SqlSession sqlsession = BoardDAO.getInstance();

        public List<UserinfoDTO> getUserInfo_list_profile(String us_id) {
        	
    		
   		 List<UserinfoDTO> deliveryCount = sqlsession.selectList("select_mypage_userinfo", us_id);
   		
   		
   		return deliveryCount;
        
        }
        public List<UserinfoDTO> getUserInfo_list(String us_id) {
        	
    		
   		 List<UserinfoDTO> deliveryCount = sqlsession.selectList("select_mypage_userinfo_photo", us_id);
   		
   		
   		
   		return deliveryCount;
        
        }
}
