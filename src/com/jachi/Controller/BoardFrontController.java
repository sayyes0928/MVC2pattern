package com.jachi.Controller;



import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jachi.Action.Action;
import com.jachi.Action.BTDetailDeleteAction;
import com.jachi.Action.BTListAction;
import com.jachi.Action.BTSelectAction;
import com.jachi.Action.BTWriteAction;
import com.jachi.Action.BoardDeleteProAction;
import com.jachi.Action.BoardDetailAction;
import com.jachi.Action.BoardListAction;
import com.jachi.Action.BoardModifyFormAction;
import com.jachi.Action.BoardModifyProAction;
import com.jachi.Action.BoardReplyFormAction;
import com.jachi.Action.BoardReplyProAction;
import com.jachi.Action.BookMarkUpdate;
import com.jachi.Action.CateSearchAction;
import com.jachi.Action.JachiMainAction;
import com.jachi.Action.JoinIdcheckUserinfoAction;
import com.jachi.Action.JoinInsertUserInfoAction;
import com.jachi.Action.JoinNickNamecheckUserinfoAction;
import com.jachi.Action.LikeUpdateAction;
import com.jachi.Action.LoginUserAction;
import com.jachi.Action.MyPagePostingListViewAction;
import com.jachi.Action.MyhomeDetailAction;
import com.jachi.Action.MyhomeDetailComentAction;
import com.jachi.Action.MyhomeWriteProAction;
import com.jachi.Action.MypageLikeViewAction;
import com.jachi.Action.MypageOrderListViewAction;
import com.jachi.Action.MypageOrderReceiptViewAction;
import com.jachi.Action.MypageOrderViewAction;
import com.jachi.Action.MypagePhotoViewAction;
import com.jachi.Action.MypageProfileUserinfoUpdateAction;
import com.jachi.Action.MypageScrapViewAction;
import com.jachi.Action.MypageUserInfoUpdateAction;
import com.jachi.Action.PLSelectAction;
import com.jachi.Action.ProductOrderAction;
import com.jachi.Action.ProductOrderInsertAction;
import com.jachi.Action.ProductPostViewAction;
import com.jachi.Action.QnaCommentAction;
import com.jachi.Action.QnaCommentListAction;
import com.jachi.Action.QnaCommentWriteAction;
import com.jachi.Action.QnaDeleteAction;
import com.jachi.Action.QnaDetailAction;
import com.jachi.Action.QnaListAction;
import com.jachi.Action.QnaModifyAction;
import com.jachi.Action.QnaSearchAction;
import com.jachi.Action.QnaSearchListAction;
import com.jachi.Action.QnaSelectAction;
import com.jachi.Action.QnaWriteAction;
import com.jachi.Action.TipDeleteAction;
import com.jachi.Action.TipDetailAction;
import com.jachi.Action.TipListAction;
import com.jachi.Action.TipReplyDeleteAction;
import com.jachi.Action.TipReplyWriteAction;
import com.jachi.Action.TipSelectAction;
import com.jachi.Action.TipwriteAction;
import com.jachi.Action.TokenGetAccessAction;
import com.jachi.Action.UserLogin;
import com.jachi.Api.CallbackNaver;
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
		}else if(command.equals("/Index.bo")){
			forward=new ActionForward();
			forward.setPath("/Index.jsp");
		}
		else if(command.equals("/Myhome_WriteForm.bo")){
			forward=new ActionForward();
			forward.setPath("/Myhome_board_write.jsp");
		}
		else if(command.equals("/LoginFormpage.bo")){
			try {
				forward=new ActionForward();
				forward.setPath("/loginFormPage.jsp");
			} catch (Exception e) {
				System.out.println(" 로그인오류");
			}
			
		}
		else if(command.equals("/mypage_userinfo_update.bo")){
			action  = new MypageUserInfoUpdateAction();
			try { 
				forward =action.execute(request, response );
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/join.bo")){
			forward=new ActionForward();
			forward.setPath("/join.jsp");
		}
		else if(command.equals("/join_Insert.bo")){
			action  = new JoinInsertUserInfoAction();
			try { 
				forward =action.execute(request, response );
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/mypage_profile_userinfo_update.bo")){
			action  = new MypageProfileUserinfoUpdateAction();
			try { 
				forward =action.execute(request, response );
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/NickName_check.bo")){
			action  = new JoinNickNamecheckUserinfoAction();
			try {
				ActionForward forward3 =action.execute(request, response );
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/ID_check.bo")){
			action  = new JoinIdcheckUserinfoAction();
			try {
				ActionForward forward2 =action.execute(request, response );
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/callbackNaver.bo")){
			action  = new CallbackNaver();
			try {
				forward=action.execute(request, response );
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/TokenGetAccessAction.bo")){
			action  = new TokenGetAccessAction();
			try {
				forward=action.execute(request, response );
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	    else if(command.equals("/Myhome_WritePro.bo")){
				action  = new MyhomeWriteProAction();
				try {
					forward=action.execute(request, response );
				} catch (Exception e) {
					e.printStackTrace();
			}
		}else if(command.equals("/MypageOrderListView.bo")){
			action  = new MypageOrderListViewAction();
			try {
				forward=action.execute(request, response );
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/MypageOrderListDetailView.bo")){
			action  = new MypageOrderReceiptViewAction();
			try {
				forward=action.execute(request, response );
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/MypageProfile.bo")){
			action  = new MyPagePostingListViewAction();
			try {
				forward=action.execute(request, response );
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/MypageScrapView.bo")){
			action  = new MypageScrapViewAction();
			try {
				forward=action.execute(request, response );
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/MypagePhotoView.bo")){
			action  = new MypagePhotoViewAction();
			try {
				forward=action.execute(request, response );
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/MypageLikeView.bo")){
			action  = new MypageLikeViewAction();
			try {
				forward=action.execute(request, response );
			} catch (Exception e) {
				e.printStackTrace();
			}
		}		
		else if(command.equals("/MypageOrderView.bo")){
			action  = new MypageOrderViewAction();
			try {
				forward=action.execute(request, response );
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/LikeUpdate.bo")){
			action  = new LikeUpdateAction();
			try {
				forward=action.execute(request, response );
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/BookMarkUpdate.bo")){
			action  = new BookMarkUpdate();
			try {
				forward=action.execute(request, response );
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/loginAction.bo")){
			action  = new LoginUserAction();
			try {
				forward=action.execute(request, response );
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("로그인 오류");
			}
		}
		else if(command.equals("/ProductOrderPage.bo")){
			action  = new ProductOrderAction();
			try {
				forward=action.execute(request, response );
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println(e);
			}
		}
		else if(command.equals("/ProductOrderComplite.bo")){
			action  = new ProductOrderInsertAction();
			try {
				forward=action.execute(request, response );
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println(e);
			}
		}
		else if(command.equals("/CartList.bo")){
			forward=new ActionForward();
			forward.setPath("/MyCart_List_view.jsp");
		}
		else if(command.equals("/Product_add_Write.bo")){
			forward=new ActionForward();
			forward.setPath("/fileUpload.jsp");
		}
		else if(command.equals("/Beautyroom_write.bo")){
			forward=new ActionForward();
			forward.setPath("/Beautyroom_write.jsp");
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
        else if(command.equals("/Beautyroom_Detail.bo")){

			action = new MyhomeDetailAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
        else if(command.equals("/myPage_reply_insert.bo")){

			action = new MyhomeDetailComentAction();
			try{
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
		
		else if(command.equals("/beauty.bo")) {
			action = new BTSelectAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		else if(command.equals("/beauty_write.bo")) {
			action = new BTWriteAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		else if(command.equals("/btList.bo")) {
			action = new BTListAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		else if(command.equals("/qnaList.bo")) {
			action = new QnaListAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		
		else if(command.equals("/tipwrite.bo")) {			 
			action = new TipwriteAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	
		else if(command.equals("/tipselect.bo")) {			 
			action = new TipSelectAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		else if(command.equals("/qna.bo")) {			 
			action = new QnaSelectAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		else if(command.equals("/qna_search.bo")) {			 
			action = new QnaSearchAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		else if(command.equals("/qna_searchList.bo")) {			 
			action = new QnaSearchListAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		else if(command.equals("/tiplist.bo")) {		
			action = new TipListAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		

		else if(command.equals("/tip_detail.bo")) {			 
			action = new TipDetailAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		else if(command.equals("/tip_reply_write.bo")) {	
			action = new TipReplyWriteAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}

		else if(command.equals("/qna_write.bo")) {			 
			action = new QnaWriteAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		else if(command.equals("/qna_delete.bo")) {
			action = new QnaDeleteAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		else if(command.equals("/qna_modify.bo")) {
			action = new QnaModifyAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		else if(command.equals("/cate_search.bo")) {
			System.out.println("카테체크");
			action = new CateSearchAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
			System.out.println(e);
			}
		}
		
		else if(command.equals("/qna_detail.bo")) {
			System.out.println("카테체크");
			action = new QnaDetailAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
			System.out.println(e);
			}
		}
	
		else if(command.equals("/qna_commentselect.bo")) {
			System.out.println("커맨트체크");
			action = new QnaCommentAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
			System.out.println(e);
			}
		}
		
		else if(command.equals("/qna_commentselectList.bo")) {
			System.out.println("커맨트체크");
			action = new QnaCommentListAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
			System.out.println(e);
			}
		}
		
		else if(command.equals("/qna_commentwrite.bo")) {
			System.out.println("커맨트체크");
			action = new QnaCommentWriteAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
			System.out.println(e);
			}
		}
		
		else if(command.equals("/Jachi_main.bo")) {
			action = new JachiMainAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		else if(command.equals("/Tip_reply_delete.bo")) {
			action = new TipReplyDeleteAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		else if(command.equals("/TipDelete.bo")) {
			action = new TipDeleteAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		else if(command.equals("/bt_detail_delete.bo")) {
			action = new BTDetailDeleteAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		
		
	
		
		if(forward != null){
			
			if(forward.isRedirect()){
				response.sendRedirect(forward.getPath());
			}else{
				RequestDispatcher dispatcher=
						request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
				return;
			}
			
		}
		else {
			return;
		}
		
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request,response);
		return;
	}  	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request,response);
		return;
	}   
	
}