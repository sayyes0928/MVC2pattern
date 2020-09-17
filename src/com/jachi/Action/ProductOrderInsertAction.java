package com.jachi.Action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jachi.DTO.ActionForward;
import com.jachi.DTO.DeliveryDTO;
import com.jachi.DTO.OrderDTO;
import com.jachi.svc.MypageOrderViewService;
import com.jachi.svc.ProductOrderInsertService;

public class ProductOrderInsertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward = new ActionForward();

		HttpSession session = request.getSession(false);

		/**
		 * ProductOrderPage 에서 submit 으로 가져온 정보들(유저 입력)
		 * 
		 **/
		OrderDTO orderDTO = new OrderDTO();
		String or_id = (String) session.getAttribute("us_id");
		String or_name = (String) request.getParameter("order[payer_name]");
		String or_adr1 = (String) request.getParameter("order[received_zip_code]");
		String or_adr2 = (String) request.getParameter("order[received_at]");
		String or_adr3 = (String) request.getParameter("order[received_at_detail]");
		String or_adr = or_adr1 + "/" + or_adr2 + "/" + or_adr3;
		String or_memo = (String) request.getParameter("delivery_message");
		String or_mail = (String) request.getParameter("order[payer_email]");
		String or_tel = (String) request.getParameter("order[payer_phone_number]");

		orderDTO.setOdr_id(or_id);
		orderDTO.setOdr_name(or_name);
		orderDTO.setOdr_adr(or_adr);
		orderDTO.setOdr_mail(or_mail);
		orderDTO.setOdr_tel(or_tel);
		orderDTO.setOdr_memo(or_memo);

		
		/**
		 * 주문코드 생성을
		 * 문자 난수 + 주문일자 + 주문일자의 해당 유저의 주문갯수 count(*) 조합
		 * */
		
		MypageOrderViewService mypageOrderViewService = new MypageOrderViewService();
		int orderCodeTail = mypageOrderViewService.getOrderCodeTail(or_id);
		Character orderCodeHeader1 = (char)((int)(Math.random()*26)+97);
		Character orderCodeHeader2= (char)((int)(Math.random()*26)+97);
		Character orderCodeHeader3= (char)((int)(Math.random()*26)+97);
		
		String orderCodeHeader = orderCodeHeader1.toString() + orderCodeHeader2.toString() + orderCodeHeader3.toString();

		DeliveryDTO deliveryDTO = new DeliveryDTO();
		
		Date today = new Date();
		SimpleDateFormat date = new SimpleDateFormat("yyyyMMdd");
		String orderCodeBody = (String)date.format(today);
		
		deliveryDTO.setUs_id(or_id);
		deliveryDTO.setDlv_status("배송준비");
		

		/**
		 * DB insert 
		 * 
		 * **/
		List<String[]> cart = (ArrayList<String[]>) session.getAttribute("cart");
		ProductOrderInsertService productOrderInsertService = new ProductOrderInsertService();
		int or_count;
		int or_price;
		int totalPrice;
		for (int i = 0; i < cart.size(); i++) {

			or_count = Integer.parseInt(cart.get(i)[1].toString());
			or_price = Integer.parseInt(cart.get(i)[2].toString());
			totalPrice = or_count * or_price;
			orderDTO.setOdr_proname(cart.get(i)[0]);
			orderDTO.setOdr_count(or_count);
			orderDTO.setOdr_price(totalPrice);
			orderDTO.setOdr_procode(cart.get(i)[3]);

			
			String odr_code = orderCodeHeader + orderCodeBody + orderCodeTail;
			System.out.println(odr_code);
			orderDTO.setOdr_code(odr_code);
			
			
			deliveryDTO.setDlv_code(odr_code);
			
			productOrderInsertService.Ordercomplite(orderDTO);
			productOrderInsertService.OrderDelivery(deliveryDTO);
			orderCodeTail++;

		}
		////////////////////////////////////////////////////////
		session.removeAttribute("cart");
		forward.setPath("/Index.jsp");

		return forward;

	}

}