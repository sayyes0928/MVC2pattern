<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.jachi.DTO.BeautyRoomDTO"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />


<link rel="stylesheet" type="text/css"
	href="./myhome.web.css/MyCart_List.css" />
<link rel="stylesheet" type="text/css"
	href="./myhome.web.css/MyCart_List2.css" />
<link rel="stylesheet" type="text/css"
	href="./myhome.web.css/MyCart_List3.css" />
<link rel="stylesheet" type="text/css"
	href="./myhome.web.css/heartbtn.css" />
<link rel="stylesheet" type="text/css"
	href="./myhome.web.css/bookmark.css" />
<link rel="stylesheet" type="text/css"
	href="./myhome.web.css/teamTopNav.css" />
<link rel="stylesheet" type="text/css"
	href="./myhome.web.css/styleSlider.css" />




<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="./myhome.web.js/MyhomeDtail.js"></script>
<script src="./myhome.web.js/teamTopnav.js"></script>

<!--  <script type="text/javascript" src="./myhome.web.js/jquery-easing-1.3.pack.js"></script>-->
<!--  <script type="text/javascript" src="./myhome.web.js/jquery-easing-compatibility.1.2.pack.js"></script>-->
<!-- <script type="text/javascript" src="./myhome.web.js/coda-slider.1.1.1.pack.js"></script> -->


<title>MVC 게시판</title>
<style type="text/css">
</style>
</head>
<body>
	<!-- 게시판 등록 -->


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
</div>

	</header>



	<div class="commerce-cart-wrap">
		<div class="container">
			<div class="commerce-cart row">
				<div class="commerce-cart__content-wrap col-12 col-md-7 col-lg-8">
					<div class="commerce-cart__content">
						<div data-sticky-enabled="false" data-sticky-always="false"
							data-direction="top" data-offset="0"
							class="sticky-container commerce-cart__header-wrap" style="">
							<div class="sticky-child commerce-cart__header"
								style="position: relative;">
								<span class="commerce-cart__header__left"><label
									class="_3xqzr _4VN_z"><div class="_3zqA8">
											<input type="checkbox" class="_3UImz" value=""><span
												class="_2mDYR"><svg width="1em" height="1em"
													viewBox="0 0 16 16" class="_2UftR">
														<path fill="currentColor"
														d="M6.185 10.247l7.079-7.297 1.435 1.393-8.443 8.703L1.3 8.432l1.363-1.464z"></path></svg></span>
										</div> <span class="_1aN3J"><span
											class="commerce-cart__header__caption">모두선택</span></span></label></span><span
									class="commerce-cart__header__right"><button
										class="commerce-cart__header__delete" type="button">선택삭제</button></span>
							</div>
						</div>
						<ul class="commerce-cart__content__group-list">
							<li class="commerce-cart__content__group-item"><article
									class="commerce-cart__group">
									<h1 class="commerce-cart__group__header"></h1>
									<ul class="commerce-cart__group__item-list">
										<li class="commerce-cart__group__item"><article
												class="commerce-cart__delivery-group">
												<ul class="commerce-cart__delivery-group__product-list">
                                 <% 
                                   ArrayList<String[]> Cart = (ArrayList<String[]>)session.getAttribute("cart"); 
                                   if(Cart != null){
                                 for(int i = 0; i < Cart.size(); i++){
                                	  
                                	  int count = Integer.parseInt(Cart.get(i)[1].toString());
                                	  int price = Integer.parseInt(Cart.get(i)[2].toString());
                                 %>
													<li class="commerce-cart__delivery-group__product-item">
													<article class="carted-product">
															<div class="carted-product__select">
																<div class="_3zqA8">
																	<input type="checkbox" class="_3UImz" value="" checked=""><span class="_2mDYR">
																		<svg width="1em" height="1em" viewBox="0 0 16 16" class="_2UftR">
												<path fill="currentColor" d="M6.185 10.247l7.079-7.297 1.435 1.393-8.443 8.703L1.3 8.432l1.363-1.464z"></path></svg></span>
																</div>
															</div>
															<a
																class="product-small-item product-small-item--clickable"
																href="/productions/430554/selling">
																<div class="product-small-item__image">
																	<img alt=""
																		src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/159600313144145468.jpg?gif=1&amp;w=240&amp;h=240&amp;c=c&amp;webp=1"
																		srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/159600313144145468.jpg?gif=1&amp;w=360&amp;h=360&amp;c=c&amp;webp=1 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/159600313144145468.jpg?gif=1&amp;w=480&amp;h=480&amp;c=c&amp;webp=1 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/159600313144145468.jpg?gif=1&amp;w=720&amp;h=720&amp;c=c&amp;webp=1 3x">
																</div>
																<div class="product-small-item__content">
																	<h1 class="product-small-item__title"><%= Cart.get(i)[0]%></h1>
																	<p class="product-small-item__caption"><h2>수량 <%= count%><h2></h2></p>
																</div></a>
															<button class="carted-product__delete" type="button"
																aria-label="삭제">
																<svg width="12" height="12" viewBox="0 0 12 12"
																	fill="currentColor" preserveAspectRatio="xMidYMid meet">
																		<path fill-rule="nonzero"
																		d="M6 4.6L10.3.3l1.4 1.4L7.4 6l4.3 4.3-1.4 1.4L6 7.4l-4.3 4.3-1.4-1.4L4.6 6 .3 1.7 1.7.3 6 4.6z"></path></svg>
															</button>
															<div class="carted-product__footer">
																<span class="carted-product__footer__left"></span>
																<span class="carted-product__subtotal">
																<span class="carted-product__subtotal__number"><%= count*price%></span>원</span>
															</div>
														</article></li>
														<%
                                 }  
                                  }
                                 else{
                                	   out.print("장바구니가 비었습니다.");
                                   }
														%>
												</ul>
												<footer class="commerce-cart__delivery-group__footer">
													<p class="commerce-cart__delivery-group__total">배송비 착불
														55,000원</p>
												</footer>
											</article></li>
									</ul>
								</article></li>
						</ul>
						<dl class="commerce-cart__summary commerce-cart__content__summary">
							<div class="commerce-cart__summary__row">
								<dt></dt>
								<dd>
									<span class="number">938,000</span>원
								</dd>
							</div>
							<div class="commerce-cart__summary__row">
								<dt>총 배송비</dt>
								<dd>
									+ <span class="number">0</span>원
								</dd>
							</div>
							<div class="commerce-cart__summary__row">
								<dt>총 할인금액</dt>
								<dd>
									- <span class="number">479,000</span>원
								</dd>
							</div>
							<div
								class="commerce-cart__summary__row commerce-cart__summary__row--total">
								<dt>결제금액</dt>
								<dd>
									<span class="number">459,000</span>원
								</dd>
							</div>
						</dl>
					</div>
				</div>
				<div class="commerce-cart__side-bar-wrap col-12 col-md-5 col-lg-4">
					<div data-sticky-enabled="false" data-sticky-always="false"
						data-direction="top" data-offset="81"
						class="sticky-container commerce-cart__side-bar-container"
						style="position: sticky; top: 81px;">
						<div class="sticky-child commerce-cart__side-bar"
							style="position: relative;">
							<dl
								class="commerce-cart__summary commerce-cart__side-bar__summary">
								<div class="commerce-cart__summary__row">
									<dt>총 상품금액</dt>
									<dd>
										<span class="number">938,000</span>원
									</dd>
								</div>
								<div class="commerce-cart__summary__row">
									<dt>총 배송비</dt>
									<dd>
										+ <span class="number">0</span>원
									</dd>
								</div>
								<div class="commerce-cart__summary__row">
									<dt>총 할인금액</dt>
									<dd>
										- <span class="number">479,000</span>원
									</dd>
								</div>
								<div
									class="commerce-cart__summary__row commerce-cart__summary__row--total">
									<dt>결제금액</dt>
									<dd>
										<span class="number">459,000</span>원
									</dd>
								</div>
							</dl>
							<div class="commerce-cart__side-bar__order">
								<button
									class="button button--color-blue button--size-50 button--shape-4 commerce-cart__side-bar__order__btn"
									type="button">1개 상품 구매하기</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div data-sticky-enabled="false" data-sticky-always="false"
			data-direction="bottom" data-offset="0"
			class="sticky-container commerce-cart__footer-wrap"
			style="position: sticky; bottom: 0px;">
			<div class="sticky-child commerce-cart__footer"
				style="position: relative;">
				<div class="commerce-cart__footer__total">
					<span class="count">1개 </span><span class="cost">459,000원</span>
				</div>
				<button
					class="button button--color-blue button--size-45 button--shape-4 commerce-cart__footer__order"
					type="button">바로구매</button>
			</div>
		</div>
	</div>

</body>
</html>