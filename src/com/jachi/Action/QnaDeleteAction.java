package com.jachi.Action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jachi.DTO.ActionForward;
import com.jachi.DTO.QnABBS;
import com.jachi.svc.QnaDeleteService;

public class QnaDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int qna_num = Integer.parseInt(request.getParameter("qna_num"));
		
		QnaDeleteService qnaDeleteService = new QnaDeleteService();
		List<QnABBS> article = qnaDeleteService.isArticleWriter(qna_num);
		ActionForward forward = new ActionForward();
		request.setAttribute("article", article);
		forward.setPath("/qna.bo");
		return forward;
	}

}
