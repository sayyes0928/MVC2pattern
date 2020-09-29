package com.jachi.Action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jachi.DTO.ActionForward;
import com.jachi.DTO.TipReplyDTO;
import com.jachi.svc.TipReplyDeleteService;

public class TipReplyDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int rep_tip_num = Integer.parseInt(request.getParameter("rep_tip_num"));
		int rep_num = Integer.parseInt(request.getParameter("rep_num"));
	
		TipReplyDTO rep_dto = new TipReplyDTO();
		rep_dto.setRep_num(rep_num);
		rep_dto.setRep_tip_num(rep_tip_num);
		
		TipReplyDeleteService rep_delete_service = new TipReplyDeleteService();
		boolean isDeleteSuccess = rep_delete_service.removeAticle(rep_dto);
		
		ActionForward forward = null;
		
		if(!isDeleteSuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('삭제실패');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			
		}else {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/tip_detail.bo?tip_num="+rep_tip_num);
		}
		
		return forward;
	}

}
