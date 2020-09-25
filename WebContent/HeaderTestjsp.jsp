<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헤더테스트</title>

<link rel="stylesheet" href="./Teamcss/HeaderTest.css" type="text/css">
</head>


<body>
	<header>
		<div id="test_header">
			<div id="header_size">
				<img src="./img/jachilogo75.png" id="logosize">
				<div class="main_menu">
					<ul>
						<li><a href="Jachi_main.bo">Home</a></li>
						<li><a href="storeList.bo">Store</a></li>
						<li><a href="btList.bo">Photo</a></li>
						<li><a href="qna.bo">QnA</a></li>
						<li><a href="#">Contact</a></li>
					</ul>
				</div>

				<!--  -->
				<%
					String us_id = (String) session.getAttribute("us_id"); //로그인 유무 확인
					if (us_id == null) {
				%>

				<div id="user_nav">
					<span id="join_nav">Sign Up</span>|<span id="login_nav">Login</span>
				</div>
				<%
					} else {
				%>
				<div id="user_nav">
					<span id="join_nav"><a href="MypageProfile.bo">MyPage</a></span>|<span id="login_nav"><a href="CartList.bo">CartList</a></span>|<span id="login_nav"><a href="logoutActionPage.jsp">LogOut</a></span>
				</div>
				<%
					}
				%>

			</div>
		</div>
	</header>
</body>
</html>