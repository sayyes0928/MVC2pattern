package com.jachi.Action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jachi.DTO.ActionForward;
import com.jachi.DTO.BeautyRoomDTO;
import com.jachi.svc.BTDetailDeleteService;

public class BTDetailDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int bt_num = Integer.parseInt(request.getParameter("dt_num"));
		
		BTDetailDeleteService bds = new BTDetailDeleteService();
		List<BeautyRoomDTO> btpost = bds.deletebtpost(bt_num);
		
		ActionForward forward = new ActionForward();
		request.setAttribute("delbt", btpost);
		forward.setPath("/beauty.bo");
		return forward;
	}

}
