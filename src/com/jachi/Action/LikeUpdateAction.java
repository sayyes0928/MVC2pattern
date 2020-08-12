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
		// no�� id���� map�� ����
		Map<String, Object> m = new HashMap<>();
		int post_no = Integer.parseInt(request.getParameter("no"));
		m.put("no", post_no);
		m.put("id", request.getParameter("id"));

		LikePostinCheckService likePostinCheckService = new LikePostinCheckService();
		int result = likePostinCheckService.likeCheck(m);
		System.out.println("Ŭ��1"+result);
		if(result == 0){ // ��õ���� �ʾҴٸ� ��õ �߰�
			likePostinCheckService.recUpdate(m);
			String heart = "heart";
			out.println(heart);
			out.close();
		}else{ // ��õ�� �Ͽ��ٸ� ��õ ����
			likePostinCheckService.recDelete(m);
			String heart = "heart";
			out.println(heart);
			out.close();
		}
		
		return null;

	}
   
}
