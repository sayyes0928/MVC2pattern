<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String backPage = (String) session.getAttribute("backPage");
		session.removeAttribute("cart");
		response.setContentType("text/html;charset=UTF-8");
		out.println("<html><body><script>");
		out.println("location.href='" + backPage + "'");
		out.println("</script></body></html>");
		out.flush();
	%>


	<script>
		
	</script>
</body>
</html>