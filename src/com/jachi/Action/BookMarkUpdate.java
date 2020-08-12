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
		// no와 id값을 map에 저장
		Map<String, Object> m = new HashMap<>();
		int post_no = Integer.parseInt(request.getParameter("no"));
		m.put("no", post_no);
		m.put("id", request.getParameter("id"));

		BookMarkCheckService bookMarkCheckService = new BookMarkCheckService();
		int result = bookMarkCheckService.likeCheck(m);
		if(result == 0){ // 추천하지 않았다면 추천 추가
			bookMarkCheckService.recUpdate(m);
			String book = "book";
			out.println(book);
			out.close();
		}else{ // 추천을 하였다면 추천 삭제
			bookMarkCheckService.recDelete(m);
			String heart = "book";
			out.println(heart);
			out.close();
		}
		
		return null;

	}
   
}
