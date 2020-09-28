package com.jachi.Action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jachi.DTO.ActionForward;
import com.jachi.DTO.OrderDTO;
import com.jachi.DTO.OrderListDTO;
import com.jachi.DTO.ProductinfoDTO;
import com.jachi.svc.MypageOrderViewService;
import com.jachi.svc.ProductPostViewService;

public class MypageOrderReceiptViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward = new ActionForward();

		HttpSession session = request.getSession(false);

		String odr_code = request.getParameter("delivery_code");
		List<OrderDTO> orderList_Receipt = new ArrayList<OrderDTO>();
		List<ProductinfoDTO> productInfo = new ArrayList<ProductinfoDTO>();

		MypageOrderViewService mypageOrderViewService = new MypageOrderViewService();

		orderList_Receipt = mypageOrderViewService.getOrderListReceipt(odr_code);

		ProductPostViewService productPostViewService = new ProductPostViewService();
		String pro_code = orderList_Receipt.get(0).getOdr_procode();

		productInfo = productPostViewService.getArticle(pro_code);

		request.setAttribute("productInfo", productInfo);
		request.setAttribute("orderList_Receipt", orderList_Receipt);
		forward.setPath("/MypageOrderListDetail.jsp");

		return forward;
	}

}
