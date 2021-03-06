package com.jachi.Action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jachi.DTO.ActionForward;
import com.jachi.DTO.BeautyRoomDTO;
import com.jachi.DTO.Posting_replyDTO;
import com.jachi.svc.BookMarkCheckService;
import com.jachi.svc.LikePostinCheckService;

public class MypageLikeViewAction implements Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
		
		 
		HttpSession session = request.getSession(false);
		String us_id = (String)session.getAttribute("us_id");
	
		
		LikePostinCheckService likePostinCheckService = new LikePostinCheckService();
		List<BeautyRoomDTO> likeList = new ArrayList<BeautyRoomDTO>();
		likeList = likePostinCheckService.getLikeList(us_id);

		
		ActionForward forward = new ActionForward();
	   	request.setAttribute("likeList", likeList);
   		forward.setPath("/MypageLike.jsp");
   		return forward;

	 }

}