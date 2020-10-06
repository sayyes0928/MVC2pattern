<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.jachi.DTO.BeautyRoomDTO"%>
<%
	ArrayList<BeautyRoomDTO> userpost = (ArrayList<BeautyRoomDTO>) request.getAttribute("beautyList");
String us_id = (String) session.getAttribute("us_id"); //로그인 유무 확인
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Best MYRoom</title>
<link rel="stylesheet" href="./Teamcss/Bestbt.css" type="text/css">


</head>
<body>
	<header>
	<jsp:include page="HeaderTestjsp.jsp"></jsp:include>
	</header>
	<main>
	<div id="full_banner"><div id="back_text">BEST</div><div id="back_test2">BeautyRoom</div></div>
		
	<div id="firsec_size">
		<a href="Beautyroom_Detail.bo?board_num=<%=userpost.get(0).getPost_num()%>"><div id="firstbt" style="background-image: URL(<%=request.getContextPath()%>/upload/<%=userpost.get(0).getPost_pic()%>); background-repeat: no-repeat;">
			<div id="fir_back">오늘의 베스트</div>
			<div id="fir_nick"><%=userpost.get(0).getpost_nickname()%></div>
		</div>
		</a>
		
		<a href="Beautyroom_Detail.bo?board_num=<%=userpost.get(1).getPost_num()%>"><div id="secbt"  style="background-image: URL(<%=request.getContextPath()%>/upload/<%=userpost.get(1).getPost_pic()%>); background-repeat: no-repeat;">
			<div id="sec_nick"><%=userpost.get(1).getpost_nickname()%></div>
		</div>
		</a>
	</div>
	<div id="namugi">
		<a href="Beautyroom_Detail.bo?board_num=<%=userpost.get(2).getPost_num()%>">
		<div id="third" style="background-image: URL(<%=request.getContextPath()%>/upload/<%=userpost.get(2).getPost_pic()%>); background-repeat: no-repeat;">
			<div id="third_nick"><%=userpost.get(2).getpost_nickname()%></div>
		</div>
		</a>
		<a href="Beautyroom_Detail.bo?board_num=<%=userpost.get(3).getPost_num()%>">
		<div id="fourth" style="background-image: URL(<%=request.getContextPath()%>/upload/<%=userpost.get(3).getPost_pic()%>); background-repeat: no-repeat;">
			<div id="fourth_nick"><%=userpost.get(3).getpost_nickname()%></div>
		</div>
		</a>
		<a href="Beautyroom_Detail.bo?board_num=<%=userpost.get(4).getPost_num()%>">
		<div id="fifth" style="background-image: URL(<%=request.getContextPath()%>/upload/<%=userpost.get(4).getPost_pic()%>); background-repeat: no-repeat;">
			<div id="fifth_nick"><%=userpost.get(4).getpost_nickname()%></div>
		</div>
		</a>
	</div>
	
	
	
	</main>

</body>
</html>