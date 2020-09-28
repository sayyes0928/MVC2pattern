<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*"%>
<%@ page import="com.jachi.DTO.BeautyRoomDTO"%>
<%@ page import="com.jachi.DTO.PageInfo"%>
<%
ArrayList<BeautyRoomDTO> userpost = (ArrayList<BeautyRoomDTO>) request.getAttribute("beautyList");
PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
int listCount = pageInfo.getListCount();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./Teamcss/Beautyroom_index.css" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<script>
	var btintest = jQuery.noConflict();
	btintest(document).ready(function(){
		btintest('#banner_box1').hover(function(){
			btintest('#banner2').css('color','black');
			btintest('#banner2').css('-webkit-transition','-webkit-transform .8s ease');
			btintest('#banner2').css('transform','scale(1.05)');
			btintest('#banner2').css('border','5px solid black');
			
			},
			function(){
				btintest('#banner2').css('color','white');
				btintest('#banner2').css('-webkit-transition','-webkit-transform .8s ease');
				btintest('#banner2').css('transform','scale(1.05)');
				btintest('#banner2').css('border','5px solid white');	
			});
		
		
		});
	
	</script>

</head>
<body>
<header>
<jsp:include page="HeaderTestjsp.jsp"></jsp:include>
<div id="full_banner"><div id="back_text">BEAUTY MY ROOM</div>
<div id="back_test2">LIFESTYLE & MY PLACE</div></div>
</header>

<main>
	<div id="store_index_banner_body">
			<div id="banner_box1"><div id="banner1">SELF DIY BEST</div><div id="banner2">보러가기</div></div>
			<div id="banner_box2"><div id="banner3">LIFESTYLE</div><div id="banner4">TIP</div></div>
		</div>
	<div id="store_index_main">
			<div id="sub_title1">
				PHOTO
			</div>
			<section class="cards">
					<%
						if (listCount > 0) {
							for (int i = 0; i < userpost.size(); i++) {
					%>

					<article class="card card--1">
						<div class="card__info-hover">
							<svg class="card__like" viewBox="0 0 24 24">
    <path fill="#000000" d="M12.1,18.55L12,18.65L11.89,18.55C7.14,14.24 4,11.39 4,8.5C4,6.5 5.5,5 7.5,5C9.04,5 10.54,6 11.07,7.36H12.93C13.46,6 14.96,5 16.5,5C18.5,5 20,6.5 20,8.5C20,11.39 16.86,14.24 12.1,18.55M16.5,3C14.76,3 13.09,3.81 12,5.08C10.91,3.81 9.24,3 7.5,3C4.42,3 2,5.41 2,8.5C2,12.27 5.4,15.36 10.55,20.03L12,21.35L13.45,20.03C18.6,15.36 22,12.27 22,8.5C22,5.41 19.58,3 16.5,3Z" />
</svg>
							<div class="card__clock-info">
								<svg class="card__clock" viewBox="0 0 24 24">
							<path d="M12,20A7,7 0 0,1 5,13A7,7 0 0,1 12,6A7,7 0 0,1 19,13A7,7 0 0,1 12,20M19.03,7.39L20.45,5.97C20,5.46 19.55,5 19.04,4.56L17.62,6C16.07,4.74 14.12,4 12,4A9,9 0 0,0 3,13A9,9 0 0,0 12,22C17,22 21,17.97 21,13C21,10.88 20.26,8.93 19.03,7.39M11,14H13V8H11M15,1H9V3H15V1Z" />
        </svg>
								<span class="card__time">방금전</span>
							</div>

						</div>
						<div class="card__img"
							style="background-image: URL(<%=request.getContextPath()%>/upload/<%=userpost.get(i).getPost_pic()%>);"></div>
						<a
							href="Beautyroom_Detail.bo?board_num=<%=userpost.get(i).getPost_num()%>"
							class="card_link">
							<div class="card__img--hover"
								style="background-image: URL(<%=request.getContextPath()%>/upload/<%=userpost.get(i).getPost_pic()%>);"></div>
						</a>
						<div class="card__info">
							<input type="hidden" value="<%=userpost.get(i).getPost_num()%>">
							<span class="card__category"><%=userpost.get(i).getPost_title()%></span>
							<h3 class="card__title"><%=userpost.get(i).getPost_posting()%></h3>
							<span class="card__by">by <a
								href="Beautyroom_Detail.bo?board_num=<%=userpost.get(i).getPost_num()%>"
								class="card__author" title="author"><%=userpost.get(i).getpost_nickname()%></a></span>
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
			
			
			</div>	

</main>
</body>
</html>