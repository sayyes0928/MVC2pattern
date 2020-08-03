package com.jachi.Action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jachi.DTO.ActionForward;
import com.jachi.svc.BoardLoginService;


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
		out.println("<html><body><script>");
		out.println("alert('���̵� �Ǵ� ��й�ȣ�� Ʋ�Ƚ��ϴ�.');");
		out.println("history.back();");
		out.println("</script></body></html>");
		
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