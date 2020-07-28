<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="mybatis.java.dao.UserDAO" %>
<%@page import="mybatis.java.dto.UserDTO" %>
<%@ page import="java.io.PrintWriter"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" type="text/css"href="teamTopNav.css" />
    <link rel="stylesheet" type="text/css"href="teamBBS.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"
    />
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"
    />
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <title>QnA</title>
  </head>
  <body>
  <% 
  UserDTO userDTO =  new UserDTO();
  String us_id =  request.getParameter("us_id");
  String us_pw = request.getParameter("us_pw");
  
  UserDAO userDAO = UserDAO.getinstance();
 SqlSessionFactory sqlfactory = UserDAO.getConn();
 SqlSession sqlsession = sqlfactory.openSession();
 String getPassword_userinfo = sqlsession.selectOne("login",us_id);
 
 if(us_pw.equals(getPassword_userinfo)){
	 session.setAttribute("us_id", us_id);
	 response.sendRedirect("QnA_view_bbs.jsp");
 }else if(getPassword_userinfo == null){
	 PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('등록되지 않은 사용자입니다.')");
		script.println("history.back()");
		script.println("</script>"); 
 }
 else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('아이디 또는 비밀번호가 잘못 되었습니다.')");
		script.println("history.back()");
		script.println("</script>");
 }
 
 
%>

  </body>
</html>
