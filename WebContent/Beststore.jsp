<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.jachi.DTO.ProductinfoDTO"%>
<%
ArrayList<ProductinfoDTO> article = (ArrayList<ProductinfoDTO>) request.getAttribute("article");
String us_id = (String) session.getAttribute("us_id"); //로그인 유무 확인
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Best Store</title>

<link rel="stylesheet" href="./Teamcss/Beststore.css" type="text/css">
</head>
<body>

<header>
	<jsp:include page="HeaderTestjsp.jsp"></jsp:include>
	</header>
	<main>
	<div id="full_banner"><div id="back_text">BEST</div><div id="back_test2">STORE PRODUCT</div></div>
		
	<div id="firsec_size">
		<a href="Beautyroom_Detail.bo?board_num=<%=article.get(0).getPro_code()%>"><div id="firstbt" style="background-image: URL(<%=request.getContextPath()%>/upload/<%=article.get(0).getPro_mainimg()%>); background-repeat: no-repeat;">
			<div id="fir_back">오늘의 베스트</div>
			<div id="fir_nick"><%=article.get(0).getPro_name()%></div>
			<div id="fir_price"><%=article.get(0).getPro_price() %></div>
		</div>
		</a>
		
		<a href="Beautyroom_Detail.bo?board_num=<%=article.get(1).getPro_code()%>"><div id="secbt"  style="background-image: URL(<%=request.getContextPath()%>/upload/<%=article.get(1).getPro_mainimg()%>); background-repeat: no-repeat;">
			<div id="sec_nick"><%=article.get(1).getPro_name()%></div>
			<div id="sec_price"><%=article.get(1).getPro_price() %></div>
		</div>
		</a>
	</div>
	<div id="namugi">
		<a href="Beautyroom_Detail.bo?board_num=<%=article.get(2).getPro_code()%>">
		<div id="third" style="background-image: URL(<%=request.getContextPath()%>/upload/<%=article.get(2).getPro_mainimg()%>); background-repeat: no-repeat;">
			<div id="third_nick"><%=article.get(2).getPro_name()%></div>
		</div>
		</a>
		<a href="Beautyroom_Detail.bo?board_num=<%=article.get(3).getPro_code()%>">
		<div id="fourth" style="background-image: URL(<%=request.getContextPath()%>/upload/<%=article.get(3).getPro_mainimg()%>); background-repeat: no-repeat;">
			<div id="fourth_nick"><%=article.get(3).getPro_name()%></div>
		</div>
		</a>
		<a href="Beautyroom_Detail.bo?board_num=<%=article.get(4).getPro_code()%>">
		<div id="fifth" style="background-image: URL(<%=request.getContextPath()%>/upload/<%=article.get(4).getPro_mainimg()%>); background-repeat: no-repeat;">
			<div id="fifth_nick"><%=article.get(4).getPro_name()%></div>
		</div>
		</a>
	</div>
	
	
	
	</main>

</body>
</html>