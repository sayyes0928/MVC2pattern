package com.jachi.Action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jachi.DTO.ActionForward;
import com.jachi.DTO.DeliveryDTO;
import com.jachi.DTO.OrderDTO;
import com.jachi.DTO.OrderListDTO;
import com.jachi.DTO.ProductinfoDTO;
import com.jachi.svc.MypageOrderViewService;

public class MypageOrderListViewAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession(false);
		String status=request.getParameter("status");
		String us_id=(String) session.getAttribute("us_id");
		List<OrderListDTO> orderList = new ArrayList<OrderListDTO>();
		System.out.println(status);
		switch (status) {
		case "1": status = "입금대기";
			
			break;
		case "2": status = "결제완료";
		
		break;
		case "3": status = "배송준비";
		
		break;
		case "4": status = "배송중";
		
		break;
		case "5": status = "배송완료";
		
		break;
		case "6": status = "구매확정";
		
		break;

		default:
			break;
		}
		System.out.println(status);
		

		MypageOrderViewService OrderViewService = new MypageOrderViewService();
		System.out.println(us_id);
		orderList = OrderViewService.getOrderList_status(us_id,status);
		
		for (int i = 0; i < orderList.size(); i++) {
			System.out.println(orderList.get(i).getList_name());
			System.out.println(i);
			
		}
		
		
		ActionForward forward = new ActionForward();
      

	   	request.setAttribute("orderList", orderList);
   		forward.setPath("/MypageOrderView.bo");
   		return forward;
	}
   
}
