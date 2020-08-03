package com.jachi.Action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jachi.DTO.ActionForward;
import com.jachi.DTO.ProductinfoDTO;
import com.jachi.svc.JoinIdcheckUserinfoService;
import com.jachi.svc.JoinNickNamecheckUserinfoService;

public class JoinNickNamecheckUserinfoAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String us_nkname=request.getParameter("NICK");

		
		String article = null;

		JoinNickNamecheckUserinfoService joinNickNamecheckUserinfoService = new JoinNickNamecheckUserinfoService();
		article = joinNickNamecheckUserinfoService.checkUserNickName(us_nkname);
		
		
		 if(article == null){
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out=response.getWriter();
			    out.print("사용 가능한 닉네임니다.");
			  }else{
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out=response.getWriter();
			    out.print("중복된 닉네임이 있습니다.");
			  }

		 
		ActionForward forward = new ActionForward();
   		return forward;
	}
   
}
