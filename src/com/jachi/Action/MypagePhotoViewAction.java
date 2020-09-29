package com.jachi.Action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jachi.DTO.ActionForward;
import com.jachi.DTO.BeautyRoomDTO;
import com.jachi.svc.BTSelectService;
import com.jachi.svc.BookMarkCheckService;

public class MypagePhotoViewAction implements Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
		
		 
		HttpSession session = request.getSession(false);
		String us_id = (String)session.getAttribute("us_id");
	
		
		List<BeautyRoomDTO> postList = new ArrayList<BeautyRoomDTO>(); // 본인이 작성한 사진 게시물 출력
		BTSelectService btSelectService = new BTSelectService();
		postList = btSelectService.getPostList(us_id);
		
		
		ActionForward forward = new ActionForward();
		request.setAttribute("postList", postList);
   		forward.setPath("/MypagePhotoAll.jsp");
   		return forward;

	 }

}