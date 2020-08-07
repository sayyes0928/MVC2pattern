<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>

<link rel="stylesheet" type="text/css"href="loginPage.css" />
    <!-- <link rel="stylesheet" type="text/css"href="teamTopNav.css" /> --> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"
    />
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"
    />
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Login_page</title>
</head>
 <%
 String login = (String)session.getAttribute("userID");
     if(login != null){
    	 
     }
 
    String clientId = "Z5SQgAjtE4al89G3NLng";//애플리케이션 클라이언트 아이디값";
    String redirectURI = URLEncoder.encode("http://127.0.0.1:8080/MVC2/callbackNaver.bo", "UTF-8");
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
      <h1 class="form-signin-heading">로그인</h1>
      <input type="text" class="form-control" name="us_id" placeholder="아이디를 입력해주세요"  />
      <input type="password" class="form-control" name="us_pw" placeholder="비밀번호를 입력해주세요" />      
      <label class="checkbox">
        <input type="checkbox" value="아이디 기억하기" id="rememberMe" name="rememberMe" class="join_go"> 아이디 기억하기
      </label>
     <a href="<%=apiURL%>">
     <img height="50" src="./img/naverLoginBtn.PNG"/>
     </a>





      <a href="join.jsp" class="join_go">회원가입</a>
      <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>   
    </form>
  </div>
</body>
</html>