<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃</title>
</head>
<body>
	<%
	   String backPage = (String)session.getAttribute("backPage");
	   
	   
	   response.setContentType("text/html;charset=UTF-8");
		out.println("<html><body><script>");
		out.println("location.href='"+backPage+"'");
		out.println("</script></body></html>");
		out.flush();
	session.invalidate(); //현재 이 페이지의 회원이 세션을 빼앗기도록 만들어준다.
	%>
<script>

</script>
</body>
</html>