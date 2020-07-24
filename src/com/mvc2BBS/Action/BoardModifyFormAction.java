package com.mvc2BBS.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.mvc2BBS.svc.BoardDetailService;
import com.mvc2BBS.Vo.ActionForward;
import com.mvc2BBS.Vo.BoardBean;

public class BoardModifyFormAction implements Action {
	
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 
		 	ActionForward forward = new ActionForward();
			int board_num=Integer.parseInt(request.getParameter("board_num"));
			BoardDetailService boardDetailService = new BoardDetailService();	
		   	BoardBean article =boardDetailService.getArticle(board_num);
		   	request.setAttribute("article", article);
	   		forward.setPath("/qna_board_modify.jsp");
	   		return forward;
	   		
	 }
	 
}