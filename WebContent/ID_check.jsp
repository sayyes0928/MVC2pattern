<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="mybatis.java.dao.UserDAO" %>
<%@page import="mybatis.java.dto.UserDTO.*" %>
<%@ page trimDirectiveWhitespaces="true" %>

    <%
    	String us_id = request.getParameter("ID");
      SqlSessionFactory factory = TestDAO.getConn();
      SqlSession sqlsession = factory.openSession();
      String id_se = sqlsession.selectOne("us_id_select", us_id);
      sqlsession.close();
      
      if(id_se == null){
    	   out.print("사용 가능한 아이디입니다.");
    	  }else{

    	    out.print("중복된 아이디가 있습니다.");
    	  }
    %>
