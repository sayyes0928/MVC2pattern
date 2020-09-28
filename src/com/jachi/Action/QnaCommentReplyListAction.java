package com.jachi.Action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jachi.DTO.ActionForward;
import com.jachi.DTO.Qna_comment_reply;
import com.jachi.svc.QnaCommentReplyListService;

public class QnaCommentReplyListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int qnanum = Integer.parseInt(request.getParameter("getnum"));
		int qnaconum = Integer.parseInt(request.getParameter("getconum"));
		System.out.println(qnanum);
		System.out.println(qnaconum);
		List<Qna_comment_reply> qnacmreply = new ArrayList<Qna_comment_reply>();
		QnaCommentReplyListService qcrls = new QnaCommentReplyListService();
		
		qnacmreply = qcrls.getreply(qnanum,qnaconum);
		
		ActionForward forward = new ActionForward();
		request.setAttribute("replylist", qnacmreply);
		forward.setPath("/qna_detail.bo");
		return forward;
	}

}
