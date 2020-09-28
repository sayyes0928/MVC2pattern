package com.jachi.Action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jachi.DTO.ActionForward;
import com.jachi.DTO.BeautyRoomDTO;
import com.jachi.DTO.PageInfo;
import com.jachi.svc.BTindexService;
import com.jachi.svc.JachiMainService;

public class BTIndexAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
List<BeautyRoomDTO> articleList = new ArrayList<BeautyRoomDTO>();
		
		BTindexService bis = new BTindexService();
		int listCount = bis.btindexListCount();
		articleList = bis.btindexall();
		PageInfo pageInfo = new PageInfo();
		pageInfo.setListCount(listCount);
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("beautyList", articleList);
		ActionForward forward = new ActionForward();
		forward.setPath("/Beautyroom_index.jsp");
		
		return forward;
	}

}
