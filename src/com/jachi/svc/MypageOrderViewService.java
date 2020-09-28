package com.jachi.svc;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.OrderDTO;
import com.jachi.DTO.OrderListDTO;

public class MypageOrderViewService {
	public List<Integer> getDeliveryCount(String userID) {

		SqlSessionFactory sqlfactory = BoardDAO.getConn();
		SqlSession sqlsession = sqlfactory.openSession();
		List<Integer> deliveryCount = sqlsession.selectList("select_orderview_count", userID);

		sqlsession.close();

		return deliveryCount;

	}

	public List<OrderListDTO> getOrderList_status(String us_id, String status) {

		OrderListDTO orderListDTO = new OrderListDTO();
		orderListDTO.setOdr_id(us_id);
		orderListDTO.setList_delStatus(status);

		SqlSessionFactory sqlfactory = BoardDAO.getConn();
		SqlSession sqlsession = sqlfactory.openSession();
		List<OrderListDTO> OrderList_status = sqlsession.selectList("orderList_status", orderListDTO);
		sqlsession.close();
		return OrderList_status;

	}

	public int getOrderCodeTail(String us_id) {

		SqlSessionFactory sqlfactory = BoardDAO.getConn();
		SqlSession sqlsession = sqlfactory.openSession();
		int orderCodeTail = sqlsession.selectOne("select_orderCodeTail", us_id);

		sqlsession.close();

		return orderCodeTail;

	}

	public List<OrderDTO> getOrderListReceipt(String odr_code) {


		SqlSessionFactory sqlfactory = BoardDAO.getConn();
		SqlSession sqlsession = sqlfactory.openSession();
		List<OrderDTO> orderList_Receipt = sqlsession.selectList("orderList_Receipt", odr_code);
		sqlsession.close();
		return orderList_Receipt;

	}

}
