<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
 session.setAttribute("userID", "aaa");
session.setAttribute("us_id", "aaa");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="MypageOrderList.bo" method="post" name="myorder">
 <input type="hidden" value="aaa" name="userID"/>
 <input type="submit" value="힘내">

</form>
</body>
</html>