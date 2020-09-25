package com.jachi.Action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jachi.DTO.ActionForward;
import com.jachi.DTO.BeautyRoomDTO;
import com.jachi.DTO.PageInfo;
import com.jachi.DTO.ProductinfoDTO;
import com.jachi.svc.JachiMainService;

public class JachiMainAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		List<BeautyRoomDTO> articleList = new ArrayList<BeautyRoomDTO>();
		
		JachiMainService jms = new JachiMainService();
		int listCount = jms.mainbestbtListCount();
		articleList = jms.getmainbestbtall();
		
		List<ProductinfoDTO> productList = new ArrayList<ProductinfoDTO>();
		int pllistCount = jms.getbestplListCount();
		productList = jms.getbestplListall();
		
		PageInfo pageInfo = new PageInfo();
		pageInfo.setListCount(listCount);
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("beautyList", articleList);
		request.setAttribute("article", productList);
		ActionForward forward = new ActionForward();
		forward.setPath("/Jachi_main.jsp");
		
		return forward;
	}

}
