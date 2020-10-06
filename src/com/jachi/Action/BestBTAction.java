package com.jachi.Action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jachi.DTO.ActionForward;
import com.jachi.DTO.BeautyRoomDTO;
import com.jachi.svc.BestBTService;

public class BestBTAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		List<BeautyRoomDTO> Bestbtlist = new ArrayList<BeautyRoomDTO>();
		
		BestBTService bbs = new BestBTService();
		Bestbtlist = bbs.getbestbt();
		request.setAttribute("beautyList", Bestbtlist);
		ActionForward forward = new ActionForward();
		forward.setPath("/Bestbt.jsp");
		
		return forward;
	}
	
}
