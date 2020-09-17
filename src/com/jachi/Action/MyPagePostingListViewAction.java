package com.jachi.Action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jachi.DTO.ActionForward;
import com.jachi.DTO.QnABBS;
import com.jachi.DTO.TipDTO;
import com.jachi.svc.BTSelectService;

public class MyPagePostingListViewAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession(false);
		String or_id = (String) session.getAttribute("us_id");
		
		List<QnABBS> qnaList = new ArrayList<QnABBS>();
		List<TipDTO> tipList = new ArrayList<TipDTO>();

		BTSelectService btSelectService = new BTSelectService();
		qnaList = btSelectService.getQnaListAll(or_id);
		tipList = btSelectService.getTipListAll(or_id);
		
		ActionForward forward = new ActionForward();
	   	request.setAttribute("qnaList", qnaList);
	   	request.setAttribute("tipList", tipList);
   		forward.setPath("/MypageProfileView.jsp");
   		
   		return forward;
	}
   
}
