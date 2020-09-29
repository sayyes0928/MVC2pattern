package com.jachi.Action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jachi.DTO.ActionForward;
import com.jachi.svc.TipDeleteService;

public class TipDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int tip_num = Integer.parseInt(request.getParameter("tip_num"));
		
	    TipDeleteService tip_del_service = new TipDeleteService();
	    boolean RemoveSuccesss = tip_del_service.removeTip(tip_num);
	    
	    ActionForward forward = null;
	    
	    if(RemoveSuccesss == true) {
	    	
	    	tip_del_service.removeComment(tip_num); // �ش� �Խ��� ��۵� ����
				
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/tiplist.bo");
				    	
	    }else {
	    	response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('tip�Խ��� ��������');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
	    }
	    
		return forward;
	}

}
