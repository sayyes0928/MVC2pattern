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
	session.invalidate(); //현재 이 페이지의 회원이 세션을 빼앗기도록 만들어준다.
	%>
<script>
location.href = 'Index.bo';
</script>
</body>
</html>