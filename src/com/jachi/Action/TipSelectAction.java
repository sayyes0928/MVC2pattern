package com.jachi.Action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jachi.DTO.ActionForward;
import com.jachi.DTO.TipDTO;
import com.jachi.svc.TipSelectService;


public class TipSelectAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		List<TipDTO> tiplist = new ArrayList<TipDTO>();
		TipSelectService tipselectservice = new TipSelectService();
		tiplist = tipselectservice.getTipinfo();
		
		System.out.println(tiplist.get(0).getTip_post()); 
		ActionForward forward = new ActionForward();
		request.setAttribute("tiplist", tiplist);
   		forward.setPath("/TipPage.jsp");
   		
		return forward;
	}

}
