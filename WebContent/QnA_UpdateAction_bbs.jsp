<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="mybatis.java.dao.UserDAO" %>
<%@page import="mybatis.java.dto.QnABBS" %>
<% request.setCharacterEncoding("UTF-8");%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 

 QnABBS qnaDTO = new QnABBS();
 String qna_num_not = request.getParameter("qna_num");
 String qna_title = request.getParameter("qna_title");
 String qna_post = request.getParameter("qna_post");
 
 Integer qna_num = Integer.parseInt(qna_num_not);
 
 qnaDTO.setQna_num(qna_num);
 qnaDTO.setQna_title(qna_title);
 qnaDTO.setQna_post(qna_post);
 
 SqlSessionFactory sqlfactory = UserDAO.getConn();
 SqlSession sqlsession = sqlfactory.openSession();
 int insert = sqlsession.insert("update_QnA",qnaDTO);
	sqlsession.commit();
	sqlsession.close();
	
 response.sendRedirect("QnA_view_bbs.jsp");
%>

</body>
</html>