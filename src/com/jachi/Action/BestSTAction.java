package com.jachi.Action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jachi.DTO.ActionForward;
import com.jachi.DTO.ProductinfoDTO;
import com.jachi.svc.BestSTService;

public class BestSTAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		List<ProductinfoDTO> Beststlist = new ArrayList<ProductinfoDTO>();
		
		BestSTService bss = new BestSTService();
		Beststlist = bss.getbestst();
		request.setAttribute("article", Beststlist);
		ActionForward forward = new ActionForward();
		forward.setPath("/Beststore.jsp");
		
		return forward;
	}

}
