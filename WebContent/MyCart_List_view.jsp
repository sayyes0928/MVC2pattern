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

<script src="./myhome.web.js/teamTopnav.js"></script>



<title>MVC 게시판</title>
<style type="text/css">
</style>
</head>
<body>
	<!-- 게시판 등록 -->


	<!-- Header include -->
	<jsp:include page="HeaderTestjsp.jsp"></jsp:include>



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

								<!--<span class="commerce-cart__header__left"><label
									class="_3xqzr _4VN_z"><div class="_3zqA8">
											  <input type="checkbox" class="_3UImz" value="" checked="">  
											<span
												class="_2mDYR"><svg width="1em" height="1em"
													viewBox="0 0 16 16" class="_2UftR">
														<path fill="currentColor"
														d="M6.185 10.247l7.079-7.297 1.435 1.393-8.443 8.703L1.3 8.432l1.363-1.464z"></path></svg></span>
										</div> <span class="_1aN3J"><span
											class="commerce-cart__header__caption">모두선택</span></span></label></span>
									선택 해제 미구현 		-->
								<span class="commerce-cart__header__right">
									<button class="commerce-cart__header__delete" type="button"
										onclick="cartRemove()">장바구니 비우기</button>
								</span>
							</div>
							<script>
								function cartRemove() {

									location.href = 'cartListRemove.jsp';
								}
							</script>

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
														ArrayList<String[]> Cart = (ArrayList<String[]>) session.getAttribute("cart");
														int total_price = 0;
														if (Cart != null) {

															for (int i = 0; i < Cart.size(); i++) {

																int count = Integer.parseInt(Cart.get(i)[1].toString());
																int price = Integer.parseInt(Cart.get(i)[2].toString());
																int price_sum = count * price;
													%>
													<li class="commerce-cart__delivery-group__product-item">
														<article class="carted-product">
															<!--<div class="carted-product__select">
																 <div class="_3zqA8">
																	
																	 <input type="checkbox" class="_3UImz" value="" checked=""> 
																	<span class="_2mDYR">
																	 <svg width="1em" height="1em" viewBox="0 0 16 16" class="_2UftR">
												<path fill="currentColor" d="M6.185 10.247l7.079-7.297 1.435 1.393-8.443 8.703L1.3 8.432l1.363-1.464z"></path></svg>
												</span>
																</div>
															</div>-->
															<a
																class="product-small-item product-small-item--clickable"
																href="/productions/430554/selling">
																<div class="product-small-item__image">
																	<img alt=""
																		src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/159600313144145468.jpg?gif=1&amp;w=240&amp;h=240&amp;c=c&amp;webp=1"
																		srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/159600313144145468.jpg?gif=1&amp;w=360&amp;h=360&amp;c=c&amp;webp=1 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/159600313144145468.jpg?gif=1&amp;w=480&amp;h=480&amp;c=c&amp;webp=1 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/159600313144145468.jpg?gif=1&amp;w=720&amp;h=720&amp;c=c&amp;webp=1 3x">
																</div>
																<div class="product-small-item__content">
																	<h1 class="product-small-item__title"><%=Cart.get(i)[0]%></h1>
																	<p class="product-small-item__caption">
																	<h2>
																		수량
																		<%=count%><h2></h2>
																		</p>
																</div>
															</a>
															<button class="carted-product__delete" type="button"
																aria-label="삭제">
																<svg width="12" height="12" viewBox="0 0 12 12"
																	fill="currentColor" preserveAspectRatio="xMidYMid meet">
																		<path fill-rule="nonzero"
																		d="M6 4.6L10.3.3l1.4 1.4L7.4 6l4.3 4.3-1.4 1.4L6 7.4l-4.3 4.3-1.4-1.4L4.6 6 .3 1.7 1.7.3 6 4.6z"></path></svg>
															</button>
															<div class="carted-product__footer">
																<span class="carted-product__footer__left"></span> <span
																	class="carted-product__subtotal"> <span
																	class="carted-product__subtotal__number"><%=price_sum%></span>원
																</span>
															</div>
														</article>
													</li>
													<footer class="commerce-cart__delivery-group__footer">
														<p class="commerce-cart__delivery-group__total">배송비</p>
													</footer>
													<%
														total_price += price_sum;
															}
														} else {
															out.print("장바구니가 비었습니다.");
														}
													%>
												</ul>

											</article></li>
									</ul>
								</article></li>
						</ul>
						<dl class="commerce-cart__summary commerce-cart__content__summary">
							<div class="commerce-cart__summary__row">
								<dt>총 상품금액</dt>
								<dd>
									<span class="number"><%=total_price%></span>원
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
									- <span class="number">0</span>원
								</dd>
							</div>
							<div
								class="commerce-cart__summary__row commerce-cart__summary__row--total">
								<dt>결제금액</dt>
								<dd>
									<span class="number"><%=total_price%></span>원
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
										<span class="number"><%=total_price%></span>원
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
										- <span class="number">0</span>원
									</dd>
								</div>
								<div
									class="commerce-cart__summary__row commerce-cart__summary__row--total">
									<dt>결제금액</dt>
									<dd>
										<span class="number"><%=total_price%></span>원
									</dd>
								</div>
							</dl>
							<div class="commerce-cart__side-bar__order">
								<button
									class="button button--color-blue button--size-50 button--shape-4 commerce-cart__side-bar__order__btn"
									type="button" onclick="location.href = 'ProductOrderPage.bo'">바로구매</button>
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

				<button
					class="button button--color-blue button--size-45 button--shape-4 commerce-cart__footer__order"
					type="button">바로구매</button>
			</div>
		</div>
	</div>

</body>
</html>