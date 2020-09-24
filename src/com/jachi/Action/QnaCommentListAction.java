package com.jachi.Action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jachi.DTO.ActionForward;
import com.jachi.DTO.PageInfo;
import com.jachi.DTO.QnA_Comment;
import com.jachi.svc.QnaCommentListService;

public class QnaCommentListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int qnanum = Integer.parseInt(request.getParameter("getnum"));
		System.out.println(qnanum+"큐앤애이넘버");
		List<QnA_Comment> articleList = new ArrayList<QnA_Comment>();
		int page=1;
		int limit=5;
		if(request.getParameter("page")!=null) {
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		QnaCommentListService qcls = new QnaCommentListService();
		int listCount = qcls.getListCount(qnanum);
		articleList = qcls.getArticleList(page,limit,qnanum);
		System.out.println("아티클리스트"+articleList);
		
		int maxPage=(int)((double)listCount/limit+0.95);
		int startPage = (((int)((double)page/10+0.9)) - 1)* 10 + 1;
		int endPage = startPage + 10 -1;
		
		if(endPage>maxPage) endPage = maxPage;
		
		
		PageInfo pageInfo = new PageInfo();
		pageInfo.setEndPage(endPage);
		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);
		request.setAttribute("pageInfo", pageInfo);	
		request.setAttribute("qnacommentlist", articleList);
		ActionForward forward = new ActionForward();
		forward.setPath("/YuchanQnaDetail.jsp");
		
		return forward;
	}

}
