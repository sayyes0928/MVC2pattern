package com.jachi.Action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jachi.DTO.ActionForward;
import com.jachi.DTO.QnABBS;
import com.jachi.DTO.QnA_Comment;
import com.jachi.svc.QnaDetailService;

public class QnaDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int qnanum = Integer.parseInt(request.getParameter("getnum"));
		QnaDetailService qds = new QnaDetailService();
		List<QnABBS> postall = new ArrayList<QnABBS>();
		
		
		postall = qds.getqnalistall(qnanum);
		
		ActionForward forward = new ActionForward();
		
		request.setAttribute("listall", postall);
		forward.setPath("qna_commentselectList.bo");
		
		return forward;
	}

}
