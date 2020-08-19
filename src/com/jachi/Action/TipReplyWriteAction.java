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
		
		ActionForward forward = null;
		String rep_post = request.getParameter("tip_reply_post");
		System.out.println(rep_post);
		
		TipReplyDTO repdto = new TipReplyDTO();
		repdto.setRep_post(rep_post);
	     
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
			forward.setPath("/tiplist.bo");
		}

		return forward;
		
	}

}
