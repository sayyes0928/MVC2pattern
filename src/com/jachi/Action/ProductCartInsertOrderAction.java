package com.jachi.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jachi.DTO.ActionForward;
import com.jachi.DTO.Product_cartDTO;
import com.jachi.svc.ProductCartInsertService;

public class ProductCartInsertOrderAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{

		ActionForward forward= new ActionForward();

	     HttpSession session = request.getSession(false);
	      String cart_btn = request.getParameter("cart_btn");
	      String order_btn = request.getParameter("order_btn");
		  String us_id = (String)session.getAttribute("us_id");		 
		  String pro_code = request.getParameter("Pro_code");
		  String cart_count_string = request.getParameter("cart_count");
		  String cart_option = request.getParameter("cart_option");
		
		  int cart_count = Integer.parseInt(cart_count_string);

		  Product_cartDTO product_cartDTO = new Product_cartDTO();
		  product_cartDTO.setCart_procode(pro_code);
		  product_cartDTO.setCart_us_id(us_id);
		  product_cartDTO.setCart_count(cart_count);
		  product_cartDTO.setCart_option(cart_option);
		  

		////////////////////////////////////////////////////////

		  ProductCartInsertService productCartInsertService = new ProductCartInsertService();
		  productCartInsertService.registArticle(product_cartDTO);
		  
		  if(cart_btn != null) {
			  forward.setPath("/Mypage_Cart.bo");
		  }else {
			  forward.setPath("/ProductOrderPage.bo");
		  }
	  
		  
		  
		return forward;

	}

}