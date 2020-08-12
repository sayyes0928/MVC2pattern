package com.jachi.Action;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jachi.DTO.ActionForward;
import com.jachi.svc.LikePostinCheckService;

public class LikeUpdateAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();	
		
		request.setCharacterEncoding("utf-8");
		// no와 id값을 map에 저장
		Map<String, Object> m = new HashMap<>();
		int post_no = Integer.parseInt(request.getParameter("no"));
		m.put("no", post_no);
		m.put("id", request.getParameter("id"));

		LikePostinCheckService likePostinCheckService = new LikePostinCheckService();
		int result = likePostinCheckService.likeCheck(m);
		System.out.println("클릭1"+result);
		if(result == 0){ // 추천하지 않았다면 추천 추가
			likePostinCheckService.recUpdate(m);
			String heart = "heart";
			out.println(heart);
			out.close();
		}else{ // 추천을 하였다면 추천 삭제
			likePostinCheckService.recDelete(m);
			String heart = "heart";
			out.println(heart);
			out.close();
		}
		
		return null;

	}
   
}
