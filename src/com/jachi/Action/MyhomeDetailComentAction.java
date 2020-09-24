package com.jachi.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jachi.DTO.ActionForward;
import com.jachi.DTO.Posting_replyDTO;
import com.jachi.svc.MyhomeDetailService;

public class MyhomeDetailComentAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession(false);
		response.setContentType("text/html;charset=utf-8");
		
		String us_id= (String)session.getAttribute("us_id");
		int posting_reply_post_num = Integer.parseInt((String)request.getParameter("post_num"));
		String posting_reply_text = (String)request.getParameter("post_coment");
		MyhomeDetailService myhomeDetailService = new MyhomeDetailService();
		Posting_replyDTO posting_replyDTO = new Posting_replyDTO();
		posting_replyDTO.setPosting_reply_us_id(us_id);
		posting_replyDTO.setPosting_reply_post_num(posting_reply_post_num);
		posting_replyDTO.setPosting_reply_text(posting_reply_text);
		int myhome_coment_insert = myhomeDetailService.setReply(posting_replyDTO);
		
		ActionForward forward = new ActionForward();
		request.setAttribute("board_num", posting_reply_post_num);
		forward.setPath("/Beautyroom_Detail.bo?board_num="+posting_reply_post_num);
		
		return forward;

	}
   
}
