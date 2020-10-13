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
<link rel="stylesheet" type="text/css"
	href="./myhome.web.css/scrapbook_1.css" />



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
		ArrayList<Integer> articleCount = null;
		articleCount = (ArrayList<Integer>) request.getAttribute("articleCount");
	%>
	<!-- 게시판 등록 -->

	<form id="contentPage">
		<!-- Header include -->
		<jsp:include page="HeaderTestjsp.jsp"></jsp:include>


		<div id="m_wrap">
			<main>
			<div class="MyPage_container">
				<jsp:include page="include_Mypage_OrderViewNav.jsp"></jsp:include>
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
						<td class="MyPage_container_selectlist_deliveryStatus">배송상태</td>
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

						<td><a
							href="MypageOrderListDetailView.bo?delivery_code=<%=orderList.get(i).getList_code()%>&delivery_status=<%=orderList.get(i).getList_delStatus()%>"><%=orderList.get(i).getList_code()%></a></td>
						<td><%=orderList.get(i).getList_name()%></td>
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
			</main>
		</div>
		<jsp:include page="include_footer.jsp"></jsp:include>
	</form>

</body>
</html>
