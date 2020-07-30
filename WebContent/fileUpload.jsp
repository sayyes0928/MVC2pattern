<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.jachi.DAO.BoardDAO" %>
<%@page import="com.jachi.DTO.ProductinfoDTO" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<%
	String uploadPath=request.getRealPath("/upload");
	
	int size = 10*1024*1024; //사이즈제한 몇 바이트인지
	String name="";
	//String subject="";
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
	try{
		
		
		MultipartRequest multi=new MultipartRequest(request,
					uploadPath,
					size, 
					"UTF-8",
		new DefaultFileRenamePolicy());

		
		 //파일첨부 페이지로부터 요소를 받아온다.
		
		
		//subject=multi.getParameter("subject");
		 
		 
		Enumeration files=multi.getFileNames();
		
		pro_mainimg_name =(String)files.nextElement();
		pro_mainimg=multi.getFilesystemName(pro_mainimg_name);
		orig_pro_mainimg_name= multi.getOriginalFileName(pro_mainimg_name);
		
		pro_subimg_name =(String)files.nextElement();
		pro_subimg=multi.getFilesystemName(pro_mainimg_name);
		orig_pro_subimg_name= multi.getOriginalFileName(pro_mainimg_name);
		
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

out.print(pro_mainimg_name);
String pro_option1 = optionCate1+","+pro_option_1;
String pro_option2 = optionCate2+","+pro_option_2;
String pro_option3 = optionCate3+","+pro_option_3;

ProductinfoDTO productinfoDTO = new ProductinfoDTO();

int pro_price = Integer.parseInt(pro_price_string);

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

SqlSessionFactory sqlfactory = BoardDAO.getConn();
SqlSession sqlsession = sqlfactory.openSession();
int insert = sqlsession.insert("insert_productinfo",productinfoDTO);
	sqlsession.commit();
	sqlsession.close();
	
response.sendRedirect("storeList.bo");
		
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>
