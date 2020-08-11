<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.jachi.DTO.BeautyRoomDTO"%>

<%
	ArrayList<BeautyRoomDTO> userpost = (ArrayList<BeautyRoomDTO>) request.getAttribute("beautyList");
session.setAttribute("US_ID", "ljkim0829");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 방 자랑</title>

<link rel="stylesheet" href="./Teamcss/Beautyroom.css" type="text/css">
<link rel="stylesheet" href="./myhome.web.css/teamTopNav.css"
	type="text/css">
<link rel="stylesheet" href="./Teamjs/team_catemenu.js">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
</head>

<script>
 function alertLogin(){
	 alert('로그인이 필요합니다');
	 location.href='LoginFormpage.bo'
 }
</script>
<body>
	<form id="contentPage">
		<header>
        <div id="h_wrap">
          <div class="h_div">
            <ul>
              <li style="padding-top: 110px;">
                <img src="./img/grass2icon.svg" width="30" height="30" />
              </li>
              <li style="padding-top: 80px;">
                <img src="./img/truck2.svg" width="70" height="70" />
              </li>
              <li><img src="./img/sunicon.svg" width="60" height="60" /></li>
              <li style="padding-top: 110px;">
                <img src="./img/grass2icon.svg" width="30" height="30" />
              </li>
              <li style="padding-top: 100px;">
                <img src="./img/grassicon.svg" width="40" height="40" />
              </li>

              <li><h1>자취해보자</h1></li>
              <li style="padding-top: 20px;">
                <img
                  src="./img/houseiconcolor.svg"
                  width="100"
                  height="100"
                  onmouseover="this.src='./img/houseicon.svg'"
                  onmouseout="this.src='./img/houseiconcolor.svg'"
                />
              </li>
              <li style="padding-top: 100px;">
                <img src="./img/grassicon.svg" width="40" height="40" />
              </li>
              <li style="padding-top: 100px;">
                <img src="./img/grassicon.svg" width="40" height="40" />
              </li>
              <li style="padding-top: 110px;">
                <img src="./img/grass2icon.svg" width="30" height="30" />
              </li>
            </ul>
       <%
       String us_id = (String)session.getAttribute("us_id"); //로그인 유무 확인
       if(us_id==null){
     %>
            <ul class="login_go">
              <li><a href="LoginFormpage.bo">로그인</a></li>
              <li><span> | </span></li>
              <li><a href="join.bo">회원가입</a></li>
            </ul>
      

     <%
       }else{
     %>
            <ul class="login_go">
              <li><span></span></li>
              <li><a href="MypageOrderView.bo">마이페이지</a></li>
              <li><span> | </span></li>
              <li><a href="logoutActionPage.jsp">로그아웃</a></li> 
            </ul>
        
       

     <%
       }
     %>
          </div>
        </div>
        <script>
          $(function () {
            $("#main_nav ul li").hover(
              function () {
                $(this).addClass("main_navov");
              },
              function () {
                $(this).removeClass("main_navov");
              }
            );
          });
        </script>
        <script>
          $(function () {
            $("#sub").hide();
            $("#main_nav").hover(function () {
              $(this).parent().find("#sub").slideDown();
              $(this)
                .parent()
                .hover(
                  function () {},
                  function () {
                    $(this).parent().find("#sub").slideUp(900);
                  }
                );
            });
          });
        </script>
        <script>
          $(document).ready(function () {
            $(".slider").bxSlider({
              mode: "horizontal",
              auto: true,
              speed: 600,
              pause: 4000,
            });
          });
        </script>
        <div id="main_nav">
          <ul>
            <li>
              <a href="Index.jsp"><span>홈</span></a>
            </li>
            <li>
              <a href="storeList.bo"><span>스토어</span></a>
            </li>
            <li>
              <a href="beauty.bo"><span>커뮤니티</span></a>
            </li>
            <li>
              <a href="#"><span>자취에대한 모든것</span></a>
            </li>

            <li>
              <a href="#"><span>고객센터</span></a>
            </li>
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


		<main>

		<div id="Beauty_banner">
			<div id="Beauty_title">나만의 방 자랑하기</div>

			<%
				if (us_id != null) {
		%>
			<div id="wrtie_btsize">
				<a href="Beautyroom_write.bo"><input type="button" value="자랑하기"
					id="BT_Writebt"></a>
			</div>
			<%
				} else {
			%>
			<div id="wrtie_btsize">
				<a href="beauty.bo"><input type="button" value="자랑하기" id="BT_Writebt" onclick="alertLogin()"></a>
			</div>
			<%
				}
			%>
			<hr id="Beauty_hr">
			<div id="Beauty_subtitle">어서오세요, 천천히 둘러보고 가세요 :D</div>

		</div>



		<section class="cards">
			<%
				if (userpost != null) {
					for (int i = 0; i < userpost.size(); i++) {
			%>

			<article class="card card--1">
				<div class="card__info-hover">
					<svg class="card__like" viewBox="0 0 24 24">
    <path fill="#000000"
							d="M12.1,18.55L12,18.65L11.89,18.55C7.14,14.24 4,11.39 4,8.5C4,6.5 5.5,5 7.5,5C9.04,5 10.54,6 11.07,7.36H12.93C13.46,6 14.96,5 16.5,5C18.5,5 20,6.5 20,8.5C20,11.39 16.86,14.24 12.1,18.55M16.5,3C14.76,3 13.09,3.81 12,5.08C10.91,3.81 9.24,3 7.5,3C4.42,3 2,5.41 2,8.5C2,12.27 5.4,15.36 10.55,20.03L12,21.35L13.45,20.03C18.6,15.36 22,12.27 22,8.5C22,5.41 19.58,3 16.5,3Z" />
</svg>
					<div class="card__clock-info">
						<svg class="card__clock" viewBox="0 0 24 24">
							<path
								d="M12,20A7,7 0 0,1 5,13A7,7 0 0,1 12,6A7,7 0 0,1 19,13A7,7 0 0,1 12,20M19.03,7.39L20.45,5.97C20,5.46 19.55,5 19.04,4.56L17.62,6C16.07,4.74 14.12,4 12,4A9,9 0 0,0 3,13A9,9 0 0,0 12,22C17,22 21,17.97 21,13C21,10.88 20.26,8.93 19.03,7.39M11,14H13V8H11M15,1H9V3H15V1Z" />
        </svg>
						<span class="card__time">방금전</span>
					</div>

				</div>
				<div class="card__img"
					style="background-image: URL(<%=request.getContextPath()%>/upload/<%=userpost.get(i).getPost_pic()%>);"></div>
				<a href="Beautyroom_Detail.bo?board_num=<%=userpost.get(i).getPost_num()%>" class="card_link">
				 <div class="card__img--hover" style="background-image: URL(<%=request.getContextPath()%>/upload/<%=userpost.get(i).getPost_pic()%>);"></div>
				</a>
				<div class="card__info">
					<input type="hidden" value="<%=userpost.get(i).getPost_num()%>">
					<span class="card__category"><%=userpost.get(i).getPost_title()%></span>
					<h3 class="card__title"><%=userpost.get(i).getPost_posting()%></h3>
					<span class="card__by">by <a href="Beautyroom_Detail.bo?board_num=<%=userpost.get(i).getPost_num()%>" class="card__author" title="author"><%=userpost.get(i).getPost_nkname()%></a></span>
				</div>
			</article>
			<%
				}
			%>
			<%
				} else {
			%>
			<span>등록된 글이 없습니다</span>
			<%
				}
			%>


		</section>


		</main>
		</form>
</body>
</html>