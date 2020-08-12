package com.jachi.Action;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jachi.DTO.ActionForward;
import com.jachi.svc.BookMarkCheckService;

public class BookMarkUpdate implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession(false);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();	
		
		request.setCharacterEncoding("utf-8");
		// no�� id���� map�� ����
		Map<String, Object> m = new HashMap<>();
		int post_no = Integer.parseInt(request.getParameter("no"));
		m.put("no", post_no);
		m.put("id", request.getParameter("id"));

		BookMarkCheckService bookMarkCheckService = new BookMarkCheckService();
		int result = bookMarkCheckService.likeCheck(m);
		if(result == 0){ // ��õ���� �ʾҴٸ� ��õ �߰�
			bookMarkCheckService.recUpdate(m);
			String book = "book";
			out.println(book);
			out.close();
		}else{ // ��õ�� �Ͽ��ٸ� ��õ ����
			bookMarkCheckService.recDelete(m);
			String heart = "book";
			out.println(heart);
			out.close();
		}
		
		return null;

	}
   
}
