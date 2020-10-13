<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%@ page import="com.jachi.DTO.UserinfoDTO" %>

<!DOCTYPE html>
<html>
<head>

    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css"href="./myhome.web.css/NaverloginPage.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
<meta charset="UTF-8">
<title>NaverLogin_page</title>
</head>
 <%
         String login = (String)session.getAttribute("us_id");  
    	 UserinfoDTO userinfoDTO = (UserinfoDTO)request.getAttribute("userinfo");
         String backPage = request.getHeader("Referer");
   
 %>
<body>
  
  <div class="wrapper">
    <form class="form-signin" action="join_Insert.bo" method="post" enctype="multipart/form-data" autocomplete="off">   
   <div class="form-structor">
	<div class="signup">
		<h2 class="form-title" id="signup"><span>or</span>Sign up</h2>
		<div class="form-holder">
			<input type="text" class="input" value=<%= userinfoDTO.getUs_name()%> name="name" readonly/>
			<input type="email" class="input" value=<%= userinfoDTO.getUs_mail()%> name="us_mail" />
			<input type="text" class="input" value=<%= userinfoDTO.getUs_nkname()%> name="nick" />
			<input type="hidden" class="input" value=<%= login%> name="id" />
		</div>
		<button class="submit-btn">Sign up</button>
	</div>
</div>
    </form>
  </div>
</body>
</html>