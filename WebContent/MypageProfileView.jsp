<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.jachi.DTO.TipDTO"%>
<%@ page import="com.jachi.DTO.QnABBS"%>

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
	href="./myhome.web.css/mypage_profile_1.css" />
<link rel="stylesheet" type="text/css"
	href="./myhome.web.css/mypage_profile_2.css" />
<link rel="stylesheet" type="text/css"
	href="./myhome.web.css/scrapbook_1.css" />
<link rel="stylesheet" type="text/css"
	href="./myhome.web.css/scrapbook_2.css" />



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
	<%
		ArrayList<QnABBS> qnaList = (ArrayList<QnABBS>) request.getAttribute("qnaList");
		ArrayList<TipDTO> tipList = (ArrayList<TipDTO>) request.getAttribute("tipList");
		ArrayList<TipDTO> postList = (ArrayList<TipDTO>) request.getAttribute("postList");
	%>
	<!-- 게시판 등록 -->

	<form id="contentPage">
			 <jsp:include page="includHeader.jsp"></jsp:include>

		<div id="m_wrap">
			<main>
			<div class="MyPage_container">
							
				<jsp:include page="include_Mypage_ProfileNav.jsp"></jsp:include>
			</div>

			<!--                            ////////////////////////////// -->

			<div class="container">
				<div class="row">
					<div class="col-12 col-lg-3 wrap--profile">
						<div data-sticky-enabled="false" data-sticky-always="false"
							data-direction="top" data-offset="81" class="sticky-container"
							style="">
							<div class="sticky-child" style="position: relative">
								<div class="user-profile">
									<div class="user-profile__share">
										<button type="button">
											<span class="icon--common-action"
												style="background-position-x: -360px; background-position-y: -280px; width: 24px; height: 24px"></span>
										</button>
										<div class="share-tooltip--normal-user-show">
											<div class="share-tooltip__tooltip"
												style="right: 0; top: 100%; transition: opacity .3s ease, transform .3s ease, visibility 0s .3s; opacity: 0; transform: translateY(-16px); visibility: hidden">
												<a class="share-tooltip__btn-share"
													href="https://www.facebook.com/sharer.php?u=https://ozip.me/xVephYm"
													target="_blank" rel="noopener noreferrer"><span
													class="icon icon-sns-square-facebook"></span></a>
												<button class="share-tooltip__btn-share">
													<span class="icon icon-sns-square-kakao-story"></span>
												</button>
												<a class="share-tooltip__btn-share"
													href="http://share.naver.com/web/shareView.nhn?url=https://ozip.me/xVephYm&amp;title=가가가가가가2님의 유저홈에 놀러오세요!"
													target="_blank" rel="noopener noreferrer"><span
													class="icon icon-sns-square-naver"></span></a>
											</div>
										</div>
									</div>
									<div class="user-profile__container">
										<div class="user-profile__profile-image">
											<img
												src="https://image.ohou.se/i/bucketplace-v2-development/uploads/users/profile_images/1591064955_kakao_1372291789.jpg?gif=1&amp;w=144&amp;h=144&amp;c=c&amp;webp=1"
												srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/users/profile_images/1591064955_kakao_1372291789.jpg?gif=1&amp;w=240&amp;h=240&amp;c=c&amp;webp=1 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/users/profile_images/1591064955_kakao_1372291789.jpg?gif=1&amp;w=320&amp;h=320&amp;c=c&amp;webp=1 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/users/profile_images/1591064955_kakao_1372291789.jpg?gif=1&amp;w=480&amp;h=480&amp;c=c&amp;webp=1 3x">
										</div>
										<div class="profile-info">
											<div class="profile-info__name">
												<span>가가가가가가2</span>
											</div>
											<div class="profile-info__follow-state">
												<div class="profile-info__follow-state__text">
													<a href="/users/8659285/follower">팔로워 <span
														class="highlight">0</span></a>
												</div>
												<div class="profile-info__follow-state__vertical-bar"></div>
												<div class="profile-info__follow-state__text">
													<a href="/users/8659285/followee">팔로잉 <span
														class="highlight">0</span></a>
												</div>
											</div>
											<div class="profile-info__actions">
												<a class="profile-info__btn" href="mypage_profile_userinfo_update.bo">설정</a><a
													class="profile-info__btn profile-info__btn--primary profile-info--hide-on-pc"
													href="/invite_codes/recommend_code">친구 초대 <span
													class="highlight">+5,000P</span></a>
											</div>
										</div>
									</div>
									<div class="user-profile__links">
										<div class="short-cut">
											<div class="short-cut__item">
												<a href="Myscrapbook.jsp"><div class="short-cut__icon">
														<svg width="24" height="24" viewBox="0 0 24 24"
															fill="currentColor" preserveAspectRatio="xMidYMid meet">
																<path fill-rule="evenodd"
																transform="matrix(1 0 0 -1 0 23.033)"
																d="M12.943 6.342a2 2 0 0 1-1.886 0L3 2.032V20.5a.5.5 0 0 0 .5.5h17a.5.5 0 0 0 .5-.5V2.033l-8.057 4.309zm-.471-.882l8.056-4.31A1 1 0 0 1 22 2.034V20.5a1.5 1.5 0 0 1-1.5 1.5h-17A1.5 1.5 0 0 1 2 20.5V2.033a1 1 0 0 1 1.472-.882l8.056 4.31a1 1 0 0 0 .944 0z"></path></svg>
													</div>
													<div class="short-cut__text">스크랩북</div>
													<div class="short-cut__text">
														<b class="highlight">2</b>
													</div></a>
											</div>
											<div class="short-cut__item">
												<a href="/users/8659285/praises"><div
														class="short-cut__icon">
														<svg width="24" height="24" viewBox="0 0 24 24"
															preserveAspectRatio="xMidYMid meet">
																<path fill="currentColor"
																d="M22.971 7.638c-.548-5.17-7.119-7.135-10.57-2.488a.5.5 0 0 1-.802 0C8.148.503 1.577 2.469 1.029 7.625.642 12.451 3.897 17.183 12 21.436c8.104-4.252 11.36-8.984 10.972-13.798zm.996-.093c.428 5.319-3.137 10.446-11.738 14.899a.5.5 0 0 1-.46 0C3.169 17.99-.395 12.864.034 7.532.656 1.67 7.904-.683 12 4.052 16.096-.683 23.344 1.67 23.967 7.545z"></path></svg>
													</div>
													<div class="short-cut__text">좋아요</div>
													<div class="short-cut__text">
														<b class="highlight">0</b>
													</div></a>
											</div>
											<div class="short-cut__item">
												<a href="/user_shopping_pages/coupons"><div
														class="short-cut__icon">
														<svg width="24" height="24" viewBox="0 0 24 24"
															preserveAspectRatio="xMidYMid meet">
																<path fill="#424242" fill-rule="nonzero"
																d="M22.588 3H1.413C.633 3 0 3.638 0 4.426L0 9.53l.605-.088c.12-.017.243-.026.367-.026 1.413 0 2.558 1.157 2.558 2.584S2.385 14.584.972 14.584c-.124 0-.247-.009-.367-.026L0 14.47l.001 5.104C.001 20.362.633 21 1.413 21h21.175c.78 0 1.412-.638 1.412-1.426V4.426C24 3.638 23.368 3 22.588 3zM1.413 4.07h21.175c.195 0 .353.159.353.356v15.148c0 .197-.158.357-.353.357H1.413l-.071-.008c-.161-.033-.282-.176-.282-.349l-.002-3.923-.086.002c1.997 0 3.617-1.635 3.617-3.653l-.004-.182C4.493 9.945 3.006 8.443 1.152 8.35l-.094-.003.002-3.922c0-.197.158-.357.353-.357zm14.646 2.138c.293 0 .53.237.53.53v1.614c0 .292-.237.53-.53.53-.292 0-.53-.238-.53-.53V6.737c0-.292.238-.53.53-.53zm0 4.455c.293 0 .53.237.53.53v1.614c0 .293-.237.53-.53.53-.292 0-.53-.237-.53-.53v-1.614c0-.293.238-.53.53-.53zm0 4.456c.293 0 .53.237.53.53v1.614c0 .292-.237.53-.53.53-.292 0-.53-.238-.53-.53v-1.615c0-.292.238-.53.53-.53z"></path></svg>
													</div>
													<div class="short-cut__text">내 쿠폰</div>
													<div class="short-cut__text">
														<b class="highlight">0</b>
													</div></a>
											</div>
										</div>
									</div>
								</div>
								<div
									class="profile-info__footer profile-info--hide-on-otherwise">
									<a
										class="profile-info__btn profile-info__btn--primary profile-info__btn--large"
										href="/invite_codes/recommend_code">친구 초대하고 <span
										class="highlight">5,000P</span> 받기<svg width="1em"
											height="1em" viewBox="0 0 24 24"
											preserveAspectRatio="xMidYMid meet">
												<path fill="currentColor" fill-rule="nonzero"
												d="M6 19.692L8.25 22 18 12 8.25 2 6 4.308 13.5 12z"></path></svg></a>
								</div>
							</div>
						</div>
					</div>

					<div class="horizontal-line"></div>
					<div class="col-12 offset-lg-1 col-lg-8 wrap--contents">
						<div class="contents">
							<section class="post post--cards">
								<h5 class="post__title">
									사진 <strong><%=postList.size()%></strong>
								</h5>
								<div class="container">

									<%
										if (postList.size() != 0) {
									%>
									<section class="collection-feed-filter row">
										<div class="collection-feed-filter__empty"></div>
									</section>
									<div class="virtualized-list collection-feed-collections row"
										style="padding-top: 0px; padding-bottom: 0px; transform: translateY(0px);">
										<%
											for (int i = 0; i < 4; i++) {
										%>
										<div class="col-6 col-md-4 col-lg-3">
											<a
												href="/productions/475132/selling?affect_type=UserScrapbook&amp;affect_id=8659285">
												<div class="collection collection--total">
													<div class="collection__image-wrap">
														<img class="collection__image"
															src="https://image.ohou.se/i/bucketplace-v2-development/uploads/deals/159955303371693671.jpg?gif=1&amp;w=320&amp;h=320&amp;c=c&amp;webp=1">
													</div>
													<span class="collection__type">상품</span>
												</div>
											</a>
										</div>
										<%
											}
										%>

									</div>
									<%
										}else {
									%>
									<a class="post__upload post--cards__upload"
										href="Beautyroom_write.bo"> <span
										class="icon--page-mypage"
										style="margin-right: 5px; background-position-x: -0px; background-position-y: -200px; width: 12px; height: 12px"></span>
										첫 번째 사진을 올려보세요
									</a>

									<%
										}
									%>

								</div>
							</section>
							<section class="post post--projects">
								<h5 class="post__title">
									내가 쓴 글들 <strong>0</strong>
								</h5>
								<div class="mypost_preview_container">
									<div class="mypost_preview">
										<ul>
											<li class="mypost_preview_title"><h5>QnA글 목록</h5></li>
											<%
												if (qnaList != null) {
													for (int i = 0; i < qnaList.size(); i++) {
											%>
											<li class="mypost_preview_contents"><a href="qna_detail.bo?getnum=<%= qnaList.get(i).getQna_num()%>"><%=qnaList.get(i).getQna_title()%></a></li>
											<%
												}
												} else {
											%>
											<li class="mypost_preview_contents">등록된 글이 없습니다.</li>
											<%
												}
											%>

										</ul>
									</div>
									<div class="mypost_preview">
										<ul>
											<li class="mypost_preview_title"><h5>Tip글 목록</h5></li>
											<%
												if (tipList != null) {
													for (int i = 0; i < tipList.size(); i++) {
											%>
											<li class="mypost_preview_contents"><a href="#"><%=tipList.get(i).getTip_title()%></a></li>
											<%
												}
												} else {
											%>
											<li class="mypost_preview_contents">등록된 글이 없습니다.</li>
											<%
												}
											%>
										</ul>
									</div>
								</div>
							</section>
						</div>
					</div>
				</div>
			</div>
		</div>
		</main>
		</div>
	<jsp:include page="include_footer.jsp"></jsp:include>
	</form>

</body>
</html>
