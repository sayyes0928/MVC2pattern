<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.jachi.DAO.BoardDAO" %>
<%@page import="com.jachi.DTO.UserinfoDTO" %>
<%@ page trimDirectiveWhitespaces="true" %>

<%
  String us_nkname = request.getParameter("NICK");

  BoardDAO userDAO = BoardDAO.getInstance();
  SqlSessionFactory factory = BoardDAO.getConn();
  SqlSession sqlsession = factory.openSession();
  String nickname_se = sqlsession.selectOne("us_nkname_select", us_nkname);
  sqlsession.close();
  
  if(nickname_se == null){
	  
	   out.print("사용 가능한 닉네임입니다.");
	  }else{

	    out.print("중복된 닉네임이 있습니다.");
	  }
%>
