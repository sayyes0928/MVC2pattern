package com.jachi.Action;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jachi.DTO.ActionForward;
import com.jachi.DTO.ProductinfoDTO;
import com.jachi.svc.CateSearchService;

public class CateSearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String cate1 = request.getParameter("cate");
		System.out.println("카테액션들어옴?");

		System.out.println(cate1);
		List<ProductinfoDTO> prod = new ArrayList<ProductinfoDTO>();
		CateSearchService cts = new CateSearchService();
		prod = cts.getcatesearch(cate1);

		ActionForward forward = new ActionForward();
		
		request.setAttribute("article", prod);
		forward.setPath("ProductList.jsp");
		
		return forward;
	}

}
