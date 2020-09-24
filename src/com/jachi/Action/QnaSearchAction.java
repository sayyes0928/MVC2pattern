package com.jachi.Action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jachi.DTO.ActionForward;
import com.jachi.DTO.BeautyRoomDTO;
import com.jachi.DTO.QnABBS;
import com.jachi.svc.QnaSearchService;

public class QnaSearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("액션왔냠");
		String search = request.getParameter("input");
		System.out.println(search +"액션쪽인풋");
		List<QnABBS> qna = new ArrayList<QnABBS>();
		QnaSearchService qnaservice = new QnaSearchService();
		qna = qnaservice.getsearchinfo(search);
		System.out.println("서비스갔다왔음");
		ActionForward forward = new ActionForward();
		
		request.setAttribute("qnaList", qna);
		forward.setPath("qna_searchList.bo");
		


		return forward;
	}

}
