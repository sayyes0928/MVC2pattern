package com.jachi.Action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jachi.DTO.ActionForward;
import com.jachi.DTO.TipDTO;
import com.jachi.svc.TipDetailService;
import com.jachi.svc.TipSelectService;

public class TipDetailAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String num = request.getParameter("tip_num");
		int tip_num = Integer.parseInt(num);
		
		List<TipDTO> tipdto = new ArrayList<TipDTO>();
		
		TipDetailService tipselectservice = new TipDetailService();
		tipdto = tipselectservice.getTipinfo(tip_num);
		
		System.out.println(tipdto.get(0).getTip_coverimg());
		ActionForward forward = new ActionForward();
		request.setAttribute("tipdetail", tipdto);
   		forward.setPath("TipDetail.jsp");
   		
		return forward;
	}

}
