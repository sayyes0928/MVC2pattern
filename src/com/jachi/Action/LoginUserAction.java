package com.jachi.Action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jachi.DTO.ActionForward;
import com.jachi.svc.LoginUserService;

public class LoginUserAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession(false);
		
		String us_id=request.getParameter("us_id");
		String us_pw=request.getParameter("us_pw");
		
		ActionForward forward = new ActionForward();
		forward =null;
		String getUserpw = null;

		 System.out.println("널체크2");
		
		LoginUserService loginUserService = new LoginUserService();
		getUserpw = loginUserService.loginUser(us_id);
		 System.out.println("널체크1"+getUserpw);
		
		 if(getUserpw == null){
			    response.setContentType("text/html;charset=UTF-8");
				PrintWriter out=response.getWriter();
				out.println("<html><body><script>");
				out.println("alert('아이디가 틀렸습니다.');");
				out.println("location.href='LoginFormpage.bo'");
				out.println("</script></body></html>");
				out.flush();
//				forward.setRedirect(true);
//			   	forward.setPath("LoginFormpage.bo");


			    
			  }else if(getUserpw.equals(us_pw)){
				String backPage = request.getParameter("backPage");
				session.setAttribute("us_id", us_id);
			   	
				  response.setContentType("text/html;charset=UTF-8");
					PrintWriter out=response.getWriter();
					out.println("<html><body><script>");
					out.println("location.href='"+backPage+"'");
					out.println("</script></body></html>");
					out.flush();
	
			  }else if(!getUserpw.equals(us_pw)){
	
				  response.setContentType("text/html;charset=UTF-8");
					PrintWriter out=response.getWriter();
					out.println("<html><body><script>");
					out.println("alert('비밀번호가 틀렸습니다.');");
					out.println("location.href='LoginFormpage.bo'");
					out.println("</script></body></html>");
					out.flush();
//					forward.setRedirect(true);
//				   	forward.setPath("LoginFormpage.bo");

			  }
	   	
   		return null;
	}
   
}
