<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>


   <!--   <link rel="stylesheet" type="text/css" href="./myhome.web.css/myhome_write_css.css" /> -->
    <link rel="stylesheet" type="text/css" href="./../myhome.web.css/page_myhome/heartbtn.css" />
    <link rel="stylesheet" type="text/css" href="./../myhome.web.css/myhome_write_Form.css" />
    <link rel="stylesheet" type="text/css" href="./../myhome.web.css/teamTopNav.css" />
    
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" type="text/css" href="./myhome.web.css//styleSlider.css" />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script
      type="text/javascript"
      src="./../myhome.web.js/jquery-easing-1.3.pack.js"
    ></script>
    <script
      type="text/javascript"
      src="./../myhome.web.js/jquery-easing-compatibility.1.2.pack.js"
    ></script>
    <script
      type="text/javascript"
      src="./../myhome.web.js/coda-slider.1.1.1.pack.js"
    ></script>

    <script type="text/javascript">
      var theInt = null;
      var $crosslink, $navthumb;
      var curclicked = 0;

      theInterval = function (cur) {
        clearInterval(theInt);

        if (typeof cur != "undefined") curclicked = cur;

        $crosslink.removeClass("active-thumb");
        $navthumb.eq(curclicked).parent().addClass("active-thumb");
        $(".stripNav ul li a").eq(curclicked).trigger("click");

        theInt = setInterval(function () {
          $crosslink.removeClass("active-thumb");
          $navthumb.eq(curclicked).parent().addClass("active-thumb");
          $(".stripNav ul li a").eq(curclicked).trigger("click");
          curclicked++;
          if (4 == curclicked) curclicked = 0;
        }, 3000);
      };

      $(function () {
        $("#main-photo-slider").codaSlider();

        $navthumb = $(".nav-thumb");
        $crosslink = $(".cross-link");

        $navthumb.click(function () {
          var $this = $(this);
          theInterval($this.parent().attr("href").slice(1) - 1);
          return false;
        });

        theInterval();
      });
    </script>
    
<meta charset="UTF-8">
<title>MVC 게시판</title>
<style type="text/css">

</style>
</head>
<body>
	<!-- 게시판 등록 -->
	<%
	/* String userID = (String)session.getAttribute("userID");
	if(userID == null){
		out.println("<script>");
		out.println("alert('로그인이 필요한 작업입니다.');");
		out.println("history.back();");
		out.println("</script>");
	}*/
	%>
      <header>
        <div id="h_wrap">
            <div class="h_div_side"></div>
            <div class="h_div">
            <ul>
            <li style="padding-top:110px"><img src="./../img/grass2icon.svg" width="30" height="30"/></li>
            <li style="padding-top:80px"><img src="./../img/truck2.svg" width="70" height="70"/></li>
            <li><img src="./../img/sunicon.svg" width="60" height="60"/></li>
            <li style="padding-top:110px"><img src="./../img/grass2icon.svg" width="30" height="30"/></li>
            <li style="padding-top:100px"><img src="./../img/grassicon.svg" width="40" height="40"/></li> 
            
            <li><h1>자취해보자</h1></li>
            <li style="padding-top:20px">
             <img src="./../img/houseiconcolor.svg" width="100" height="100" onmouseover="this.src='./../img/houseicon.svg'" onmouseout="this.src='./../img/houseiconcolor.svg'"/>
             </li>
             <li style="padding-top:100px"><img src="./../img/grassicon.svg" width="40" height="40"/></li>
             <li style="padding-top:100px"><img src="./../img/grassicon.svg" width="40" height="40"/></li> 
             <li style="padding-top:110px"><img src="./../img/grass2icon.svg" width="30" height="30"/></li>
            </ul>
            </div>
            <div class="h_div_side">    
             <%
               // if(us_id == null){
              %>
              <ul class="login_go">
              <li><a href="loginPage.jsp" >로그인</a></li>
              <li><span> | </span></li>
              <li><a href="join.jsp">회원가입</a></li>
              </ul>

              <%
            //  }else{
              %>
              
             <ul class="login_go">
             <li><span></span></li>
             <li><span> | </span></li>
             <li><a href="logoutActionPage.jsp" >로그아웃</a></li>
              </ul>
              <%
              //  }
              %>
            </div>
        </div>
        <script>
  $(function() {
    $('#main_nav ul li').hover(
      function() {
        $(this).addClass('main_navov');
      },
      function() {
        $(this).removeClass('main_navov');
      });
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
              <li><a href="teampro_myhome.html"><img src="jachievery.PNG" width="55" height="55"
              onmouseover="this.src='everyicon.svg'" onmouseout="this.src='jachievery.PNG'"></a>
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
	<section id="writeForm">
		<h2>게시판글등록</h2>
		<form action="Myhome_WritePro.bo" method="post" id="contentPage"
			enctype="multipart/form-data" name="boardform">
			<div class="write_Form">
			<table>
			    <tr>
			     <td>
			 <input type="hidden" value="userID" name="BOARD_NAME"/>
			     </td>
			    </tr>
				<tr class="BOARD_SUBJECT">
					<td><label for="BOARD_SUBJECT">제목</label></td>
					<td><input name="BOARD_SUBJECT" type="text"
						id="BOARD_SUBJECT" required="required" /></td>
				</tr>
				
				<tr class="BOARD_CONTENT">
					<td class="td_left"><label for="BOARD_CONTENT">내 용</label></td>
					<td><textarea id="BOARD_CONTENT" name="BOARD_CONTENT"
							cols="40" rows="15" required="required"></textarea></td>
				</tr>
				<tr>
					<td class="td_left"><label for="BOARD_FILE"> 파일 첨부 </label></td>
					<td class="td_right"><input name="BOARD_FILE" type="file"
						id="BOARD_FILE" required="required" /></td>
				</tr>
				<tr>
					<td class="td_left"><label for="BOARD_PASS">태 그</label></td>
					<td class="td_right"><input name="BOARD_PASS" type="text"
						id="BOARD_PASS" required="required" /></td>
				</tr>
			</table>
			</div>
			<section id="commandCell">
				<input type="submit" value="등록">&nbsp;&nbsp; <input
					type="reset" value="다시쓰기" />
			</section>
		</form>
	</section>
	<!-- 게시판 등록 -->
</body>
</html>