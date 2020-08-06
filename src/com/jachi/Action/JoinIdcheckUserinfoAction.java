package com.jachi.Action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jachi.DTO.ActionForward;
import com.jachi.DTO.ProductinfoDTO;
import com.jachi.svc.JoinIdcheckUserinfoService;

public class JoinIdcheckUserinfoAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String us_id=request.getParameter("ID");
		System.out.println(us_id);
		
		String article = null;

		JoinIdcheckUserinfoService joinIdcheckUserinfoService = new JoinIdcheckUserinfoService();
		article = joinIdcheckUserinfoService.checkUserID(us_id);
		
		
		 if(article == null){
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out=response.getWriter();
			    out.print("사용 가능한 아이디입니다.");
			  }else{
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out=response.getWriter();
			    out.print("중복된 아이디가 있습니다.");
			  }

		 
		ActionForward forward = new ActionForward();
//	   	request.setAttribute("article", article);
//   		forward.setPath("/ProductPost.jsp");
   		return forward;
	}
   
}
