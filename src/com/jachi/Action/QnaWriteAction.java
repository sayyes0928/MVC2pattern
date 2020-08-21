package com.jachi.Action;

import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jachi.DTO.ActionForward;
import com.jachi.DTO.BeautyRoomDTO;
import com.jachi.DTO.QnABBS;
import com.jachi.svc.QnaWriteService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class QnaWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String pro_mainimg = "";
		String pro_mainimg_name = "";
		String orig_pro_mainimg_name = "";
		
		HttpSession session = request.getSession(false);
		String us_id = (String) session.getAttribute("us_id");
		ActionForward forward = null;
		QnABBS qna = null;
		String realFolder = "";
		String saveFolder = "/upload";
		int fileSize = 5 * 1024 * 1024;
		ServletContext context = request.getServletContext();
		realFolder = context.getRealPath(saveFolder);

		MultipartRequest multi = new MultipartRequest(request, realFolder, fileSize, "UTF-8",
				new DefaultFileRenamePolicy());
		
		qna = new QnABBS();
		qna.setQna_nickname(us_id);
		qna.setQna_title(multi.getParameter("post_title"));
		qna.setQna_post(multi.getParameter("post_posting"));
		
		
		try {
			Enumeration files = multi.getFileNames();

			pro_mainimg_name = (String) files.nextElement();
			pro_mainimg = multi.getFilesystemName(pro_mainimg_name);
			orig_pro_mainimg_name = multi.getOriginalFileName(pro_mainimg_name);

			qna.setQna_pw(pro_mainimg);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		QnaWriteService qnas = new QnaWriteService();
		boolean isWriteSuccess = qnas.registArticle(qna);
		
		if(!isWriteSuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('등록실패)");
			out.println("history.back();");
			out.println("</script>");
		}else {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("qnaList.bo");
		}
		
		
		return forward;
	}

}
