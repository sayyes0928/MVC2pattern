package com.jachi.Action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jachi.DTO.ActionForward;
import com.jachi.DTO.UserinfoDTO;
import com.jachi.svc.JoinInsertUserInfoService;

public class JoinInsertUserInfoAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{

		
		  String us_id = request.getParameter("id");
		  String us_pw = request.getParameter("pw");
		  String us_name = request.getParameter("name");
		  String us_nkname = request.getParameter("nick");
		  String Year = request.getParameter("year");
		  String Month = request.getParameter("month");
		  String Day = request.getParameter("day");
		  String us_birth = Year + "-" + Month + "-" + Day;
		  if(Year == null) {
			  us_birth=null;
		  }
		  String Phone1 = request.getParameter("phon1");
		  String Phone2 = request.getParameter("phon2");
		  String Phone3 = request.getParameter("phon3");
		  String us_tel = Phone1 + "-" + Phone2 + "-" + Phone3;
		  String us_telagr = request.getParameter("sms_agree");
		  String Email1 = request.getParameter("email1");
		  String Email2 = request.getParameter("email2");
		  String us_mail = request.getParameter("us_mail");
		  if(us_mail == null) {
		  us_mail = Email1 + "@" + Email2;
		  }
		  String us_mailagr = request.getParameter("email_agree");
		  String Postcode = request.getParameter("postcode");
		  String Addr1 = request.getParameter("addr1");
		  String Addr2 = request.getParameter("addr2");
		  String Addr3 = request.getParameter("addr3");
		  String us_adr = Postcode + "/"  + Addr1 + "/" + Addr2 + "/" + Addr3;
		  
		  UserinfoDTO userinfoDTO = new UserinfoDTO();
		  
		  userinfoDTO.setUs_id(us_id);
		  userinfoDTO.setUs_pw(us_pw);
		  userinfoDTO.setUs_name(us_name);
		  userinfoDTO.setUs_nkname(us_nkname);
		  userinfoDTO.setUs_birth(us_birth);
		  userinfoDTO.setUs_tel(us_tel);
		  userinfoDTO.setUs_telagr(us_telagr);
		  userinfoDTO.setUs_mail(us_mail);
		  userinfoDTO.setUs_mailagr(us_mailagr);
		  userinfoDTO.setUs_adr(us_adr);
		
		
		
		////////////////////////////////////////////////////////
		ActionForward forward=null;

		JoinInsertUserInfoService joinInsertUserInfoService = new JoinInsertUserInfoService();
		boolean isWriteSuccess = joinInsertUserInfoService.registArticle(userinfoDTO);
		System.out.println(isWriteSuccess);
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
			forward.setRedirect(true);
			forward.setPath("Index.jsp");
		}

		return forward;

	}

}