package com.jachi.Action;

import java.io.PrintWriter; 

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jachi.DTO.ActionForward;
import com.jachi.DTO.BoardBean;
import com.jachi.DTO.TipDTO;
import com.jachi.svc.BoardWriteProService;
import com.jachi.svc.TipwriteService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class TipwriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(false);
		String us_id = (String) session.getAttribute("us_id");
		ActionForward forward=null;
		TipDTO tipdto = null;
		String realFolder="";
		String saveFolder="/upload";
		int fileSize=5*1024*1024;
		ServletContext context = request.getServletContext();
		realFolder=context.getRealPath(saveFolder);
		MultipartRequest multi = new MultipartRequest(request,
				realFolder,
				fileSize,
				"UTF-8",
				new DefaultFileRenamePolicy());
        String cover_imgname = multi.getFilesystemName("cover_img");
		tipdto = new TipDTO();
		tipdto.setTip_nickname(us_id);
		tipdto.setTip_title(multi.getParameter("write_title"));
		tipdto.setTip_post(multi.getParameter("editordata"));
		tipdto.setTip_coverimg(cover_imgname);
 
		TipwriteService tipwriteService = new TipwriteService();
		boolean isWriteSuccess = tipwriteService.registArticle(tipdto);
	
		if(!isWriteSuccess){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('등록실패')");
			out.println("history.back();");
			out.println("</script>");
		}
		else{
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("tipselect.bo");
		}

		return forward;

	}
	    
}
