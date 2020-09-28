package com.jachi.Action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jachi.DTO.ActionForward;
import com.jachi.DTO.ProductinfoDTO;
import com.jachi.svc.PLIndexService;
import com.jachi.svc.PLSelectService;

public class PLIndexAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<ProductinfoDTO> article = new ArrayList<ProductinfoDTO>();
		PLIndexService plindexService = new PLIndexService();
		article = plindexService.getproindexinfo();
		
		ActionForward forward = new ActionForward();
		request.setAttribute("article", article);
		
		forward.setPath("/Product_index.jsp");
		return forward;
	}

}
