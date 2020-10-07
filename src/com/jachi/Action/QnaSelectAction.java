package com.jachi.Action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jachi.DTO.ActionForward;
import com.jachi.DTO.QnABBS;
import com.jachi.svc.QnaSelectService;


public class QnaSelectAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		List<QnABBS> qnalist = new ArrayList<QnABBS>();
		//등록된 Q&A 리스트들을 담아줄 객체 생성
		
		QnaSelectService qnaSelectService = new QnaSelectService();
		qnalist = qnaSelectService.getqnainfo();
		//서비스클래스에서 받아온값을 qnalist에 담아준다
		
		ActionForward forward = new ActionForward();
		//페이지 이동을 처리하기 위한 ActionForward 클래스의 객체 생성
		
		request.setAttribute("qnaList", qnalist);
		//qnalist의 값들을 "qnaList" 라는 이름으로 세션에 저장
		
		forward.setPath("qnaList.bo");
		//페이징을 위해 이동
		
		return forward;
		
	}

}
