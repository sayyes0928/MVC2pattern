package com.jachi.Action;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jachi.DAO.BoardDAO;
import com.jachi.DTO.ActionForward;
import com.jachi.DTO.BoardBean;
import com.jachi.DTO.PageInfo;
import com.jachi.DTO.ProductinfoDTO;
import com.jachi.svc.BoardListService;
import com.jachi.svc.PLSelectService;

public class PLSelectAction implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("들어왔나?");
		List<ProductinfoDTO> article = new ArrayList<ProductinfoDTO>();
		PLSelectService plSelectService = new PLSelectService();
		article = plSelectService.getproinfo();
		
		ActionForward forward = new ActionForward();
		request.setAttribute("article", article);
		System.out.println("다시액션으로 전달됐니?");
		forward.setPath("/ProductList.jsp");
		return forward;
	}

}
