package com.jachi.Action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jachi.DTO.ActionForward;
import com.jachi.DTO.QnABBS;
import com.jachi.svc.QnaSelectService;


public class QnaSelectAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		List<QnABBS> qnalist = new ArrayList<QnABBS>();
		QnaSelectService qnaSelectService = new QnaSelectService();
		qnalist = qnaSelectService.getqnainfo();
		
		ActionForward forward = new ActionForward();
		request.setAttribute("qnaList", qnalist);
		
		forward.setPath("qnaList.bo");
		
		return forward;
		
	}

}
