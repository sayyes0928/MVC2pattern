package com.jachi.Action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jachi.DTO.ActionForward;
import com.jachi.DTO.BeautyRoomDTO;
import com.jachi.svc.BTModifyService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BTModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		int fileSize = 5*1024*1024;
		String realFolder = "";
		String saveFolder = "/upload";
		ServletContext context =request.getServletContext();
		realFolder = context.getRealPath(saveFolder);
		MultipartRequest multi = new MultipartRequest(request, realFolder, fileSize, "UTF-8",
				new DefaultFileRenamePolicy());
		
		String bt_num2 = multi.getParameter("post_num");
		int post_num = Integer.parseInt(bt_num2);
		
		BeautyRoomDTO btm = new BeautyRoomDTO();
		btm.setPost_num(post_num);
		btm.setPost_title(multi.getParameter("post_title"));
		btm.setPost_posting(multi.getParameter("post_posting"));
		
		BTModifyService bts = new BTModifyService();
		boolean modiok = bts.btmo(btm);
		
		if(!modiok) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('수정실패')");
			out.println("history.back();");
			out.println("</script>");
		}else {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("Beautyroom_Detail.bo?board_num="+post_num);
		}
		
		return forward;
	}

}
