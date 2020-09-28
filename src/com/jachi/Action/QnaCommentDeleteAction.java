package com.jachi.Action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jachi.DTO.ActionForward;
import com.jachi.DTO.QnABBS;
import com.jachi.DTO.QnA_Comment;
import com.jachi.svc.QnaCommentDeleteService;

public class QnaCommentDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int qna_num = Integer.parseInt(request.getParameter("renum"));
		int getnum = Integer.parseInt(request.getParameter("postnum"));
		
		QnaCommentDeleteService qcd = new QnaCommentDeleteService();
		List<QnA_Comment> article = qcd.isArticleWriter(qna_num);
		ActionForward forward = new ActionForward();
		request.setAttribute("article", article);
		forward.setPath("/qna_detail.bo?getnum="+getnum);
		return forward;
	}

}
