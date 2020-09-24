<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ page import="java.util.*"%>
<%@ page import="com.jachi.DTO.OrderDTO"%>
<%@ page import="com.jachi.DTO.UserinfoDTO"%>
<%@ page import="com.jachi.DTO.Product_cartDTO"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 구매페이지1</title>
<link rel="stylesheet" href="./myhome.web.css/teamTopNav.css"
	type="text/css">
<link rel="stylesheet" type="text/css"
	href="././myhome.web.css/styleSlider.css" />
<link rel="stylesheet" href="./myhome.web.css/Order.css" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript"
	src="./myhome.web.js/jquery-easing-1.3.pack.js"></script>
<script type="text/javascript"
	src="./myhome.web.js/jquery-easing-compatibility.1.2.pack.js"></script>
<script type="text/javascript" src="./myhome.web.js/addressFinder.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="./myhome.web.js/teamTopnav.js"></script>



</head>
<body>
	<jsp:include page="includHeader.jsp"></jsp:include>

	<div id="pre_order">
		<form action="ProductOrderComplite.bo" method="POST" name="form_order">
			<div id="title">주문/결제</div>
			<div class="panel">
				<div class="title">
					<div class="title">주문상품</div>
				</div>
				<table cellspacing="0" id="order_productions">
					<tbody data-hj-ignore-attribute="">
						<tr class="production" data-id="345791" data-cost="99000"
							data-count="1" data-name="[포더홈] 글로우 천연가죽 4인용 소파 3colors (스툴선택)">
							<td>
								<%
									String us_id = (String) session.getAttribute("us_id"); //로그인 유무 확인
									ArrayList<String[]> Cart = (ArrayList<String[]>) session.getAttribute("cart");
									int total_price = 0;
									if (Cart != null) {
										for (int i = 0; i < Cart.size(); i++) {
											String proname = Cart.get(i)[0].toString();
											int count = Integer.parseInt(Cart.get(i)[1].toString());
											int price = Integer.parseInt(Cart.get(i)[2].toString());
											int price_sum = count * price;
											String cart_arr[] = null;
								%>
								<div class="information">
									<img src="<%=request.getContextPath()%>/upload/#">
									<div>

										<div class="name"><%=proname%></div>
										<div class="option">추가상품 -</div>
										<div class="cost_count">
											<div class="cost"><%=price_sum%>원
											</div>
											<div class="divider">|</div>
											<div class="count"><%=count%>개
											</div>
										</div>
									</div>
								</div> <%
 	total_price += price_sum;
 		}
 	}
 %>
							</td>
						</tr>
					</tbody>
				</table>

			</div>
			<%
				ArrayList<UserinfoDTO> userinfoDTO = (ArrayList<UserinfoDTO>) request.getAttribute("userinfoDTO");
				String[] adressAll = new String[3];;
				adressAll[0] = "";
				adressAll[1] = "";
				adressAll[2] = "";
				String userName = "";
				String tel = "";
				String userMail = "";
				if (us_id != null) {
					String addrAllBeforeTrim = userinfoDTO.get(0).getUs_adr();
					String addrAllAfterTrim = addrAllBeforeTrim.trim();
					adressAll = addrAllAfterTrim.split("/");
					userName = userinfoDTO.get(0).getUs_name();
					tel = userinfoDTO.get(0).getUs_tel();
					userMail = userinfoDTO.get(0).getUs_mail();

				}
			%>
			<div class="panel">
				<div class="title">
					<div class="title">배송지</div>
				</div>
				<div class="input">
					<div class="field">
						<div class="label">받는분</div>
						<div class="input">
							<input autocomplete="off" class="can_copy half" type="text"
								name="order[recipient]" id="order_recipient"
								value="<%=userName%>">
						</div>
					</div>
					<div class="field">
						<div class="label">우편번호</div>
						<div class="input">
							<input class="non_edit quarter" readonly="readonly"
								value="<%=adressAll[0]%>" type="text"
								name="order[received_zip_code]" id="order_received_zip_code">
							<span id="find_address" onclick="addressFinder()">우편번호</span>
						</div>
					</div>
					<div class="field">
						<div class="label">주소</div>
						<div class="input vertical">
							<input class="non_edit full" value="<%=adressAll[1]%>"
								type="text" name="order[received_at]" id="order_received_at">
							<input value="<%=adressAll[2]%>" autocomplete="off" class="full"
								type="text" name="order[received_at_detail]"
								id="order_received_at_detail"> <input value=""
								class="full" type="hidden" name="order[received_at_sido]"
								id="order_received_at_sido"> <input value=""
								class="full" type="hidden" name="order[received_at_post_code6]"
								id="order_received_at_post_code6">
						</div>
					</div>
					<div class="field">
						<div class="label">휴대전화</div>
						<div class="input phone">
							<input value="<%=tel%>" type="text"
								name="order[received_phone_number]"
								id="order_received_phone_number">
						</div>
					</div>
					<div class="field">
						<div class="label vertical">배송 메모</div>
						<div class="input vertical">
							<input type="text" name="delivery_message" id="delivery_message"
								class="delivery_memo donot_check_before_payment full view_delivery_preset"
								autocomplete="off">
							<div id="delivery_messages" style="display: none;">

								<div class="delivery_message first">
									<div class="product_name">[마틸라]디저트 프리미엄 차렵이불(단품/세트)
										10colors</div>
									<input
										class="delivery_each_memo donot_check_before_payment full view_delivery_preset"
										autocomplete="off" type="text"
										name="order[order_productions_attributes][0][delivery_memo]"
										id="order_order_productions_attributes_0_delivery_memo">
								</div>
								<input class="products_delivery_is_backwoods" type="hidden"
									value="false"
									name="order[order_productions_attributes][0][is_backwoods]"
									id="order_order_productions_attributes_0_is_backwoods">
								<input type="hidden" value="52600849"
									name="order[order_productions_attributes][0][id]"
									id="order_order_productions_attributes_0_id">
							</div>
							<div id="delivery_message_presets">
								<div class="preset">배송 전에 미리 연락 바랍니다.</div>
								<div class="preset">부재시 경비실에 맡겨주세요.</div>
								<div class="preset">부재시 전화 주시거나 문자 남겨 주세요.</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="panel">
				<div class="title">
					<div class="title">주문자</div>
					<div class="button" id="copy_delivery">배송지 정보와 동일하게 채우기</div>
				</div>
				<div class="input">
					<div class="field">
						<div class="label">이름</div>
						<div class="input">
							<input value="" autocomplete="off" class="half" type="text"
								name="order[payer_name]" id="order_payer_name">
						</div>
					</div>
					<div class="field">
						<div class="label">이메일</div>
						<div class="input email">
							<input value="" type="text" name="order[received_name]"
								id="order_received_mail"> <input value="<%=userMail%>"
								type="hidden" name="order[payer_email]" id="order_payer_email">
						</div>
					</div>
					<div class="field">
						<div class="label">휴대전화</div>
						<div class="input phone">
							<input value="" type="text" name="order[payer_phone_number]"
								id="order_payer_phone_number">
							<div id="verified_phone_number">
								<div class="verified_phone_number" data-value=""
									data-verified=""></div>
								<div class="need_verified">
									<div id="do_verified_phone_number">인증받기</div>
									<div id="verified_inputs" style="display: none;">
										<input id="verified_input" class="donot_check_before_payment"
											placeholder="인증번호" autocomplete="off" type="text" size="6">
										<div id="check_verified">확인</div>
										<div id="resend_verified_number">재전송</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<script>
						$(function() {
							$("#copy_delivery")
									.click(
											function() {
												var orderName = document
														.getElementById("order_recipient").value;
												var orderMail = document
														.getElementById("order_payer_email").value;
												var orderTel = document
														.getElementById("order_received_phone_number").value;
												document
														.getElementById("order_payer_name").value = orderName;
												document
														.getElementById("order_received_mail").value = orderMail;
												document
														.getElementById("order_payer_phone_number").value = orderTel;

											});
						});
					</script>
					<div class="field">
						<div class="label"></div>
						<div class="input">
							<div class="form-check sms_agreement">
								<label class="form-check-label" for="order_sms_aggrement">
									<input name="order[sms_aggrement]" type="hidden" value="0"><input
									class="form-check" type="checkbox" value="1" checked="checked"
									name="order[sms_aggrement]" id="order_sms_aggrement"> <span
									class="check-img"></span> SMS 수신동의 <span> (배송 정보를 SMS로
										보내드립니다.)</span>
								</label>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="panel">
				<div class="title">최종 결제 금액</div>
				<div class="cost">
					<div class="cost_panel">
						<div class="title">총 상품 금액</div>
						<div class="amount" id="preview_product_cost"><%=total_price%><span>원</span>
						</div>
					</div>

					<div class="cost_panel">
						<div class="title">배송비</div>
						<div class="amount" id="preview_delivery_cost">3,000</div>
					</div>

					<div class="cost_panel">
						<div class="title">쿠폰 사용</div>
						<div class="amount" id="preview_coupon_cost">0</div>
					</div>

					<div class="cost_panel">
						<div class="title">포인트 사용</div>
						<div class="amount" id="preview_mileage_cost">0</div>
					</div>

					<div class="total cost_panel">
						<div class="amount" id="preview_selling_cost">원</div>
					</div>
				</div>


			</div>
			<div id="confirm_checkbox">
				<div class="form-check check_agree_policy">
					<label class="form-check-label" for="check_agree_policy"> <input
						type="checkbox" id="check_agree_policy" class="form-check">
						<span class="check-img"></span> 결제 진행 필수사항 동의
					</label>
				</div>
				<script>
					function buyOrder() {
						var form_order = document.form_order;
						form_order.submit();
					}
				</script>
				<div class="all_policy">
					<div class="title">개인정보 제 3자 제공 및 결제대행 서비스 표준 이용약관</div>
					<div class="opener">보기</div>
				</div>
				<div id="do_payment" onclick="buyOrder()">결제하기</div>
			</div>
		</form>
	</div>
	<footer class="f_wrap"> </footer>
</body>
</html>