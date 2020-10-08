package com.jachi.Action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jachi.DTO.ActionForward;
import com.jachi.DTO.PageInfo;
import com.jachi.DTO.QnABBS;
import com.jachi.svc.QnaListService;

public class QnaListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		List<QnABBS> articleList = new ArrayList<QnABBS>();
		int page=1;
		int limit=8;
		//페이징을 위한 변수 -> 한 페이지에 8개까지의 게시물을 보여주기위해 limit을 설정
		
		if(request.getParameter("page")!=null) {
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		
		QnaListService qnaListService = new QnaListService();
		int listCount=qnaListService.getListCount();
		//현재 페이지의 리스트가 존재하는지 확인
		
		articleList = qnaListService.getArticleList(page, limit);
		//페이징 처리를 위해 지정한 limit 개수만큼만 select
		
		int maxPage=(int)((double)listCount/limit+0.95);
		int startPage = (((int)((double)page/10+0.9)) - 1)* 10 + 1;
		int endPage = startPage + 10 -1;
		//페이징 처리
		
		
		if(endPage>maxPage) endPage = maxPage; 
		//끝 페이징 처리
		
		PageInfo pageInfo = new PageInfo();
		pageInfo.setEndPage(endPage);
		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("qnaList", articleList);
		//페이지정보와 select한 리스트들을 세션에 저장
		
		ActionForward forward = new ActionForward();
		//페이지 이동을 처리해줄 ActionForward 객체 forward 생성
		
		forward.setPath("/Yuchan_Qna.jsp");
		//해당 페이지로 이동
				
		return forward;
	}

}
