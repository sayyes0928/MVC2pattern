package com.jachi.Action;

import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jachi.DTO.ActionForward;
import com.jachi.DTO.UserinfoDTO;
import com.jachi.svc.JoinInsertUserInfoService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class JoinInsertUserInfoAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{

		
		  String us_main_name = null;
		  String us_pic = null;
		  String us_OriginalName = null;
		  String realFolder="";
		  String saveFolder="/upload";
		  int fileSize=5*1024*1024;
		  ServletContext context = request.getServletContext();
		  realFolder=context.getRealPath(saveFolder);
		  MultipartRequest multi=new MultipartRequest(request,
					realFolder,
					fileSize,
					"UTF-8",
					new DefaultFileRenamePolicy());
		  String us_id = multi.getParameter("id");
		  String us_pw = multi.getParameter("pw");
		  String us_name = multi.getParameter("name");
		  String us_nkname = multi.getParameter("nick");
		  String Year = multi.getParameter("year");
		  String Month = multi.getParameter("month");
		  String Day = multi.getParameter("day");
		  String us_birth = Year + "-" + Month + "-" + Day;

		  if(Year == null) {
			  us_birth=null;
		  }
		  String Phone1 = multi.getParameter("phon1");
		  String Phone2 = multi.getParameter("phon2");
		  String Phone3 = multi.getParameter("phon3");
		  String us_tel = Phone1 + "-" + Phone2 + "-" + Phone3;
		  String us_telagr = multi.getParameter("sms_agree");
		  String Email1 = multi.getParameter("email1");
		  String Email2 = multi.getParameter("email2");
		  String us_mail = multi.getParameter("us_mail");
		  if(us_mail == null) {
		  us_mail = Email1 + "@" + Email2;
		  }
		  
		  String us_mailagr = multi.getParameter("email_agree");
		  String Postcode = multi.getParameter("postcode");
		  String Addr1 = multi.getParameter("addr1");
		  String Addr2 = multi.getParameter("addr2");
		  String Addr3 = multi.getParameter("addr3");
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
		
		
			  
		  
		   try {
			       Enumeration files = multi.getFileNames();
			       
			        us_main_name = (String) files.nextElement();
					us_pic = multi.getFilesystemName("profile_img");
					us_OriginalName = multi.getOriginalFileName(us_main_name);

				    userinfoDTO.setUs_pic(us_pic);

				} catch (Exception e) {
					// TODO: handle exception
				}
		////////////////////////////////////////////////////////
		ActionForward forward=null;
        
		System.out.println(userinfoDTO.getUs_adr());
		  System.out.println(userinfoDTO.getUs_pic());
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
			forward.setPath("Jachi_main.bo");
		}

		return forward;

	}

}