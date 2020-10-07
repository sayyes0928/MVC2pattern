package com.jachi.Action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jachi.DTO.ActionForward;
import com.jachi.DTO.NoticeDTO;
import com.jachi.svc.NoticeService;

public class NoticeAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		List<NoticeDTO> no_list = new ArrayList<NoticeDTO>();
		
		NoticeService ns = new NoticeService();
		no_list = ns.getnotice();
	
		ActionForward forward = new ActionForward();
		request.setAttribute("notice", no_list);
		
		forward.setPath("notice.jsp");
		
		return forward;
	}

}
