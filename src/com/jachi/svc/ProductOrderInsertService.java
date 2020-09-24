package com.jachi.svc;

import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.DeliveryDTO;
import com.jachi.DTO.OrderDTO;
import com.jachi.DTO.Product_cartDTO;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class ProductOrderInsertService {

	public void Ordercomplite(OrderDTO orderDTO) throws Exception {

		SqlSessionFactory sqlfactory = BoardDAO.getConn();
		SqlSession sqlsession = sqlfactory.openSession();
		
		int insert = sqlsession.insert("insert_order_complite", orderDTO);

		sqlsession.commit();
		sqlsession.close();

	}
	public void OrderDelivery(DeliveryDTO deliveryDTO) throws Exception {

		SqlSessionFactory sqlfactory = BoardDAO.getConn();
		SqlSession sqlsession = sqlfactory.openSession();
		
		int insert = sqlsession.insert("insert_deliver_orcode", deliveryDTO);

		sqlsession.commit();
		sqlsession.close();

	}
}
