package com.jachi.Action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jachi.DTO.ActionForward;
import com.jachi.svc.UserLoginService;

public class UserLogin implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Boolean userlogininfo=false;
		ActionForward forward = new ActionForward();
		
		String us_id = request.getParameter("us_id");
		String us_pw = request.getParameter("us_pw");
		
		System.out.println(us_id);
		System.out.println(us_pw);
		
		UserLoginService userLoginService = new UserLoginService();
		userlogininfo = userLoginService.logingo(us_id,us_pw);
		
		System.out.println(userlogininfo);
		
		if(!userlogininfo) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('아이디 또는 비밀번호가 틀렸습니다.');");
			out.println("history.back();");
			out.println("</script>");
		}else {
			HttpSession session = request.getSession(false);
			session.setAttribute("US_ID", us_id);
			forward = new ActionForward();	
			forward.setRedirect(true);
	   		forward.setPath("storeList.bo");
		}
		return forward;
	}

}
