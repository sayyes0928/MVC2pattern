package com.jachi.Controller;



import java.io.IOException;  

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jachi.Action.Action;
import com.jachi.Action.BoardDeleteProAction;
import com.jachi.Action.BoardDetailAction;
import com.jachi.Action.BoardListAction;
import com.jachi.Action.BoardLoginAction;
import com.jachi.Action.BoardModifyFormAction;
import com.jachi.Action.BoardModifyProAction;
import com.jachi.Action.BoardReplyFormAction;
import com.jachi.Action.BoardReplyProAction;
import com.jachi.Action.MyhomeWriteProAction;
import com.jachi.Action.MypageOrderViewAction;
import com.jachi.Action.PLSelectAction;

import com.jachi.Action.ProductPostViewAction;
import com.jachi.Action.UserLogin;
import com.jachi.DTO.ActionForward;


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
		}else if(command.equals("MypageOrderListView.bo")){
			System.out.println("체크1");
			action  = new MypageOrderViewAction();
			try {
				forward=action.execute(request, response );
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/MypageOrderList.bo")){
			action  = new MypageOrderViewAction();
			try {
				forward=action.execute(request, response );
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/Product_add_Write.bo")){
			forward=new ActionForward();
			forward.setPath("/fileUpload.jsp");
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
		}else if(command.equals("/korea.bo")){
			action = new ProductPostViewAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		else if(command.equals("/storeList.bo")) {
			action = new PLSelectAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		else if(command.equals("/login.bo")) {
			action = new UserLogin();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
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