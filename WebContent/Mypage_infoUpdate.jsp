<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.jachi.DTO.TipDTO"%>
<%@ page import="com.jachi.DTO.QnABBS"%>
<%@ page import="com.jachi.DTO.UserinfoDTO"%>
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
		ArrayList<UserinfoDTO> userinfo = null;
		userinfo = (ArrayList<UserinfoDTO>) request.getAttribute("userinfoDTO");
		String[] userMailAll = userinfo.get(0).getUs_mail().split("@");
		String mailId = userMailAll[0];
		String mailAddr = userMailAll[1];
		String us_nickname = userinfo.get(0).getUs_nkname();
		String us_birth = userinfo.get(0).getUs_birth();
		String us_tel = userinfo.get(0).getUs_tel();
		String us_proimg = userinfo.get(0).getUs_pic();
	%>
	<!-- 게시판 등록 -->

	<form id="contentPage" action="mypage_userinfo_update.bo" method="post" enctype="multipart/form-data" autocomplete="off">
		<!-- Header include -->
	<jsp:include page="HeaderTestjsp.jsp"></jsp:include>

		<div id="m_wrap">
			<main>
			<div class="MyPage_container">
				<jsp:include page="include_Mypage_infoUpdateNav.jsp"></jsp:include>
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
												class="form-control" value="<%=mailId%>" placeholder="이메일" name="email1"
												size="1"></span><span class="email-input__separator">@</span><span
												class="email-input__domain"><input
												class="form-control" value="<%=mailAddr%>" name="email2"
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
											<input value="<%=us_nickname%>" class="form-control" name="us_nkname">
											<div class="edit-user-info__input__error"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="edit-user-info__form-item">
						<div class="edit-user-info__form-item__title">전화번호</div>
						<div class="expert-form-group edit-user-info__form-item__group">
							<div class="expert-form-group__content">
								<div class="expert-form-group__input">
									<div class="edit-user-info__form-item__field">
										<input placeholder="010-xxxx-xxxx" value="<%=us_tel%>"
											class="form-control" name="us_tel">
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
											<input value="<%=us_birth%>" placeholder="날짜를 입력해주세요"
												class="form-control date-input__text" name="us_birth">
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
												<li class="image-single-input__entry">
												<input type="file" id="imgSelector" name="profile_img">
												<img class="image-single-input__entry__button" id="preview" src="<%=request.getContextPath()%>/upload/<%=us_proimg%>">
												</li>
											</ul>
										</div>

										<script>
											$('#imgSelector').change(
													function() {
														setImageFromFile(this,
																'#preview');
													});

											function setImageFromFile(input,
													expression) {
												if (input.files
														&& input.files[0]) {
													var reader = new FileReader();
													reader.onload = function(e) {
														$(expression)
																.attr(
																		'src',
																		e.target.result);
													}
													reader
															.readAsDataURL(input.files[0]);
												}
											}
										</script>

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
