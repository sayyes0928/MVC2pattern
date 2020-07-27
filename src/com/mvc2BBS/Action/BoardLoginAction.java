package com.mvc2BBS.Action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mvc2BBS.Vo.ActionForward;
import com.mvc2BBS.svc.BoardLoginService;


 public class BoardLoginAction implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		Boolean articleList=false;
		ActionForward forward= new ActionForward();
		
		String userID = request.getParameter("userID");
		String userPW = request.getParameter("userPW");

		System.out.println(userID);
		System.out.println(userPW);
		
		
		BoardLoginService boardLoginService = new BoardLoginService();
		articleList = boardLoginService.getArticleList(userID,userPW);
		
		System.out.println(articleList);
		if(!articleList) {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		out.println("<script>");
		out.println("alert('아이디 또는 비밀번호가 틀렸습니다.');");
		out.println("history.back();");
		out.println("</script>");
		
		}else {
		HttpSession session = request.getSession(false);
		session.setAttribute("userID", userID);
		forward = new ActionForward();	
		forward.setRedirect(true);
   		forward.setPath("boardList.bo");
   		
		}
		return forward;
	 }
	 
 }