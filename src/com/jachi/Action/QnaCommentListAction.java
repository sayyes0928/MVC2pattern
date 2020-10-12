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
		//by 유찬, 해당 게시물에 대한 댓글을 컨트롤 하기위해 게시물 번호를 받아온다
		
		List<QnA_Comment> articleList = new ArrayList<QnA_Comment>();
		int page=1;
		int limit=5;
		if(request.getParameter("page")!=null) {
			page=Integer.parseInt(request.getParameter("page"));
		}//페이징
		
		QnaCommentListService qcls = new QnaCommentListService();
		int listCount = qcls.getListCount(qnanum); //리스트 갯수 카운트
		articleList = qcls.getArticleList(page,limit,qnanum); //댓글 셀렉트 & 페이징
		
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
		//세션에 저장
		ActionForward forward = new ActionForward();
		forward.setPath("/YuchanQnaDetail.jsp");
		//페이지 이동
		return forward;
	}

}
