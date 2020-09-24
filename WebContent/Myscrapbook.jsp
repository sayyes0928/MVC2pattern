<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.jachi.DTO.DeliveryDTO"%>

<%@ page import="com.jachi.DTO.OrderListDTO"%>
<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8" />
<link rel="stylesheet" type="text/css"
	href="./myhome.web.css/teamTopNav.css" />
<link rel="stylesheet" type="text/css"
	href="./myhome.web.css/teamMypage.css" />
<link rel="stylesheet" type="text/css"
	href="./myhome.web.css/scrapbook_1.css" />
<link rel="stylesheet" type="text/css"
	href="./myhome.web.css/scrapbook_2.css" />
<link rel="stylesheet" type="text/css"
	href="./myhome.web.css/mypage_profile_1.css" />
<link rel="stylesheet" type="text/css"
	href="./myhome.web.css/mypage_profile_2.css" />



<script type="text/javascript" src="./myhome.web.js/MypageOrder.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript"
	src="./myhome.web.js/jquery-easing-1.3.pack.js"></script>
<script type="text/javascript"
	src="./myhome.web.js/jquery-easing-compatibility.1.2.pack.js"></script>
<script type="text/javascript"
	src="./myhome.web.js/coda-slider.1.1.1.pack.js"></script>
<script src="./myhome.web.js/teamTopnav.js"></script>

<script type="text/javascript">
	var theInt = null;
	var $crosslink, $navthumb;
	var curclicked = 0;

	theInterval = function(cur) {
		clearInterval(theInt);

		if (typeof cur != "undefined")
			curclicked = cur;

		$crosslink.removeClass("active-thumb");
		$navthumb.eq(curclicked).parent().addClass("active-thumb");
		$(".stripNav ul li a").eq(curclicked).trigger("click");

		theInt = setInterval(function() {
			$crosslink.removeClass("active-thumb");
			$navthumb.eq(curclicked).parent().addClass("active-thumb");
			$(".stripNav ul li a").eq(curclicked).trigger("click");
			curclicked++;
			if (4 == curclicked)
				curclicked = 0;
		}, 3000);
	};

	$(function() {
		$("#main-photo-slider").codaSlider();

		$navthumb = $(".nav-thumb");
		$crosslink = $(".cross-link");

		$navthumb.click(function() {
			var $this = $(this);
			theInterval($this.parent().attr("href").slice(1) - 1);
			return false;
		});

		theInterval();
	});
</script>

<title>MYpage</title>
</head>
<body>
	<%
		ArrayList<Integer> articleCount = null;
		articleCount = (ArrayList<Integer>) request.getAttribute("articleCount");
	%>
	<!-- 게시판 등록 -->

	<form id="contentPage">
		<header>
			<div id="h_wrap">
				<div class="h_div">

					<h1>자취해보자</h1>
				</div>

				<%
					String us_id = null;
					us_id = (String) session.getAttribute("us_id"); //로그인 유무 확인
					if (us_id == null) {
				%>
				<ul class="login_go">
					<li><a href="LoginFormpage.bo">로그인</a></li>
					<li><span> | </span></li>
					<li><a href="join.bo">회원가입</a></li>
				</ul>


				<%
					} else {
				%>
				<ul class="login_go">
					<li><span></span></li>
					<li><a href="MypageProfile.bo">마이페이지</a></li>
					<li><span> | </span></li>
					<li><a href="logoutActionPage.jsp">로그아웃</a></li>
				</ul>



				<%
					}
				%>
				<div id="main_nav">
					<ul>
						<li><a href="Index.jsp"><span>홈</span></a></li>
						<li><a href="storeList.bo"><span>스토어</span></a></li>
						<li><a href="beauty.bo"><span>커뮤니티</span></a></li>
						<li><a href="#"><span>자취에대한 모든것</span></a></li>

						<li><a href="#"><span>고객센터</span></a></li>
					</ul>
				</div>

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

		<main> <header class="container collection-book-header">
			<h1 class="collection-book-title__book-name">스크랩북</h1>
			<p class="collection-book-owner">
				<a class="collection-book-owner__link" href="/users/8659285"><img
					class="profile-image"
					src="https://image.ohou.se/i/bucketplace-v2-development/uploads/users/profile_images/1591064955_kakao_1372291789.jpg?gif=1&amp;w=36&amp;h=36&amp;c=c&amp;webp=1"
					srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/users/profile_images/1591064955_kakao_1372291789.jpg?gif=1&amp;w=72&amp;h=72&amp;c=c&amp;webp=1 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/users/profile_images/1591064955_kakao_1372291789.jpg?gif=1&amp;w=72&amp;h=72&amp;c=c&amp;webp=1 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/users/profile_images/1591064955_kakao_1372291789.jpg?gif=1&amp;w=144&amp;h=144&amp;c=c&amp;webp=1 3x"><span
					class="collection-book-owner__name">가가가가가가2</span></a>
			</p>
			<div class="collection-book-actions">
				<div class="drop-down">
					<a><svg class="collection-book-actions__share-icon" width="24"
							height="24" viewBox="0 0 24 24" fill="currentColor"
							preserveAspectRatio="xMidYMid meet">
								<path
								d="M9.64 14.646a4.5 4.5 0 1 1 0-5.292l4.54-2.476a4.5 4.5 0 1 1 .63.795l-4.675 2.55c.235.545.365 1.146.365 1.777s-.13 1.232-.365 1.777l4.675 2.55a4.5 4.5 0 1 1-.63.795l-4.54-2.476zM18 8a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7zM6 15.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7zM18 23a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7z"></path></svg></a>
				</div>
			</div>
		</header>
		<nav class="page-navigation collection-book-nav">
			<ul style="transform: translateX(0px);">
				<li class="page-navigation__item"><a class="active"
					href="/users/8659285/collections" target="_self">모두 (4)</a></li>
				<li class="page-navigation__item"><a class=""
					href="/users/8659285/collections?filter=production" target="_self">상품
						(3)</a></li>
				<li class="page-navigation__item"><a class=""
					href="/users/8659285/collections?filter=card" target="_self">사진
						(1)</a></li>
			</ul>
		</nav>
		<div class="container">
			<section class="collection-feed-filter row">
				<div class="collection-feed-filter__empty"></div>
			</section>
			<div class="virtualized-list collection-feed-collections row"
				style="padding-top: 0px; padding-bottom: 0px; transform: translateY(0px);">
				<div class="col-6 col-md-4 col-lg-3">
					<a
						href="/productions/475132/selling?affect_type=UserScrapbook&amp;affect_id=8659285">
						<div class="collection collection--total">
							<div class="collection__image-wrap">
								<img class="collection__image"
									src="https://image.ohou.se/i/bucketplace-v2-development/uploads/deals/159955303371693671.jpg?gif=1&amp;w=320&amp;h=320&amp;c=c&amp;webp=1">
							</div>
							<span class="collection__type">상품</span>
						</div></a>
				</div>
			</div>
		</div>
		</main>
		<footer>
			<div></div>
		</footer>
	</form>

</body>
</html>
