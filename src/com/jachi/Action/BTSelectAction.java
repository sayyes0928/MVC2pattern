package com.jachi.Action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jachi.DTO.ActionForward;
import com.jachi.DTO.BeautyRoomDTO;
import com.jachi.svc.BTSelectService;

public class BTSelectAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("�׼� ������");
		List<BeautyRoomDTO> beautyList = new ArrayList<BeautyRoomDTO>();
		BTSelectService btSelectService = new BTSelectService();
		beautyList = btSelectService.getbeautyinfo();
		
		ActionForward forward = new ActionForward();
		request.setAttribute("beautyList", beautyList);
		System.out.println("�׼����� ���� �߿�");
		forward.setPath("btList.bo");
		
		return forward;
	}

}
