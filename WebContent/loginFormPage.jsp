<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"
	charset="utf-8"></script>

<link rel="stylesheet" type="text/css"
	href="./myhome.web.css/loginPage.css" />
<!-- <link rel="stylesheet" type="text/css"href="teamTopNav.css" /> -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css" />
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Login_page</title>
</head>
<%
	String login = (String) session.getAttribute("userID");
	if (login != null) {
	}
%>

 <%
	/// <summary>
	/// by주영, 네이버 아이디로 로그인 요청시, 해당 페이지의 클라이언트 정보를 담아 로그인 페이지로 이동
	///      로그인 여부에 따라 콜백 페이지로 이동.
	/// </summary> 
	String clientId = "Z5SQgAjtE4al89G3NLng";
	//by 주영, 애플리케이션 클라이언트 (네아로)아이디값_200728
	String redirectURI = URLEncoder.encode("http://greenjachi.cafe24.com/callbackNaver.bo", "UTF-8");
	//by 주영, 네아로의 토큰값을 사용해 유저 정보를 받아오기 위한 서블릿 페이지(콜백페이지) 경로

	/* by주영, 로그인 후, 이전페이지로 돌아가기 위해 URL의 헤더값을 가져와 저장
	* 필요에 따라 세션값에 저장된 백페이지를 사용한다._200728
	*/
	String backPage = request.getHeader("Referer");
	session.setAttribute("backPage", backPage);

	/*
	* by주영, 네아로 API를 사용하기 위한 URL 생성구조, 네이버로부터 할당받아 사용한다_200728
	*/
	SecureRandom random = new SecureRandom();
	String state = new BigInteger(130, random).toString();
	String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
	apiURL += "&client_id=" + clientId;
	apiURL += "&redirect_uri=" + redirectURI;
	apiURL += "&state=" + state;
	session.setAttribute("state", state);
 %>

<body>

	<div class="wrapper">
		<form class="form-signin" action="loginAction.bo" method="post">
			<input type="hidden" value=<%=backPage%> name="backPage" />
			<h1 class="form-signin-heading">로그인</h1>
			<input type="text" class="form-control" name="us_id"
				placeholder="아이디를 입력해주세요" /> <input type="password"
				class="form-control" name="us_pw" placeholder="비밀번호를 입력해주세요" /> <a
				href="<%=apiURL%>"> <img height="50"
				src="./img/naverLoginBtn.PNG" />
			</a>
			<div>
				<a href="join.jsp" class="join_go">회원가입</a>
			</div>
			<button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
		</form>
	</div>
</body>
</html>