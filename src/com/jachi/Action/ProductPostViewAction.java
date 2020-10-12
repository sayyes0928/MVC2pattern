package com.jachi.Action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jachi.DTO.ActionForward;
import com.jachi.DTO.BoardBean;
import com.jachi.DTO.PageInfo;
import com.jachi.DTO.ProductinfoDTO;
import com.jachi.svc.ProductPostViewService;

public class ProductPostViewAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String pro_num=request.getParameter("pro_num");
		
		List<ProductinfoDTO> article = new ArrayList<ProductinfoDTO>();

		ProductPostViewService PostViewService = new ProductPostViewService();
		article = PostViewService.getArticle(pro_num);
		
		ActionForward forward = new ActionForward();
	   	request.setAttribute("article", article);
   		forward.setPath("/ProductPost.jsp");
   		return forward;
	}
   
}
