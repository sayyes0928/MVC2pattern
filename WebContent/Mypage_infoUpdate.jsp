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
<link rel="stylesheet" type="text/css"
	href="./myhome.web.css/mypage_userinfoupdate.css" />
<link rel="stylesheet" type="text/css"
	href="./myhome.web.css/webapp_setiing.css" />



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
				<div class="wrap--nav">
					<div class="myhome-nav myhome-nav--owner">
						<nav class="page-navigation myhome-nav__owner">
							<ul style="transform: translateX(0px);">
								<li class="page-navigation__item"><a class=""
									href="MypageProfile.bo" target="_self">프로필</a></li>
								<li class="page-navigation__item"><a class=""
									href="/user_shopping_pages/order_list" target="_self">나의 쇼핑</a></li>
								<li class="page-navigation__item"><a class=""
									href="/production_reviews/write" target="_self">나의 리뷰</a></li>
								<li class="page-navigation__item"><a class="active"
									href="Mypage_infoUpdate.jsp" target="_self">설정</a></li>
							</ul>
						</nav>
						<nav class="page-navigation myhome-nav__contents">
							<ul style="transform: translateX(0px);">
								<li class="page-navigation__item"><a class="active"
									href="/users/8659285/edit" target="_self">회원정보수정</a></li>
								<li class="page-navigation__item"><a class=""
									href="https://pro.ohou.se/?utm_source=ohouse&amp;utm_medium=web&amp;utm_campaign=prosignup&amp;utm_content=myhome"
									target="_self">전문가 신청</a></li>
								<li class="page-navigation__item"><a class=""
									href="/users/8659285/edit_password" target="_self">비밀번호 변경</a></li>
								<li class="page-navigation__item"><a class=""
									href="/invite_codes/recommend_code" target="_self">추천코드</a></li>
							</ul>
						</nav>
					</div>
				</div>
			</div>

			<!--                            ////////////////////////////// -->

			<div class="edit-user-info__wrap container">
				<div class="edit-user-info__header">
					<div class="edit-user-info__header__title">회원정보수정</div>
					<a class="edit-user-info__header__withdrawals"
						href="/withdrawals/new">탈퇴하기</a>
				</div>
				<form>
					<div class="edit-user-info__form-item">
						<div class="edit-user-info__form-item__title">
							이메일
							<div class="edit-user-info__form-item__title__require">*
								필수항목</div>
						</div>
						<div class="expert-form-group edit-user-info__form-item__group">
							<div class="expert-form-group__content">
								<div class="expert-form-group__input">
									<div class="edit-user-info__form-item__field">
										<div class="input-group email-input">
											<span class="email-input__local"><input
												class="form-control" value="jsi0928" placeholder="이메일"
												size="1"></span><span class="email-input__separator">@</span><span
												class="email-input__domain"><input
												class="form-control" value="cyworld.com"
												placeholder="입력해주세요" size="1"></span>
										</div>
										<div class="edit-user-info__form-item__field__warning">이메일을
											변경하시려면 운영자에게 이메일을 보내주세요.</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="edit-user-info__form-item">
						<div class="edit-user-info__form-item__title">
							별명
							<div class="edit-user-info__form-item__title__require">*
								필수항목</div>
						</div>
						<div class="expert-form-group edit-user-info__form-item__group">
							<div class="expert-form-group__content">
								<div class="expert-form-group__input">
									<div class="edit-user-info__form-item__field">
										<div class="edit-user-info__input">
											<input value="가가가가가가2" class="form-control">
											<div class="edit-user-info__input__error"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="edit-user-info__form-item">
						<div class="edit-user-info__form-item__title">홈페이지</div>
						<div class="expert-form-group edit-user-info__form-item__group">
							<div class="expert-form-group__content">
								<div class="expert-form-group__input">
									<div class="edit-user-info__form-item__field">
										<input placeholder="https://ohou.se" value=""
											class="form-control">
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="edit-user-info__form-item">
						<div class="edit-user-info__form-item__title">성별</div>
						<div class="expert-form-group edit-user-info__form-item__group">
							<div class="expert-form-group__content">
								<div class="expert-form-group__input">
									<div
										class="edit-user-info__form-item__field edit-user-info__form-item__field--sex">
										<ul class="radio-group-input">
											<li><div class="form-radio">
													<label class="form-radio-label"><input type="radio" class="form-radio" name="gender"><span class="radio-img"></span>
													<span>남성</span>
													</label>
												</div></li>
											<li><div class="form-radio">
													<label class="form-radio-label">
													<input type="radio" class="form-radio" name="gender"><span class="radio-img"></span><span>여성</span></label>
												</div></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="edit-user-info__form-item">
						<div class="edit-user-info__form-item__title">생년월일</div>
						<div class="expert-form-group edit-user-info__form-item__group">
							<div class="expert-form-group__content">
								<div class="expert-form-group__input">
									<div class="edit-user-info__form-item__field">
										<div class="DayPickerInput">
											<input value="" placeholder="날짜를 선택해주세요"
												class="form-control date-input__text">
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="edit-user-info__form-item">
						<div class="edit-user-info__form-item__title">프로필 이미지</div>
						<div class="expert-form-group edit-user-info__form-item__group">
							<div class="expert-form-group__content">
								<div class="expert-form-group__input">
									<div
										class="edit-user-info__form-item__field edit-user-info__form-item__field--profile">
										<div class="image-single-input-wrap">
											<ul class="image-single-input">
												<li class="image-single-input__entry"><button
														class="image-single-input__entry__button" type="button">
														<img class="image-single-input__entry__image"
															src="https://image.ohou.se/i/bucketplace-v2-development/uploads/users/profile_images/1591064955_kakao_1372291789.jpg?gif=1&amp;w=640&amp;h=640&amp;c=c"
															srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/users/profile_images/1591064955_kakao_1372291789.jpg?gif=1&amp;w=960&amp;h=960&amp;c=c 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/users/profile_images/1591064955_kakao_1372291789.jpg?gif=1&amp;w=1280&amp;h=1280&amp;c=c 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/users/profile_images/1591064955_kakao_1372291789.jpg?gif=1&amp;w=1920&amp;h=1920&amp;c=c 3x">
													</button></li>
											</ul>
										</div>
										<button
											class="button button--color-blue button--size-30 button--shape-4 edit-user-info__form-item__delete"
											type="button">
											<svg viewBox="0 0 20 20" preserveAspectRatio="xMidYMid meet">
												<defs>
												<filter id="delete-a" width="134.3%" height="175%"
													x="-17.1%" y="-37.5%" filterUnits="objectBoundingBox">
												<feOffset in="SourceAlpha" result="shadowOffsetOuter1"></feOffset>
												<feGaussianBlur in="shadowOffsetOuter1"
													result="shadowBlurOuter1" stdDeviation="3"></feGaussianBlur>
												<feColorMatrix in="shadowBlurOuter1"
													result="shadowMatrixOuter1"
													values="0 0 0 0 0.182857143 0 0 0 0 0.205714286 0 0 0 0 0.22 0 0 0 0.2 0"></feColorMatrix>
												<feMerge>
												<feMergeNode in="shadowMatrixOuter1"></feMergeNode>
												<feMergeNode in="SourceGraphic"></feMergeNode></feMerge></filter>
												<path id="delete-b"
													d="M11 3.83v10c0 .92-.75 1.67-1.67 1.67H2.67c-.92 0-1.67-.75-1.67-1.67v-10h10zM8.08.5l.84.83h2.91V3H.17V1.33h2.91L3.92.5h4.16z"></path></defs>
												<g fill="none" fill-rule="evenodd" filter="url(#delete-a)"
													transform="translate(4 2)">
												<mask id="delete-c" fill="#fff">
												<use xlink:href="#delete-b"></use></mask>
												<g fill="#FFF" mask="url(#delete-c)">
												<path d="M-4-2h20v20H-4z"></path></g></g></svg>
											삭제
										</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="edit-user-info__form-item">
						<div class="edit-user-info__form-item__title">한줄 소개</div>
						<div class="expert-form-group edit-user-info__form-item__group">
							<div class="expert-form-group__content">
								<div class="expert-form-group__input">
									<div class="edit-user-info__form-item__field">
										<input maxlength="41" value="" class="form-control">
									</div>
								</div>
							</div>
						</div>
					</div>
					<button
						class="button button--color-blue button--size-50 button--shape-4 edit-user-info__submit"
						type="submit">회원 정보 수정</button>
				</form>
			</div>
		</div>
		</main>
		</div>
		<footer>
			<div></div>
		</footer>
	</form>

</body>
</html>
