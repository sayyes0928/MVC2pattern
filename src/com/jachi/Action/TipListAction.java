package com.jachi.Action;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jachi.DTO.ActionForward;
import com.jachi.DTO.PageInfo;
import com.jachi.DTO.TipDTO;
import com.jachi.svc.TipListService;

public class TipListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		List<TipDTO> tiparticle = new ArrayList<TipDTO>();
		int page = 1;
		int limit = 12;
		
		if(request.getParameter("page") != null) {
			page= Integer.parseInt(request.getParameter("page"));
		}
		
		TipListService tiplistservice = new TipListService();
		int listCount = tiplistservice.getListcount();
		tiparticle = tiplistservice.getArticleList(page, limit);
		int MaxPage = (int)((double)listCount/limit+0.95); 
		int StartPage = (((int)((double)page / 10 + 0.9)) -1 ) *10 +1;
		int EndPage = StartPage+10-1;
		if(EndPage > MaxPage) {
			EndPage = MaxPage;
		}
		
		PageInfo pageinfo = new PageInfo();
		pageinfo.setEndPage(EndPage);
		pageinfo.setListCount(listCount);
		pageinfo.setMaxPage(MaxPage);
		pageinfo.setPage(page);
		pageinfo.setStartPage(StartPage);
		
		request.setAttribute("pageinfo",pageinfo);
		request.setAttribute("tiparticle", tiparticle);
		
		ActionForward foward = new ActionForward();
		foward.setPath("/TipPage.jsp");
		
		return foward;
	}

}
