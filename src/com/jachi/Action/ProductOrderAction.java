package com.jachi.Action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jachi.DTO.ActionForward;
import com.jachi.DTO.OrderDTO;
import com.jachi.DTO.Product_cartDTO;
import com.jachi.DTO.UserinfoDTO;
import com.jachi.svc.ProductCartListViewService;
import com.jachi.svc.ProductPreOrderService;

public class ProductOrderAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{

		ActionForward forward= new ActionForward();

		HttpSession session = request.getSession(false);
		  String us_id = (String)session.getAttribute("us_id");
		 
		  String pro_code = request.getParameter("Pro_code");
		  String or_countString = request.getParameter("or_count");
		  String or_procode = request.getParameter("or_procode");

		  int or_count = Integer.parseInt(or_countString);

		  OrderDTO orderDTO = new OrderDTO();
		  
		  orderDTO.setOr_procode("a0001");
		  orderDTO.setOr_code("1");
		  orderDTO.setOr_count(or_count);
		  orderDTO.setOr_id(us_id);
		  ProductCartListViewService productCartListViewService = new ProductCartListViewService();
		  List<Product_cartDTO> productinfoDTO= new ArrayList<Product_cartDTO>();
		  productinfoDTO = productCartListViewService.getArticle(orderDTO);
		

		////////////////////////////////////////////////////////

		  ProductPreOrderService productPreOrderService = new ProductPreOrderService();
		  List<UserinfoDTO> userinfoDTO= new ArrayList<UserinfoDTO>();
		  userinfoDTO = productPreOrderService.getOrderinfo(us_id);
		  
	
		  request.setAttribute("orderDTO", orderDTO);
		  request.setAttribute("userinfoDTO", userinfoDTO);
		  request.setAttribute("productinfoDTO", productinfoDTO);

		  
		  forward.setPath("/ProductOrderPage.jsp");
		  
		return forward;

	}

}