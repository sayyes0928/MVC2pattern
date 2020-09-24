package com.jachi.Action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jachi.DTO.ActionForward;
import com.jachi.DTO.QnA_Comment;
import com.jachi.svc.QnaCommentService;

public class QnaCommentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int qnanum = Integer.parseInt(request.getParameter("getnum"));
		System.out.println(qnanum+"번호번호");
		
		List<QnA_Comment> comment_list = new ArrayList<QnA_Comment>();
		QnaCommentService qcs = new QnaCommentService();
		
		comment_list = qcs.cm_list(qnanum);
		System.out.println("여기까진오니?");
		//System.out.println(comment_list.get(0).getQcb_num());
		
		ActionForward forward = new ActionForward();
		if(comment_list.size()==0) {
			forward.setRedirect(true);
			forward.setPath("YuchanQnaDetail.jsp");
		}else {
		
		request.setAttribute("comment_list", comment_list);
		forward.setPath("qna_commentselectList.bo");
		
		}
		
		return forward;
	}

}
