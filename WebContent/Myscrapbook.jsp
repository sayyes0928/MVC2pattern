<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.jachi.DTO.BeautyRoomDTO"%>
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
		ArrayList<BeautyRoomDTO> bookmarkList = (ArrayList<BeautyRoomDTO>) request.getAttribute("bookmarkList");
	%>
	<!-- 게시판 등록 -->
	<form id="contentPage">
		<!-- Header include -->
		<jsp:include page="HeaderTestjsp.jsp"></jsp:include>


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
				<%
					if (bookmarkList.size() != 0) {
						for (int i = 0; i < bookmarkList.size(); i++) {
				%>




				<div class="col-6 col-md-4 col-lg-3">
					<a
						href="Beautyroom_Detail.bo?board_num=<%=bookmarkList.get(i).getPost_num()%>">
						<div class="collection collection--total">
							<div class="collection__image-wrap">
								<img class="collection__image"
									src="<%=request.getContextPath()%>/upload/<%=bookmarkList.get(i).getPost_pic()%>">
							</div>
							<span class="collection__type">상품 </span>
						</div>
					</a>
				</div>
				<%
					}

					}
				%>
			</div>
		</div>
		</main>
		<footer>
			<div></div>
		</footer>
	</form>

</body>
</html>
