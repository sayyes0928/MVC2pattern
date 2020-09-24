package com.jachi.Action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jachi.DTO.ActionForward;
import com.jachi.DTO.TipReplyDTO;
import com.jachi.svc.TipReplyWriteService;

public class TipReplyWriteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String rep_post = request.getParameter("reply_post");
		int tip_num = Integer.parseInt(request.getParameter("tip_num"));
		String user_nickname = request.getParameter("user_nickname");
		String user_img = request.getParameter("user_img");
		
		System.out.println(rep_post+tip_num+user_nickname+user_img);
		ActionForward forward = null;

		
		TipReplyDTO repdto = new TipReplyDTO();
		repdto.setTip_num(tip_num);
		repdto.setRep_nickname(user_img);
		repdto.setRep_img(user_nickname);
		repdto.setRep_post(rep_post);
	    
		System.out.println(rep_post);
		TipReplyWriteService repwriteservice = new TipReplyWriteService();
		boolean isWriteSuccess = repwriteservice.registArticle(repdto);
		
		if(!isWriteSuccess){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('등록실패')");
			out.println("history.back();");
			out.println("</script>");
		}
		else{
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/tip_detail.bo?board_num=tip_num");
		}

		return forward;
		
	}

}
