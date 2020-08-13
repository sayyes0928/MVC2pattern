package com.jachi.Action;

import java.io.PrintWriter;
import java.util.Enumeration;
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
		BeautyRoomDTO btr = null;
		String realFolder = "";
		String saveFolder = "/upload";
		int fileSize = 5 * 1024 * 1024;
		ServletContext context = request.getServletContext();
		realFolder = context.getRealPath(saveFolder);

		MultipartRequest multi = new MultipartRequest(request, realFolder, fileSize, "UTF-8",
				new DefaultFileRenamePolicy());

		btr = new BeautyRoomDTO();
		btr.setPost_nkname(us_id);
		btr.setPost_title(multi.getParameter("post_title"));
		btr.setPost_posting(multi.getParameter("post_posting"));
		btr.setPost_tag(multi.getParameter("tagtest2"));
		try {
			Enumeration files = multi.getFileNames();

			pro_mainimg_name = (String) files.nextElement();
			pro_mainimg = multi.getFilesystemName(pro_mainimg_name);
			orig_pro_mainimg_name = multi.getOriginalFileName(pro_mainimg_name);

			btr.setPost_pic(pro_mainimg);

			pro_subimg_name = (String) files.nextElement();
			pro_subimg = multi.getFilesystemName(pro_subimg_name);
			orig_pro_subimg_name = multi.getOriginalFileName(pro_subimg_name);
			btr.setPost_pic2(pro_subimg);

			pro_subimg_name2 = (String) files.nextElement();
			pro_subimg2 = multi.getFilesystemName(pro_subimg_name2);
			orig_pro_subimg_name2 = multi.getOriginalFileName(pro_subimg_name2);
			btr.setPost_pic3(pro_subimg2);

			pro_subimg_name3 = (String) files.nextElement();
			pro_subimg3 = multi.getFilesystemName(pro_subimg_name3);
			orig_pro_subimg_name3 = multi.getOriginalFileName(pro_subimg_name3);
			btr.setPost_pic4(pro_subimg3);

		} catch (Exception e) {
			// TODO: handle exception
		}

		BTWriteService btws = new BTWriteService();
		boolean isWriteSuccess = btws.registArticle(btr);

		System.out.println(btr.getPost_nkname());
		System.out.println(btr.getPost_posting());
		System.out.println(btr.getPost_title());
		System.out.println(btr.getPost_tag());
		System.out.println(btr.getPost_pic());
		System.out.println(btr.getPost_pic2());

		if (!isWriteSuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('등록실패')");
			out.println("history.back();");
			out.println("</script>");
		} else {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("btList.bo");
		}

		return forward;

	}

}
