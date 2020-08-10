package com.jachi.Action;

import java.io.PrintWriter;
import java.io.*;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jachi.DTO.ActionForward;
import com.jachi.DTO.BeautyRoomDTO;
import com.jachi.DTO.BoardBean;
import com.jachi.svc.BTWriteService;
import com.jachi.svc.BoardWriteProService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BTWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(false);
		String us_id = (String) session.getAttribute("US_ID");
		ActionForward forward=null;
		BeautyRoomDTO btr = null;
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
		
		btr = new BeautyRoomDTO();
		btr.setPost_nkname(us_id);
		btr.setPost_title(multi.getParameter("post_title"));
		btr.setPost_posting(multi.getParameter("post_posting"));
		btr.setPost_tag(multi.getParameter("tagtest2"));
		btr.setPost_pic(
		multi.getOriginalFileName((String)multi.getFileNames().nextElement()));
		
		BTWriteService btws = new BTWriteService();
		boolean isWriteSuccess = btws.registArticle(btr);
		
		System.out.println(btr.getPost_nkname());
		System.out.println(btr.getPost_posting());
		System.out.println(btr.getPost_title());
		System.out.println(btr.getPost_tag());

		
		if(!isWriteSuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('등록실패')");
			out.println("history.back();");
			out.println("</script>");
		}else {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("btList.bo");
		}
		
		return forward;
	}

}
