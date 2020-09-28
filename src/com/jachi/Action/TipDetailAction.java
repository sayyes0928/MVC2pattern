package com.jachi.Action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jachi.DTO.ActionForward;
import com.jachi.DTO.PageInfo;
import com.jachi.DTO.TipDTO;
import com.jachi.DTO.TipReplyDTO;
import com.jachi.svc.TipDetailService;
import com.jachi.svc.TipSelectService;

public class TipDetailAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String num = request.getParameter("tip_num");
		int tip_num = Integer.parseInt(num);
		
		List<TipDTO> tipdto = new ArrayList<TipDTO>();
		
		TipDetailService tipselectservice = new TipDetailService();
		tipdto = tipselectservice.getTipinfo(tip_num);
		
		//´ñ±Û ¸ñ·Ï
		List<TipReplyDTO> commentlist = new ArrayList<TipReplyDTO>();
		int page = 1;
		int limit = 5;
		
		if(request.getParameter("commentpage") != null) {
			page = Integer.parseInt(request.getParameter("commentpage"));
		}
		
		TipDetailService commentservice = new TipDetailService();
		int rep_tip_num = tip_num;
		int listCount = commentservice.getListcount(rep_tip_num);
		
		commentlist = commentservice.getArticleList(page, limit, rep_tip_num);
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
		
		System.out.println(commentlist.get(0).getRep_us_id());
		ActionForward forward = new ActionForward();
		request.setAttribute("tipdetail", tipdto);
		request.setAttribute("comment_pageinfo", pageinfo);
		request.setAttribute("commentlist", commentlist);
   		forward.setPath("/TipDetail.jsp");
   		
		return forward;
	}

}
