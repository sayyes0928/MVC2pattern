package com.jachi.Action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jachi.DTO.ActionForward;
import com.jachi.DTO.BeautyRoomDTO;
import com.jachi.DTO.QnABBS;
import com.jachi.DTO.TipDTO;
import com.jachi.DTO.UserinfoDTO;
import com.jachi.svc.BTSelectService;
import com.jachi.svc.MypageProfileUserInfoService;

public class MyPagePostingListViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession(false);
		String or_id = (String) session.getAttribute("us_id");

		List<QnABBS> qnaList = new ArrayList<QnABBS>(); // 본인이 작성한 질문 출력
		List<TipDTO> tipList = new ArrayList<TipDTO>(); // 본인이 작성한 팁 출력
		List<BeautyRoomDTO> postList = new ArrayList<BeautyRoomDTO>(); // 본인이 작성한 사진 게시물 출력
		
		
		
		
		BTSelectService btSelectService = new BTSelectService();
		qnaList = btSelectService.getQnaListAll(or_id);
		tipList = btSelectService.getTipListAll(or_id);
		postList = btSelectService.getPostList(or_id);
		
		int countLike = btSelectService.getCountLike(or_id);
		int ountScrap = btSelectService.getCountScrap(or_id);
		List<UserinfoDTO> userinfoDTO = new ArrayList<UserinfoDTO>();

		MypageProfileUserInfoService mypageProfileUserInfoService = new MypageProfileUserInfoService();

		userinfoDTO = mypageProfileUserInfoService.getUserInfo_list(or_id);

		ActionForward forward = new ActionForward();
		request.setAttribute("countLike", countLike);
		request.setAttribute("ountScrap", ountScrap);
		request.setAttribute("qnaList", qnaList);
		request.setAttribute("tipList", tipList);
		request.setAttribute("postList", postList);
		request.setAttribute("userinfoDTO", userinfoDTO);

		forward.setPath("/MypageProfileView.jsp");

		return forward;
	}

}
