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
	//Action interface의 execute() 메소드를 오버라이딩 --> 메소드의 원형이 동일
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		List<QnABBS> qnalist = new ArrayList<QnABBS>();
		QnaSelectService qnaSelectService = new QnaSelectService();	
		qnalist = qnaSelectService.getqnainfo();

		ActionForward forward = new ActionForward();
		//페이지 이동을 처리하기 위한 ActionForward 클래스의 객체 생성
		
		request.setAttribute("qnaList", qnalist);
		//담아온 값들 세션에 저장
		
		forward.setPath("qnaList.bo");
		//페이징을 위해 이동
		
		return forward;
		
	}

}
