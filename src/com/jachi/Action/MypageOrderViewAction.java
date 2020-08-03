package com.jachi.Action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jachi.DTO.ActionForward;
import com.jachi.DTO.DeliveryDTO;
import com.jachi.svc.MypageOrderViewService;

public class MypageOrderViewAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String userID=request.getParameter("userID");
		System.out.println(userID+"sdfasdfasdf");
		List<Integer> articleCount = new ArrayList<Integer>(6);

		MypageOrderViewService PostViewService = new MypageOrderViewService();
		articleCount = PostViewService.getDeliveryCount(userID);
		
		ActionForward forward = new ActionForward();
		for (int i = 0; i < articleCount.size(); i++) {
			if(articleCount.get(i)!=null) {
			System.out.println(articleCount.get(i));
			}else if(articleCount.get(i)==null){
                  System.out.println("0");
			}
		}
      

	   	request.setAttribute("articleCount", articleCount);
   		forward.setPath("/MypageOrderView.jsp");
   		return forward;
	}
   
}
