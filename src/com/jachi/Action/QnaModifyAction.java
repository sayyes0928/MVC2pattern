package com.jachi.Action;

import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jachi.DTO.ActionForward;
import com.jachi.DTO.QnABBS;
import com.jachi.svc.QnaModifyService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class QnaModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String name = "";
		// String subject="";
		String pro_mainimg = "";
		String pro_subimg = "";
		String pro_subimg2 = "";
		String pro_subimg3 = "";
		String pro_mainimg_name = "";
		String pro_subimg_name = "";
		String pro_subimg_name2 = "";
		String pro_subimg_name3 = "";
		String orig_pro_mainimg_name = "";
		String orig_pro_subimg_name = "";
		String orig_pro_subimg_name2 = "";
		String orig_pro_subimg_name3 = "";
		
		HttpSession session = request.getSession(false);
		String us_id = (String) session.getAttribute("US_ID");
		ActionForward forward = null;
		QnABBS qnam = null;
		String realFolder = "";
		String saveFolder = "/upload";
		int fileSize = 5*1024*1024;
		ServletContext context =request.getServletContext();
		realFolder = context.getRealPath(saveFolder);
		MultipartRequest multi = new MultipartRequest(request, realFolder, fileSize, "UTF-8",
				new DefaultFileRenamePolicy());
		String qna_num2 = multi.getParameter("qna_num");
		int qna_num = Integer.parseInt(qna_num2);
		
		qnam = new QnABBS();
		qnam.setQna_nickname(us_id);
		qnam.setQna_num(qna_num);
		
		qnam.setQna_title(multi.getParameter("qna_title"));
		qnam.setQna_post(multi.getParameter("qna_post"));
		Enumeration files = multi.getFileNames();
		
		pro_mainimg_name = (String) files.nextElement();
		pro_mainimg = multi.getFilesystemName(pro_mainimg_name);
		orig_pro_mainimg_name = multi.getOriginalFileName(pro_mainimg_name);
		
		qnam.setQna_pw(pro_mainimg);
		qnam.setQna_img(multi.getParameter("qna_img"));
		
		QnaModifyService qnams = new QnaModifyService();
		boolean isup = qnams.plzup(qnam);
		
		if(!isup) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('등록실패')");
			out.println("history.back();");
			out.println("</script>");
		}else {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("qna.bo");
		}
		
		return forward;
	}

}
