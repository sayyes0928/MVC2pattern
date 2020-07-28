<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="mybatis.java.dao.UserDAO" %>
<%@page import="mybatis.java.dto.UserDTO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
 SqlSessionFactory sqlfactory = UserDAO.getConn();
 SqlSession sqlsession = sqlfactory.openSession();
 List<UserDTO> selectList = sqlsession.selectList("select_all");
 
 for(int i = 0; i <selectList.size(); i++ ){
	 out.print("ex01:"+selectList.get(i).getEx01());
	 out.print("ex02:"+selectList.get(i).getEx02());
	 out.print("ex03:"+selectList.get(i).getEx03()+"<br>");
 }
 
%>
<a href="Index.jsp">처음으로</a>
</body>
</html>