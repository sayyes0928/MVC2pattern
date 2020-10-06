package com.jachi.svc;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.OrderDTO;
import com.jachi.DTO.OrderListDTO;

public class MypageOrderViewService {
	SqlSession sqlsession = BoardDAO.getInstance();

	public List<Integer> getDeliveryCount(String userID) {

		List<Integer> deliveryCount = sqlsession.selectList("select_orderview_count", userID);

		

		return deliveryCount;

	}

	public List<OrderListDTO> getOrderList_status(String us_id, String status) {

		OrderListDTO orderListDTO = new OrderListDTO();
		orderListDTO.setOdr_id(us_id);
		orderListDTO.setList_delStatus(status);

		List<OrderListDTO> OrderList_status = sqlsession.selectList("orderList_status", orderListDTO);
		
		return OrderList_status;

	}

	public int getOrderCodeTail(String us_id) {

		int orderCodeTail = sqlsession.selectOne("select_orderCodeTail", us_id);

		

		return orderCodeTail;

	}

	public List<OrderDTO> getOrderListReceipt(String odr_code) {


		List<OrderDTO> orderList_Receipt = sqlsession.selectList("orderList_Receipt", odr_code);
		
		return orderList_Receipt;

	}

}
