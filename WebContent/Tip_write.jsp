<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
session.setAttribute("us_id", "jae");
String us_id = (String) session.getAttribute("us_id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tip 게시글 등록</title>

<link rel="stylesheet" href="./myhome.web.css/teamTopNav.css" type="text/css">
<link rel="stylesheet" href="./myhome.web.css/Tip_write1.css" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="./summernote/summernote-lite.css" rel="stylesheet">
<script src="./summernote/summernote-lite.js"></script>
<script src="./myhome.web.js/Tip_write.js"></script>

</head>
<body>
   <form action="tipwrite.bo" id="contentPage"  method="post" enctype="multipart/form-data" autocomplete="off">
		<header>
			<div id="h_wrap">
				<div class="h_div">
					<ul>
						<li style="padding-top: 110px"><img src="img/grass2icon.svg"
							width="30" height="30" /></li>
						<li style="padding-top: 80px"><img src="img/truck2.svg"
							width="70" height="70" /></li>
						<li><img src="img/sunicon.svg" width="60" height="60" /></li>
						<li style="padding-top: 110px"><img src="img/grass2icon.svg"
							width="30" height="30" /></li>
						<li style="padding-top: 100px"><img src="img/grassicon.svg"
							width="40" height="40" /></li>

						<li><h1>자취해보자</h1></li>
						<li style="padding-top: 20px"><img
							src="img/houseiconcolor.svg" width="100" height="100"
							onmouseover="this.src='img/houseicon.svg'"
							onmouseout="this.src='img/houseiconcolor.svg'" /></li>
						<li style="padding-top: 100px"><img src="img/grassicon.svg"
							width="40" height="40" /></li>
						<li style="padding-top: 100px"><img src="img/grassicon.svg"
							width="40" height="40" /></li>
						<li style="padding-top: 110px"><img src="img/grass2icon.svg"
							width="30" height="30" /></li>
					</ul>

					<%
               // if(us_id == null){
              %>
					<ul class="login_go">
						<li><a href="loginPage.jsp">로그인</a></li>
						<li><span> | </span></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul>

					<%
            //  }else{
              %>

					<ul class="login_go">
						<li><span></span></li>
						<li><span> | </span></li>
						<li><a href="logoutActionPage.jsp">로그아웃</a></li>
					</ul>
					<%
              //  }
              %>
				</div>
			</div>
			<script>
  
    $('#main_nav ul li').hover(
      function() {
        $(this).addClass('main_navov');
      },
      function() {
        $(this).removeClass('main_navov');
      });
    

</script>
			<script>
  $(function() {
    $('#sub').hide();
    $('#main_nav').hover(function() {
      $(this).parent().find('#sub').slideDown();
      $(this).parent().hover(function() {

      }, function() {
        $(this).parent().find('#sub').slideUp(900);
      });
    });
  });
</script>
			<script>
  $(document).ready(function() {
    $('.slider').bxSlider({
     mode:'horizontal',
     auto: true,
     speed: 600,
     pause: 4000
    });

     
   });
</script>


			<div id="main_nav">
				<ul>
					<li><a href="teampro_ver_01_1.html"><span>홈</span></a>
					<li><a href="teampro_ver_01_1.html"><span>스토어</span></a>
					<li><a href="teampro_myhome.html"><span>자취에대한 모든것</span></a>
					<li><a href="teampro_myhome.html"><img
							src="img/jachievery.PNG" width="55" height="55"
							onmouseover="this.src='img/everyicon.svg'"
							onmouseout="this.src='img/jachievery.PNG'"></a>
					<li><a href="teampro_myhome.html"><span>고객센터</span></a>
				</ul>
			</div>
			<div id="sub">
				<div id="sub_menu">
					<div class="nav_container_div">
						<nav role="navigation" class="primary-navigation">

							<ul class="nav_container">
								<li>
									<ul class="m_line">
										<li><a href="#">카테고리</a></li>
										<li><a href="#">베스트</a></li>
										<li><a href="#">특가</a></li>
									</ul>
								</li>
								<li>
									<ul class="m_line">

										<li><a href="#">내방자랑</a></li>
										<li><a href="#">내집자랑</a></li>
										<li><a href="#">전문가집들이</a></li>
									</ul>
								</li>
								<li>
									<ul class="m_line">

										<li><a href="#">자취생TIP</a></li>
										<li><a href="#">자취생QnA</a></li>
										<li><a href="#">혼밥레시피</a></li>
									</ul>
								</li>
								<li>
									<ul class="m_line">
										<li><a href="#">질문과답변</a></li>
										<li><a href="#">공지사항</a></li>
									</ul>
								</li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</header>
		<section>
		 <div id="banner_wrap">
		   <div id="tip_banner">
		     <div id="banner_title1">자취에 대한 모든 것</div>
		     <div id="banner_title2">자취생TIP</div>
		     <div id="banner_title3">본인 만의 노하우를 알려주세요~</div>
		   </div>
	     </div>
		 <div id="main_wrap">
		   <div id="main_header">
		     <div id="page_subtitle">Tip 등록</div>
		     <hr id="title_line">
		    </div>
		    <div id="post_title">
		   <div id="title_label"><label for="write_title">제목</label></div>
		   <input id="title_text" type="text" name="write_title" placeholder="제목을 입력해 주세요!" onclick="hi()">
		   <div id="img_size"><input id="cover_img" type="file"></div>

		    </div>	     
	        <textarea id="summernote" name="editordata"></textarea>
	       <div id="button_list">
		    <input id="button_insert" type="submit" value="등록하기">
		    <input id="button_cancel" type="button" value="등록취소" onclick="location.href='TipPage.jsp'">
		   </div>
		 </div>
	
		</section>
  <script>

  
  $(document).ready(function() {
	  $('#summernote').summernote();
	});
    
  </script>		
  
		</form>

</body>
</html>