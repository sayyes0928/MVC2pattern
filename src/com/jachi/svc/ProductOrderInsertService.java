package com.jachi.svc;

import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.DeliveryDTO;
import com.jachi.DTO.OrderDTO;
import com.jachi.DTO.Product_cartDTO;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class ProductOrderInsertService {
	SqlSession sqlsession = BoardDAO.getInstance();

	public void Ordercomplite(OrderDTO orderDTO) throws Exception {

		
		int insert = sqlsession.insert("insert_order_complite", orderDTO);

		sqlsession.commit();
		

	}
	public void OrderDelivery(DeliveryDTO deliveryDTO) throws Exception {

		
		int insert = sqlsession.insert("insert_deliver_orcode", deliveryDTO);

		sqlsession.commit();
		

	}
}
