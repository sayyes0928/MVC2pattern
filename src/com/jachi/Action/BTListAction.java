package com.jachi.Action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jachi.DTO.ActionForward;
import com.jachi.DTO.BeautyRoomDTO;
import com.jachi.DTO.PageInfo;
import com.jachi.svc.BTListService;

public class BTListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		List<BeautyRoomDTO> articleList = new ArrayList<BeautyRoomDTO>();
		int page=1;
		int limit=12;
		
		if(request.getParameter("page")!=null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		
		BTListService btls = new BTListService();
		int listCount=btls.getListCount();
		articleList = btls.getArticleList(page, limit);
		
		//����������
		int maxPage=(int)((double)listCount/limit+0.95); // 0.95 ���ؼ� �ø�ó��
		//���� �������� ������ ���� ��������(1,11,21...)
		int startPage = (((int)((double)page/10+0.9)) - 1)* 10 + 1;
		//���� �������� ������ ������ ������ ��(10,20,30...)
		int endPage = startPage+10-1;
		
		if(endPage>maxPage) endPage = maxPage;
		
		
		PageInfo pageInfo = new PageInfo();
		pageInfo.setEndPage(endPage);
		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("beautyList", articleList);
		ActionForward forward = new ActionForward();
		forward.setPath("/Beautyroom.jsp");
		
		return forward;
	}

}
