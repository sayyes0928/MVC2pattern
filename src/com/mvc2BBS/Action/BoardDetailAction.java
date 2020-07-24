package com.mvc2BBS.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.mvc2BBS.svc.BoardDetailService;
import com.mvc2BBS.Vo.ActionForward;
import com.mvc2BBS.Vo.BoardBean;

 public class BoardDetailAction implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
	   	
		int board_num=Integer.parseInt(request.getParameter("board_num"));
		String page = request.getParameter("page");
		BoardDetailService boardDetailService = new BoardDetailService();
		BoardBean article = boardDetailService.getArticle(board_num);
		ActionForward forward = new ActionForward();
		request.setAttribute("page", page);
	   	request.setAttribute("article", article);
   		forward.setPath("/qna_board_view.jsp");
   		return forward;

	 }
	 
}