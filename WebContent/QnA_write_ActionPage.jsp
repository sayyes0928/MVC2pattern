<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="mybatis.java.dao.UserDAO" %>
<%@page import="mybatis.java.dto.QnABBS" %>
<%
		String qna_nickname = null; //로그인을 한 사람들은 userID에 해당 값이 담기고, 아닌 사람들은 null 값이 담긴다
		if (session.getAttribute("userID") != null) {
			qna_nickname = (String) session.getAttribute("userID");
		}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
 String us_id =(String)session.getAttribute("us_id");
 String qna_title = request.getParameter("QnA_title");
 String qna_post = request.getParameter("QnA_content");
 
 QnABBS qnaDTO = new QnABBS();

 qnaDTO.setQna_title(qna_title);
 qnaDTO.setQna_post(qna_post);
 qnaDTO.setQna_nickname(us_id);
 
 UserDAO userDAO = UserDAO.getinstance();
 SqlSessionFactory sqlfactory = UserDAO.getConn();
 SqlSession sqlsession = sqlfactory.openSession();
 int insert = sqlsession.insert("insert_qna",qnaDTO);
	sqlsession.commit();
	sqlsession.close();
	
 response.sendRedirect("QnA_view_bbs.jsp");
%>

</body>
</html>