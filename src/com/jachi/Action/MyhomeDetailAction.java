package com.jachi.Action;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jachi.DTO.ActionForward;
import com.jachi.DTO.BeautyRoomDTO;
import com.jachi.DTO.PageInfo;
import com.jachi.DTO.Posting_replyDTO;
import com.jachi.svc.BookMarkCheckService;
import com.jachi.svc.LikePostinCheckService;
import com.jachi.svc.MyhomeDetailService;

 public class MyhomeDetailAction implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
		
		 
		 HttpSession session = request.getSession(false);
		String us_id = (String)session.getAttribute("us_id");
		int board_num=Integer.parseInt(request.getParameter("board_num"));
	
		MyhomeDetailService myhomeDetailService = new MyhomeDetailService();
		List<BeautyRoomDTO> article = myhomeDetailService.getArticle(board_num);
        
        
        
        //����¡
		int page=1;
		int limit=5;
		if(request.getParameter("page")!=null) {
			page=Integer.parseInt(request.getParameter("page"));
		}
		int listCount = myhomeDetailService.getListCount(board_num);
		List<Posting_replyDTO> coment = myhomeDetailService.getReply(page,limit,board_num);
        
		
		int maxPage=(int)((double)listCount/limit+0.95);
		int startPage = (((int)((double)page/10+0.9)) - 1)* 10 + 1;
		int endPage = startPage + 10 -1;
		
		if(endPage>maxPage) endPage = maxPage;
		
		
		PageInfo pageInfo = new PageInfo();
		pageInfo.setEndPage(endPage);
		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);
		request.setAttribute("pageInfo", pageInfo);	
		
        //
        
		if(us_id != null) {
			
			
		// ���ƿ�, ��ũ�� ����
		Map<String, Object> m = new HashMap<>();

		m.put("no", board_num);
		m.put("id", us_id);

		LikePostinCheckService likePostinCheckService = new LikePostinCheckService();
		int result = likePostinCheckService.likeCheck(m);
		
		if(result == 0){ // 
			request.setAttribute("Like", "0");
		}else{ // 
			request.setAttribute("Like", "1");
		}
		
		BookMarkCheckService bookMarkCheckService = new BookMarkCheckService();
		int result2 = bookMarkCheckService.likeCheck(m);
		
		if(result2 == 0){ // 
			request.setAttribute("Bookmark", "0");
		}else{ // 
			request.setAttribute("Bookmark", "1");
		}
		
		}else {
			request.setAttribute("Like", "1");
			request.setAttribute("Bookmark", "1");
		}
		ActionForward forward = new ActionForward();
	   	request.setAttribute("article", article);
	   	request.setAttribute("coment", coment);
   		forward.setPath("/Myhome_board_view.jsp");
   		return forward;

	 }
	 
}