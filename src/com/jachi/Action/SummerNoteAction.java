package com.jachi.Action;

import java.io.File;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

public class SummerNoteAction {
   

	public void profileUpload(String email, MultipartRequest file, HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		// 업로드할 폴더 경로
		String realFolder = request.getSession().getServletContext().getRealPath("Upload");
		UUID uuid = UUID.randomUUID();
	
		// 업로드할 파일 이름
		String org_filename = file.getOriginalFileName((String) file.getFileNames().nextElement());
		String str_filename = uuid.toString() + org_filename;

		System.out.println("원본 파일명 : " + org_filename);
		System.out.println("저장할 파일명 : " + str_filename);

		String filepath = realFolder + "\\" + email + "\\" + str_filename;
		System.out.println("파일경로 : " + filepath);

		File f = new File(filepath);
		if (!f.exists()) {
			f.mkdirs();
		}
		file.
		file.transferTo(f);
		out.println("profileUpload/"+email+"/"+str_filename);
		out.close();
	}


}
