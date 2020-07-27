package com.mvc2BBS.Controller;



import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc2BBS.Action.Action;
import com.mvc2BBS.Action.BoardDeleteProAction;
import com.mvc2BBS.Action.BoardDetailAction;
import com.mvc2BBS.Action.BoardListAction;
import com.mvc2BBS.Action.BoardLoginAction;
import com.mvc2BBS.Action.BoardModifyFormAction;
import com.mvc2BBS.Action.BoardModifyProAction;
import com.mvc2BBS.Action.BoardReplyFormAction;
import com.mvc2BBS.Action.BoardReplyProAction;
import com.mvc2BBS.Action.MyhomeWriteProAction;
import com.mvc2BBS.Vo.ActionForward;


@WebServlet("*.bo") //어노테이션


public class BoardFrontController extends javax.servlet.http.HttpServlet 
{
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String RequestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String command=RequestURI.substring(contextPath.length());
		ActionForward forward=null;
		Action action=null;

		if(command.equals("/boardWriteForm.bo")){
			forward=new ActionForward();
			forward.setPath("/qna_board_write.jsp");
		}else if(command.equals("/Myhome_WriteForm.bo")){
			forward=new ActionForward();
			forward.setPath("/Myhome_board_write.jsp");
		}
		else if(command.equals("/Myhome_WritePro.bo")){
			action  = new MyhomeWriteProAction();
			try {
				forward=action.execute(request, response );
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/boardList.bo")){
			System.out.println("체크2");	
			action = new BoardListAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
        else if(command.equals("/boardLoginPro.bo")){
			System.out.println("체크1");
			action = new BoardLoginAction();
			try{
				System.out.println("체크3");
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/boardDetail.bo")){
			action = new BoardDetailAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/qna_file_down.bo")){
			forward=new ActionForward();
			forward.setPath("/qna_file_down.jsp");
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/boardReplyForm.bo")){
			action = new BoardReplyFormAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/boardReplyPro.bo")){
			action = new BoardReplyProAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/boardModifyForm.bo")){
			action = new BoardModifyFormAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/boardModifyPro.bo")){
			action = new BoardModifyProAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/boardDeleteForm.bo")){
			String nowPage = request.getParameter("page");
			request.setAttribute("page", nowPage);
			int board_num=Integer.parseInt(request.getParameter("board_num"));
			request.setAttribute("board_num",board_num);
			forward=new ActionForward();
			forward.setPath("/qna_board_delete.jsp");
		}
		else if(command.equals("/boardDeletePro.bo")){
			action = new BoardDeleteProAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		if(forward != null){
			
			if(forward.isRedirect()){
				System.out.println(forward.getPath());
				response.sendRedirect(forward.getPath());
			}else{
				RequestDispatcher dispatcher=
						request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
			
		}
		
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request,response);
	}  	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request,response);
	}   
	
}