<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name = "google-signin-client_id"content = "718028943374-g1388634jglvhvrqeo1h6a781q2jmac2.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>
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
<body>
  
  <div class="wrapper">
    <form class="form-signin" action="loginAction.bo" method="post">       
      <h1 class="form-signin-heading">로그인</h1>
      <input type="text" class="form-control" name="us_id" placeholder="아이디를 입력해주세요"  />
      <input type="password" class="form-control" name="us_pw" placeholder="비밀번호를 입력해주세요" />      
      <label class="checkbox">
        <input type="checkbox" value="아이디 기억하기" id="rememberMe" name="rememberMe" class="join_go"> 아이디 기억하기
      </label>
      <div class="g-signin2" data-onsuccess="onSignIn"></div>
      <script>
function onSignIn(googleUser) {
	  var profile = googleUser.getBasicProfile();
	  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
	  console.log('Name: ' + profile.getName());
	  console.log('Image URL: ' + profile.getImageUrl());
	  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
	}
</script>
      <a href="join.jsp" class="join_go">회원가입</a>
      <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>   
    </form>
  </div>
</body>
</html>