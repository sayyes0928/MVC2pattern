package com.jachi.Action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jachi.DTO.ActionForward;
import com.jachi.DTO.PageInfo;
import com.jachi.DTO.QnABBS;
import com.jachi.svc.QnaListService;

public class QnaListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		List<QnABBS> articleList = new ArrayList<QnABBS>();
		int page=1;
		int limit=8;
		//����¡�� ���� ���� -> �� �������� 8�������� �Խù��� �����ֱ����� limit�� ����
		
		if(request.getParameter("page")!=null) {
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		
		QnaListService qnaListService = new QnaListService();
		int listCount=qnaListService.getListCount();
		//���� �������� ����Ʈ�� �����ϴ��� Ȯ��
		
		articleList = qnaListService.getArticleList(page, limit);
		//����¡ ó���� ���� ������ limit ������ŭ�� select
		
		int maxPage=(int)((double)listCount/limit+0.95);
		int startPage = (((int)((double)page/10+0.9)) - 1)* 10 + 1;
		int endPage = startPage + 10 -1;
		//����¡ ó��
		
		
		if(endPage>maxPage) endPage = maxPage; 
		//�� ����¡ ó��
		
		PageInfo pageInfo = new PageInfo();
		pageInfo.setEndPage(endPage);
		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("qnaList", articleList);
		//������������ select�� ����Ʈ���� ���ǿ� ����
		
		ActionForward forward = new ActionForward();
		//������ �̵��� ó������ ActionForward ��ü forward ����
		
		forward.setPath("/Yuchan_Qna.jsp");
		//�ش� �������� �̵�
				
		return forward;
	}

}
