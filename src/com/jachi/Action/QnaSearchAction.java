package com.jachi.Action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jachi.DTO.ActionForward;
import com.jachi.DTO.BeautyRoomDTO;
import com.jachi.DTO.QnABBS;
import com.jachi.svc.QnaSearchService;

public class QnaSearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("�׼ǿԳ�");
		String search = request.getParameter("input");
		System.out.println(search +"�׼�����ǲ");
		List<QnABBS> qna = new ArrayList<QnABBS>();
		QnaSearchService qnaservice = new QnaSearchService();
		qna = qnaservice.getsearchinfo(search);
		System.out.println("���񽺰��ٿ���");
		ActionForward forward = new ActionForward();
		
		request.setAttribute("qnaList", qna);
		forward.setPath("qna_searchList.bo");
		


		return forward;
	}

}
