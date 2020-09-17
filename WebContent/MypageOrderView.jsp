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
					<li><a href="MypageOrderView.bo">마이페이지</a></li>
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

		<div id="m_wrap">
			<main>
			<div class="MyPage_container">
				<div class="wrap--nav">
					<div class="myhome-nav myhome-nav--owner">
						<nav class="page-navigation myhome-nav__owner">
							<ul style="transform: translateX(0px);">
								<li class="page-navigation__item"><a class=""
									href="MypageProfile.bo" target="_self">프로필</a></li>
								<li class="page-navigation__item"><a class="active"
									href="/user_shopping_pages/order_list" target="_self">나의 쇼핑</a></li>
								<li class="page-navigation__item"><a class=""
									href="/production_reviews/write" target="_self">나의 리뷰</a></li>
								<li class="page-navigation__item"><a class=""
									href="/users/8659285/edit" target="_self">설정</a></li>
							</ul>
						</nav>
						<nav class="page-navigation myhome-nav__contents">
							<ul style="transform: translateX(0px);">
								<li class="page-navigation__item"><a class="active"
									href="/user_shopping_pages/order_list" target="_self">주문배송내역
										조회</a></li>
								<li class="page-navigation__item"><a class=""
									href="Myscrapbook.jsp"
									target="_self">상품 스크랩북</a></li>
								<li class="page-navigation__item"><a class=""
									href="/user_shopping_pages/questions" target="_self">상품문의내역</a></li>
								<li class="page-navigation__item"><a class=""
									href="/user_shopping_pages/mileages" target="_self">포인트</a></li>
								<li class="page-navigation__item"><a class=""
									href="/contact_us" target="_self">고객센터</a></li>
							</ul>
						</nav>
					</div>
				</div>
				<!--                            ////////////////////////////// -->
				<div class="order-list__menu">
					<a class="order-list__menu__list"
						href="MypageOrderListView.bo?status=1">
						<div class="order-list__menu__list__wrap">
							<div class="order-list__menu__list__title">입금대기</div>
							<div class="order-list__menu__list__value"><%=articleCount.get(0)%></div>
						</div>
					</a> <a class="order-list__menu__list"
						href="MypageOrderListView.bo?status=2">
						<div class="order-list__menu__list__wrap">
							<div class="order-list__menu__list__title">결제완료</div>
							<div class="order-list__menu__list__value"><%=articleCount.get(1)%></div>
						</div>
					</a> <a class="order-list__menu__list"
						href="MypageOrderListView.bo?status=3">
						<div class="order-list__menu__list__wrap">
							<div class="order-list__menu__list__title">배송준비</div>
							<div class="order-list__menu__list__value"><%=articleCount.get(2)%></div>
						</div>
					</a> <a class="order-list__menu__list"
						href="MypageOrderListView.bo?status=4">
						<div class="order-list__menu__list__wrap">
							<div class="order-list__menu__list__title">배송중</div>
							<div class="order-list__menu__list__value"><%=articleCount.get(3)%></div>
						</div>
					</a> <a class="order-list__menu__list"
						href="MypageOrderListView.bo?status=5">
						<div class="order-list__menu__list__wrap">
							<div class="order-list__menu__list__title">배송완료</div>
							<div class="order-list__menu__list__value"><%=articleCount.get(4)%></div>
						</div>
					</a> <a class="order-list__menu__list"
						href="MypageOrderListView.bo?status=6">
						<div class="order-list__menu__list__wrap">
							<div class="order-list__menu__list__title">구매확정</div>
							<div class="order-list__menu__list__value"><%=articleCount.get(5)%></div>
						</div>
					</a>
				</div>

				<!-- ///////////////////////////////////조회내역///////////////////////////////// -->
				<div class="MyPage_container_selectlist">
					<table>
						<tr>
							<td class="MyPage_container_selectlist_orderDate">주문번호</td>
							<td class="MyPage_container_selectlist_productName">제품명</td>
							<td class="MyPage_container_selectlist_deliveryNumber">송장번호</td>
							<td class="MyPage_container_selectlist_deliveryCompany">택배사</td>
							<td class="MyPage_container_selectlist_productPrice">가격</td>
						</tr>
						<%
							ArrayList<OrderListDTO> orderList = (ArrayList<OrderListDTO>) request.getAttribute("orderList_status");

							if (orderList != null) {
								for (int i = 0; i < orderList.size(); i++) {
						%>
						<tr>
							<td><%=orderList.get(i).getList_code()%></td>
							<td><%=orderList.get(i).getList_delStatus()%></td>
							<td><%=orderList.get(i).getList_delNum()%></td>
							<td><%=orderList.get(i).getList_company()%></td>
							<td><%=orderList.get(i).getCal_price()%></td>
						</tr>
						<%
							}
							}
						%>
					</table>

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
