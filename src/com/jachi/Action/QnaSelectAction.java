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
		//��ϵ� Q&A ����Ʈ���� ����� ��ü ����
		
		QnaSelectService qnaSelectService = new QnaSelectService();
		qnalist = qnaSelectService.getqnainfo();
		//����Ŭ�������� �޾ƿ°��� qnalist�� ����ش�
		
		ActionForward forward = new ActionForward();
		//������ �̵��� ó���ϱ� ���� ActionForward Ŭ������ ��ü ����
		
		request.setAttribute("qnaList", qnalist);
		//qnalist�� ������ "qnaList" ��� �̸����� ���ǿ� ����
		
		forward.setPath("qnaList.bo");
		//����¡�� ���� �̵�
		
		return forward;
		
	}

}
