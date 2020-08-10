package com.jachi.svc;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.BeautyRoomDTO;
import com.jachi.DTO.UserinfoDTO;

public class ProductPreOrderService {

	public List<UserinfoDTO> getOrderinfo(String us_id) {

		SqlSessionFactory sqlfactory = BoardDAO.getConn();
		SqlSession sqlsession = sqlfactory.openSession();
		List<UserinfoDTO> userinfo = sqlsession.selectList("order_userinfo",us_id);
		
		sqlsession.close();

		
		return userinfo;
		
	}
}
