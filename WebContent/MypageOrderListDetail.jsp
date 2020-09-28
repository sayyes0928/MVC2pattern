<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.jachi.DTO.TipDTO"%>
<%@ page import="com.jachi.DTO.QnABBS"%>
<%@ page import="com.jachi.DTO.UserinfoDTO"%>
<%@ page import="com.jachi.DTO.OrderDTO"%>
<%@ page import="com.jachi.DTO.ProductinfoDTO"%>
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

<title>MYpage</title>
</head>
<body>

	<%
		ArrayList<OrderDTO> orderList_Receipt = (ArrayList<OrderDTO>) request.getAttribute("orderList_Receipt");
		ArrayList<ProductinfoDTO> productInfo = (ArrayList<ProductinfoDTO>) request.getAttribute("productInfo");
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
						<div class="subtitle">주문번호 : <%= orderList_Receipt.get(0).getOdr_code()%> | 주문일자 : <%= orderList_Receipt.get(0).getOdr_date() %></div>

						<div class="table">
							<div class="order_list">
								<div class="product_image">
									<div class="image" style="background-image: url('<%=request.getContextPath()%>/upload/<%= productInfo.get(0).getPro_mainimg()%>')">
									</div>
								</div>

								<div class="product_detail">
									<a class="name" target="_blank"
										href="/productions/310706/selling"><%= orderList_Receipt.get(0).getOdr_proname()%></a>

									<div class="option">색상: 03_베이지 / 사이즈: 100x150</div>



									<div class="cost"><%= orderList_Receipt.get(0).getOdr_price()%>원</div>
									<div class="count">|1개</div>

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
								<div class="content emphasis"><%= orderList_Receipt.get(0).getOdr_price()%>원</div>
							</div>
						</div>
					</div>
					<!-- finish vbank_info -->

					<div id="payment_info">
						<div class="subtitle">결제 정보</div>

						<div class="wrap_panel divide one">
							<div class="field">
								<div class="title">상품금액</div>
								<div class="content"><%= orderList_Receipt.get(0).getOdr_price()%>원</div>
							</div>
							<div class="field">
								<div class="title">할인금액</div>
								<div class="content">(-) 0원</div>
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
								<div class="content emphasis"><%= orderList_Receipt.get(0).getOdr_price()%>원</div>
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
									<%= orderList_Receipt.get(0).getOdr_name()%> (닉네임: <%= orderList_Receipt.get(0).getOdr_id()%>)
								</div>
							</div>
							<div class="field">
								<div class="title">연락처</div>
								<div class="personal"><%= orderList_Receipt.get(0).getOdr_tel()%></div>
							</div>
							<div class="field">
								<div class="title">이메일</div>
								<div class="personal"><%= orderList_Receipt.get(0).getOdr_mail()%></div>
							</div>
						</div>
					</div>
					<!-- finish payment_info -->

					<div id="delivery_info">
						<div class="subtitle">배송지 정보</div>

						<div class="wrap_panel">
							<div class="field">
								<div class="title">수령인</div>
								<div class="content"><%= orderList_Receipt.get(0).getOdr_name()%></div>
							</div>
							<div class="field">
								<div class="title">연락처</div>
								<div class="content"><%= orderList_Receipt.get(0).getOdr_tel()%></div>
							</div>
							<div class="field">
								<div class="title">주소</div>
								<div class="content"><%= orderList_Receipt.get(0).getOdr_adr()%></div>
							</div>
							<div class="field">
								<div class="title">배송메모</div>
								<div class="content">
									<div class="memo"><%= orderList_Receipt.get(0).getOdr_memo()%></div>
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
