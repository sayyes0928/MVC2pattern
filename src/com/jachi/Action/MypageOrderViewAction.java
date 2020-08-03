package com.jachi.Action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jachi.DTO.ActionForward;
import com.jachi.DTO.DeliveryDTO;
import com.jachi.svc.MypageOrderViewService;

public class MypageOrderViewAction implements Action{


	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward = new ActionForward();
		
		HttpSession session = request.getSession(false);
		if(request.getAttribute("orderList")!=null) {
			ArrayList<Object> orderList_status = (ArrayList<Object>) request.getAttribute("orderList");
			request.setAttribute("orderList_status", orderList_status);
		
		}

		String userID=(String) session.getAttribute("us_id");

		List<Integer> articleCount = new ArrayList<Integer>(6);

		MypageOrderViewService PostViewService = new MypageOrderViewService();
		
		articleCount = PostViewService.getDeliveryCount(userID);
		
		

		
	   	request.setAttribute("articleCount", articleCount);
   		forward.setPath("/MypageOrderView.jsp");
   		
		
		return forward;
	}
   
}
