package com.jachi.Action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jachi.DTO.ActionForward;
import com.jachi.DTO.QnA_Comment;
import com.jachi.svc.QnaCommentWriteService;

public class QnaCommentWriteAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession(false);		
		String us_id = (String)session.getAttribute("us_id");
		int getnum = Integer.parseInt(request.getParameter("getnum"));
		
		QnA_Comment qcw = new QnA_Comment();
		qcw.setQc_nickname(us_id);
		qcw.setQc_content(request.getParameter("comment_post"));
		qcw.setQcb_num(getnum);
		
		QnaCommentWriteService qcws = new QnaCommentWriteService();
		boolean isWriteSuccess = qcws.insertreply(qcw);
		ActionForward forward = null;
		if(!isWriteSuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('등록실패)");
			out.println("history.back();");
			out.println("</script>");
		}else {
			forward = new ActionForward();
			forward.setPath("qna_detail.bo");
		}
		
		
		return forward;
	}

}
