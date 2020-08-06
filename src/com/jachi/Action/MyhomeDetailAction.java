package com.jachi.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jachi.DTO.ActionForward;
import com.jachi.DTO.BoardBean;
import com.jachi.svc.MyhomeDetailService;

 public class MyhomeDetailAction implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
	   	
		int board_num=Integer.parseInt(request.getParameter("board_num"));
		String page = request.getParameter("page");
		MyhomeDetailService myhomeDetailService = new MyhomeDetailService();
		BoardBean article = myhomeDetailService.getArticle(board_num);
		ActionForward forward = new ActionForward();
		request.setAttribute("page", page);
	   	request.setAttribute("article", article);
   		forward.setPath("/qna_board_view.jsp");
   		return forward;

	 }
	 
}