package com.jachi.Action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jachi.DTO.ActionForward;
import com.jachi.DTO.DeliveryDTO;
import com.jachi.DTO.OrderDTO;
import com.jachi.DTO.ProductinfoDTO;
import com.jachi.svc.MypageOrderViewService;

public class MypageOrderListViewAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = null;
		String status=request.getParameter("status");
		String us_id=(String) session.getAttribute("us_id");
		List<Object> orderList = new ArrayList<Object>();
		switch (status) {
		case "1": status = "배송준비";
			
			break;

		default:
			break;
		}

		System.out.println("배송준비");
		MypageOrderViewService OrderViewService = new MypageOrderViewService();
		orderList = OrderViewService.getOrderList_status(us_id,status);
		
		
		ActionForward forward = new ActionForward();
      

	   	request.setAttribute("orderList", orderList);
   		forward.setPath("/MypageOrderView.jsp");
   		return forward;
	}
   
}
