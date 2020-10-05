package com.jachi.svc;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.BeautyRoomDTO;
import com.jachi.DTO.UserinfoDTO;

public class ProductPreOrderService {
	SqlSession sqlsession = BoardDAO.getInstance();

	public List<UserinfoDTO> getOrderinfo(String us_id) {

		List<UserinfoDTO> userinfo = sqlsession.selectList("order_userinfo",us_id);
		
		

		
		return userinfo;
		
	}
}
