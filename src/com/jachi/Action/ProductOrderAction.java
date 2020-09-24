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
		 	

		////////////////////////////////////////////////////////

		  ProductPreOrderService productPreOrderService = new ProductPreOrderService();
		  List<UserinfoDTO> userinfoDTO= new ArrayList<UserinfoDTO>();
		  userinfoDTO = productPreOrderService.getOrderinfo(us_id);
		  
		  request.setAttribute("userinfoDTO", userinfoDTO);


		  
		  forward.setPath("/ProductOrderPage.jsp");
		  
		return forward;

	}

}