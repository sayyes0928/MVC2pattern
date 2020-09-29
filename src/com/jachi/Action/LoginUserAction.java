package com.jachi.Action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jachi.DTO.ActionForward;
import com.jachi.svc.LoginUserService;

public class LoginUserAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession(false);

		String us_id = request.getParameter("us_id");
		String us_pw = request.getParameter("us_pw");
		String backPage = request.getParameter("backPage");
		ActionForward forward = new ActionForward();
		String getUserpw = null;
		String getUsernkname = null;

		
		LoginUserService loginUserService = new LoginUserService();
		getUserpw = loginUserService.loginUser(us_id);
		getUsernkname = loginUserService.loginnkname(us_id);

		System.out.println(getUserpw+"로그인ID");
		System.out.println(getUsernkname+"로그인PW");
		
		if (getUserpw == null || !getUserpw.equals(us_pw)) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<html><body><script>");
			out.println("alert('아이디 또는 비밀번호가 틀렸습니다.');");
			out.println("history.go(-1)");
			out.println("</script></body></html>");
			out.flush();


		} else if (getUserpw.equals(us_pw)) {
			
			System.out.println(backPage);
			session.setAttribute("us_id", us_id);
			session.setAttribute("nkname", getUsernkname);
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<html><body><script>");
			out.println("location.href='" + backPage + "'");
			out.println("</script></body></html>");
			out.flush();

		} 

		return null;
	}

}
