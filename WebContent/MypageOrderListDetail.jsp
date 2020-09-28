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
	href="./myhome.web.css/MypageOrderListDetail1.css" />
<link rel="stylesheet" type="text/css"
	href="./myhome.web.css/MypageOrderListDetail2.css" />
<link rel="stylesheet" type="text/css"
	href="./myhome.web.css/MypageOrderListDetail3.css" />
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
		ArrayList<UserinfoDTO> userinfoDTO = (ArrayList<UserinfoDTO>) request.getAttribute("userinfoDTO");
		ArrayList<QnABBS> qnaList = (ArrayList<QnABBS>) request.getAttribute("qnaList");
		ArrayList<TipDTO> tipList = (ArrayList<TipDTO>) request.getAttribute("tipList");
		ArrayList<TipDTO> postList = (ArrayList<TipDTO>) request.getAttribute("postList");
		Integer countLike = (Integer) request.getAttribute("countLike");
		Integer ountScrap = (Integer) request.getAttribute("ountScrap");
	%>
	<!-- 게시판 등록 -->

	<form id="contentPage">
		<!-- Header include -->
		<jsp:include page="HeaderTestjsp.jsp"></jsp:include>

		<div id="m_wrap">
			<main>
			<div id="body" class="orders show"
				data-s_id="885bc950860277a822c755131bfe1278"
				style="padding-bottom: 0px;">
				<script>
					sessionStorage["share_code"] = '';
					sessionStorage["beforeContentType"] = 'UserOrder';
					sessionStorage["beforeContentId"] = '';
				</script>


				<div class="contents">
					<div class="title">주문상세정보</div>
					<!-- finish title -->

					<div id="detail_info">
						<div class="subtitle">주문번호 : 33143923 | 주문일자 : 2020.09.28</div>

						<div class="table">
							<div class="order_list">
								<div class="product_image">
									<div class="image"
										style="background-image: url('https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-productions-159313467735207495.jpg/250/none')"></div>
								</div>

								<div class="product_detail">
									<a class="name" target="_blank"
										href="/productions/310706/selling">[스칸디앤홈] 헤링본 사이잘룩 라탄 러그
										카페트 4colors 4size</a>

									<div class="option">색상: 03_베이지 / 사이즈: 100x150</div>



									<div class="cost">16,900원</div>
									<div class="count">| 1개</div>

									<div class="status">
										입금대기 <span class="status__divider"></span>일반택배배송
									</div>
								</div>

								<div class="button_set">
									<div class="fake"></div>
									<div class="buttons">
										<a class="button" href="/orders/33143923/order_cancel">주문취소</a>



									</div>
								</div>
							</div>


							<div class="order_delivery">
								<div class="method">무료배송</div>
								<span class="brand"> Scandinhome 배송 </span> <a class="phone"
									href="tel:0260808802"> 02-6080-8802 </a>
							</div>
						</div>
					</div>
					<!-- finish detail_info -->

					<div id="vbank_info">
						<div class="subtitle">가상계좌정보</div>
						<div class="wrap_panel">
							<div class="field">
								<div class="title">은행명</div>
								<div class="content">우리은행</div>
							</div>
							<div class="field">
								<div class="title">계좌번호</div>
								<div class="content">27971423518092</div>
							</div>
							<div class="field">
								<div class="title">예금주</div>
								<div class="content">주식회사 버킷플레이스</div>
							</div>
							<div class="field">
								<div class="title">입금금액</div>
								<div class="content emphasis">16,900원</div>
							</div>
							<div class="field">
								<div class="title">기한</div>
								<div class="content">2020.10.03 까지</div>
							</div>
						</div>
					</div>
					<!-- finish vbank_info -->

					<div id="payment_info">
						<div class="subtitle">결제 정보</div>

						<div class="wrap_panel divide one">
							<div class="field">
								<div class="title">상품금액</div>
								<div class="content">90,000원</div>
							</div>
							<div class="field">
								<div class="title">할인금액</div>
								<div class="content">(-) 73,100원</div>
							</div>
							<div class="field">
								<div class="title">선불배송비</div>
								<div class="content">(+) 0원</div>
							</div>
							<div class="field">
								<div class="title">조립비</div>
								<div class="content">(+) 0원</div>
							</div>
							<div class="field">
								<div class="title">사용 포인트</div>
								<div class="content">(-) 0 P</div>
							</div>
							<div class="field">
								<div class="title">쿠폰 할인가</div>
								<div class="content">(-) 0 P</div>
							</div>
							<div class="field">
								<div class="title">결제금액</div>
								<div class="content emphasis">16,900원</div>
							</div>
							<div class="field">
								<div class="title">결제방법</div>
								<div class="content">
									가상계좌 <a target="_blank"
										href="https://npg.nicepay.co.kr/issue/IssueLoader.do?TID=bucketplam03012009281146284172&amp;type=0&amp;InnerWin=Y">(영수증)</a>
								</div>
							</div>
						</div>

						<div class="wrap_panel divide two">
							<div class="field">
								<div class="title">주문자</div>
								<div class="personal">
									노주영 (닉네임: <a target="_blank" href="/users/8659285">가가가가가가2</a>
									/ 회원번호: 8659285)
								</div>
							</div>
							<div class="field">
								<div class="title">연락처</div>
								<div class="personal">010-2636-2448</div>
							</div>
							<div class="field">
								<div class="title">이메일</div>
								<div class="personal">shwndud0928@gmail.com</div>
							</div>
						</div>
					</div>
					<!-- finish payment_info -->

					<div id="delivery_info">
						<div class="subtitle">배송지 정보</div>

						<div class="wrap_panel">
							<div class="field">
								<div class="title">수령인</div>
								<div class="content">노주영</div>
							</div>
							<div class="field">
								<div class="title">연락처</div>
								<div class="content">123-123</div>
							</div>
							<div class="field">
								<div class="title">주소</div>
								<div class="content">(08826) 서울 관악구 관악로 1 (신림동) 서울대학교 집</div>
							</div>
							<div class="field">
								<div class="title">배송메모</div>
								<div class="content">
									<div class="memo">부재시 경비실에 맡겨주세요.</div>
								</div>
							</div>
						</div>
					</div>
					<!-- finish delivery_info -->

				</div>

			</div>
			</main>
		</div>
		<jsp:include page="include_footer.jsp"></jsp:include>
	</form>

</body>
</html>
