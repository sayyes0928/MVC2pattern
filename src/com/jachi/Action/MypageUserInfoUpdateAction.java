package com.jachi.Action;

import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jachi.DTO.ActionForward;
import com.jachi.DTO.UserinfoDTO;
import com.jachi.svc.JoinInsertUserInfoService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class MypageUserInfoUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{

		  HttpSession session = request.getSession(false);
		  String us_id = (String)session.getAttribute("us_id");
		  
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
		  
		  
		  String us_nkname = multi.getParameter("us_nkname");
		  String us_birth = multi.getParameter("us_birth"); 
		  String us_tel = multi.getParameter("us_tel");

		  String Email1 = multi.getParameter("email1");
		  String Email2 = multi.getParameter("email2");
		  
		  String us_mail = multi.getParameter("us_mail");
		  if(us_mail == null) {
		  us_mail = Email1 + "@" + Email2;
		  }
		  
		  
		  UserinfoDTO userinfoDTO = new UserinfoDTO();
		  
		  userinfoDTO.setUs_id(us_id);
		  userinfoDTO.setUs_nkname(us_nkname);
		  userinfoDTO.setUs_birth(us_birth);
		  userinfoDTO.setUs_tel(us_tel);
		  userinfoDTO.setUs_mail(us_mail);
		
			  
		  
		   try {
			       Enumeration files = multi.getFileNames();
			       
			        us_main_name = (String) files.nextElement();
					us_pic = multi.getFilesystemName("profile_img");
					us_OriginalName = multi.getOriginalFileName(us_main_name);

				    userinfoDTO.setUs_pic(us_pic);

				} catch (Exception e) {
					
				}
		////////////////////////////////////////////////////////
		ActionForward forward=null;
        
		System.out.println(userinfoDTO.getUs_adr());
		System.out.println(userinfoDTO.getUs_pic());
		JoinInsertUserInfoService joinInsertUserInfoService = new JoinInsertUserInfoService();
		boolean isWriteSuccess = joinInsertUserInfoService.updateUserinfo(userinfoDTO);
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
			forward.setPath("mypage_profile_userinfo_update.bols_");
		}

		return forward;

	}

}