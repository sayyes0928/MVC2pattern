package com.jachi.Action;

import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jachi.DTO.ActionForward;
import com.jachi.DTO.ProductinfoDTO;
import com.jachi.svc.BoardWriteProService;
import com.jachi.svc.ProductinfoWriteProService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ProductinfoWriteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{

		String pro_mainimg="";
	    String pro_subimg="";
		String pro_mainimg_name="";
		String pro_subimg_name="";
		String orig_pro_mainimg_name="";
		String orig_pro_subimg_name="";
		
		String pro_code= "";
		String pro_name= "";
		String pro_price_string = "";
		String pro_option_1="";
		String pro_option_2= "";
		String pro_option_3= "";
		String pro_catecode1= "";
		String pro_catecode2= "";
		String pro_catecode3= "";
		String optionCate1= "";
		String optionCate2= "";
		String optionCate3= "";
		
		


         String pro_option1 = optionCate1+","+pro_option_1;
         String pro_option2 = optionCate2+","+pro_option_2;
         String pro_option3 = optionCate3+","+pro_option_3;
         
         int pro_price = Integer.parseInt(pro_price_string);

         ProductinfoDTO productinfoDTO = new ProductinfoDTO();

         

		
		ActionForward forward=null;
		String realFolder="";
		String saveFolder="/upload";
		int fileSize=10*1024*1024;
		ServletContext context = request.getServletContext();
		realFolder=context.getRealPath(saveFolder);
		MultipartRequest multi=new MultipartRequest(request,
				realFolder,
				fileSize,
				"UTF-8",
				new DefaultFileRenamePolicy());
		
		
		 pro_code=multi.getParameter("pro_code");		
		 pro_name= multi.getParameter("pro_name");
		 pro_price_string = multi.getParameter("pro_price");
		 pro_option_1= multi.getParameter("pro_option1");
		 pro_option_2= multi.getParameter("pro_option2");
		 pro_option_3= multi.getParameter("pro_option3");
		 pro_catecode1= multi.getParameter("pro_catecode1");
		 pro_catecode2= multi.getParameter("pro_catecode2");
		 pro_catecode3= multi.getParameter("pro_catecode3");
		 optionCate1= multi.getParameter("optionCate1");
		 optionCate2= multi.getParameter("optionCate2");
		 optionCate3= multi.getParameter("optionCate3");
		
		 Enumeration files=multi.getFileNames();
			
			pro_mainimg_name =(String)files.nextElement();
			pro_mainimg=multi.getFilesystemName(pro_mainimg_name);
			orig_pro_mainimg_name= multi.getOriginalFileName(pro_mainimg_name);
			
			pro_subimg_name =(String)files.nextElement();
			pro_subimg=multi.getFilesystemName(pro_mainimg_name);
			orig_pro_subimg_name= multi.getOriginalFileName(pro_mainimg_name);
		
		productinfoDTO = new ProductinfoDTO();
		productinfoDTO.setPro_code(pro_code);
		productinfoDTO.setPro_name(pro_name);
		productinfoDTO.setPro_price(pro_price);
		productinfoDTO.setPro_mainimg(pro_mainimg);
		productinfoDTO.setPro_subimg(pro_subimg);
		productinfoDTO.setPro_option1(pro_option1);
		productinfoDTO.setPro_option2(pro_option2);
		productinfoDTO.setPro_option3(pro_option3);
		productinfoDTO.setPro_catecode1(pro_catecode1);
		productinfoDTO.setPro_catecode2(pro_catecode2);
		productinfoDTO.setPro_catecode3(pro_catecode3);
		
		
		ProductinfoWriteProService productinfoWriteProService = new ProductinfoWriteProService();
		boolean isWriteSuccess = productinfoWriteProService.registArticle(productinfoDTO);
		System.out.println(isWriteSuccess);
		
		
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
			forward.setRedirect(true);
			forward.setPath("boardList.bo");
		}

		return forward;

	}

}