package com.jachi.Action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jachi.DTO.ActionForward;
import com.jachi.DTO.DeliveryDTO;
import com.jachi.DTO.UserinfoDTO;
import com.jachi.svc.MypageOrderViewService;
import com.jachi.svc.MypageProfileUserInfoService;
import com.jachi.svc.ProductOrderInsertService;

public class MypageProfileUserinfoUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward = new ActionForward();

		HttpSession session = request.getSession(false);

		/**
		 * ProductOrderPage 에서 submit 으로 가져온 정보들(유저 입력)
		 * 
		 **/
		String or_id = (String) session.getAttribute("us_id");
		
		List<UserinfoDTO> userinfoDTO = new ArrayList<UserinfoDTO>();
		
		MypageProfileUserInfoService mypageProfileUserInfoService = new MypageProfileUserInfoService();
		
		userinfoDTO = mypageProfileUserInfoService.getUserInfo_list(or_id);

		////////////////////////////////////////////////////////
		request.setAttribute("userinfoDTO", userinfoDTO);
		forward.setPath("/Mypage_infoUpdate.jsp");

		return forward;

	}

}