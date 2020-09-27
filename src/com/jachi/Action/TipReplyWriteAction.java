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
		String us_id = request.getParameter("us_id");
		int tip_num = Integer.parseInt(request.getParameter("tip_num"));
	
		ActionForward forward = null;

		
		TipReplyDTO repdto = new TipReplyDTO();
		repdto.setRep_tip_num(tip_num);
		repdto.setRep_post(rep_post);
		repdto.setRep_nickname(us_id);
	    System.out.println("1");
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
