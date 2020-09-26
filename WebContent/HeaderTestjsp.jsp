<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헤더테스트</title>

<link rel="stylesheet" href="./Teamcss/HeaderTest.css" type="text/css">
<script src="http://code.jquery.com/jquery-latest.js"></script>

<script>
$(document).ready(function(){
	$('#a_home').hover(function(){
		$('#sub_store').css('display','none');
		$('#sub_home').css('display','inline');
		$('#sub_Photo').css('display', 'none');
		$('#sub_qna').css('display', 'none');
		$('#sub_contact').css('display', 'none');
	});
	
	
	$('#a_store').hover(function(){
		$('#sub_home').css('display','none');
		$('#sub_store').css('display','inline');
		$('#sub_Photo').css('display', 'none');
		$('#sub_qna').css('display', 'none');
		$('#sub_contact').css('display', 'none');
	});
	
	$('#a_photo').hover(function(){
		$('#sub_home').css('display','none');
		$('#sub_store').css('display','none');
		$('#sub_Photo').css('display', 'inline');
		$('#sub_qna').css('display', 'none');
		$('#sub_contact').css('display', 'none');
	});
	
	$('#a_qna').hover(function(){
		$('#sub_home').css('display','none');
		$('#sub_store').css('display','none');
		$('#sub_Photo').css('display', 'none');
		$('#sub_qna').css('display', 'inline');
		$('#sub_contact').css('display', 'none');
	});
	
	$('#a_contact').hover(function(){
		$('#sub_home').css('display','none');
		$('#sub_store').css('display','none');
		$('#sub_Photo').css('display', 'none');
		$('#sub_qna').css('display', 'none');
		$('#sub_contact').css('display', 'inline');
	});
});
</script>
</head>


<body>
	<header>
		<div id="test_header">
			<div id="header_size">
				<img src="./img/jachilogo75.png" id="logosize">
				<div class="main_menu">
					<ul>
						<li><a href="Jachi_main.bo" id="a_home">Home</a></li>
						<li><a href="storeList.bo" id="a_store">Store</a></li>
						<li><a href="btList.bo" id="a_photo">Photo</a></li>
						<li><a href="qna.bo" id="a_qna">QnA</a></li>
						<li><a href="#" id="a_contact">Contact</a></li>
					</ul>
				</div>

				<!--  -->
				<%
					String us_id = (String) session.getAttribute("us_id"); //로그인 유무 확인
					if (us_id == null) {
				%>

				<div id="user_nav">
					<span id="join_nav"><a href="LoginFormpage.bo">Sign Up</a></span>|<span id="login_nav"><a href="join.bo">Login</a></span>
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
		<div id="submenu_bar">
			<div class="sub_menu">
				<ul id="sub_home">
					<li><a href="#">Home</a></li>
					<li><a href="#">Best Room</a></li>
					<li><a href="#">Best Store</a></li>
				</ul>
				<ul id="sub_store">
					<li><a href="#">Store Home</a></li>
					<li><a href="#">Best Store</a></li>
					<li><a href="#">Category</a></li>
				</ul>
				<ul id="sub_Photo">
					<li><a href="#">Photo Home</a></li>
					<li><a href="#">Best Photo</a></li>
					<li><a href="#">Tip</a></li>
				</ul>
				<ul id="sub_qna">
					<li><a href="#">QNA Home</a></li>
					<li><a href="#">Notice</a></li>
				</ul>
				<ul id="sub_contact">
					<li><a href="#">contact</a></li>
				</ul>
			</div>
		
		</div>
	</header>
</body>
</html>