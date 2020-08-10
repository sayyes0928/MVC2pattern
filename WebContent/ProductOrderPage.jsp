<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="java.util.*"%>
<%@ page import="com.jachi.DTO.OrderDTO"%>
<%@ page import="com.jachi.DTO.UserinfoDTO"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 구매페이지1</title>
    <link rel="stylesheet" href="./myhome.web.css/teamTopNav.css" type="text/css">
	<link rel="stylesheet" type="text/css" href="././myhome.web.css/styleSlider.css" />
    <link rel="stylesheet" href="./myhome.web.css/Order.css" type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script type="text/javascript" src="./myhome.web.js/jquery-easing-1.3.pack.js"></script>
    <script type="text/javascript" src="./myhome.web.js/jquery-easing-compatibility.1.2.pack.js"></script>
    <script type="text/javascript" src="./myhome.web.js/addressFinder.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    


</head>
<body>
		<header>
			<div id="h_wrap">
				<div class="h_div">
					<ul>
						<li style="padding-top: 110px"><img src="img/grass2icon.svg"
							width="30" height="30" /></li>
						<li style="padding-top: 80px"><img src="img/truck2.svg"
							width="70" height="70" /></li>
						<li><img src="img/sunicon.svg" width="60" height="60" /></li>
						<li style="padding-top: 110px"><img src="img/grass2icon.svg"
							width="30" height="30" /></li>
						<li style="padding-top: 100px"><img src="img/grassicon.svg"
							width="40" height="40" /></li>

						<li><h1>자취해보자</h1></li>
						<li style="padding-top: 20px"><img
							src="img/houseiconcolor.svg" width="100" height="100"
							onmouseover="this.src='img/houseicon.svg'"
							onmouseout="this.src='img/houseiconcolor.svg'" /></li>
						<li style="padding-top: 100px"><img src="img/grassicon.svg"
							width="40" height="40" /></li>
						<li style="padding-top: 100px"><img src="img/grassicon.svg"
							width="40" height="40" /></li>
						<li style="padding-top: 110px"><img src="img/grass2icon.svg"
							width="30" height="30" /></li>
					</ul>

					<%
               // if(us_id == null){
              %>
					<ul class="login_go">
						<li><a href="loginPage.jsp">로그인</a></li>
						<li><span> | </span></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul>

					<%
            //  }else{
              %>

					<ul class="login_go">
						<li><span></span></li>
						<li><span> | </span></li>
						<li><a href="logoutActionPage.jsp">로그아웃</a></li>
					</ul>
					<%
              //  }
              %>
				</div>
			</div>
			<script>
  
    $('#main_nav ul li').hover(
      function() {
        $(this).addClass('main_navov');
      },
      function() {
        $(this).removeClass('main_navov');
      });
    
</script>
			<script>
  $(function() {
    $('#sub').hide();
    $('#main_nav').hover(function() {
      $(this).parent().find('#sub').slideDown();
      $(this).parent().hover(function() {

      }, function() {
        $(this).parent().find('#sub').slideUp(900);
      });
    });
  });
</script>
			<script>
  $(document).ready(function() {
    $('.slider').bxSlider({
     mode:'horizontal',
     auto: true,
     speed: 600,
     pause: 4000
    });

     
   });
</script>

			<div id="main_nav">
				<ul>
					<li><a href="teampro_ver_01_1.html"><span>홈</span></a>
					<li><a href="teampro_ver_01_1.html"><span>스토어</span></a>
					<li><a href="teampro_myhome.html"><span>자취에대한 모든것</span></a>
					<li><a href="teampro_myhome.html"><img
							src="img/jachievery.PNG" width="55" height="55"
							onmouseover="this.src='img/everyicon.svg'"
							onmouseout="this.src='img/jachievery.PNG'"></a>
					<li><a href="teampro_myhome.html"><span>고객센터</span></a>
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
		</header>

<%
//ArrayList<OrderDTO> orderDTO=(ArrayList<OrderDTO>)request.getAttribute("orderDTO");



ArrayList<UserinfoDTO> userinfoDTO=(ArrayList<UserinfoDTO>)request.getAttribute("userinfoDTO");
String addrAllBeforeTrim = userinfoDTO.get(0).getUs_adr();
String addrAllAfterTrim= addrAllBeforeTrim.trim();
String [] adressAll = null;
adressAll = addrAllAfterTrim.split("/");
%>

        
		<div id="pre_order">
		<form action="#" method="GET" id="form_order">
		<div id="title">주문/결제</div>
		<div class="panel">
      <div class="title">
        <div class="title">주문상품</div>
      </div>
      <table cellspacing="0" id="order_productions">
        <tbody data-hj-suppress="" data-hj-ignore-attribute="">
            <tr class="production" data-id="345791" data-cost="99000" data-count="1" data-name="[포더홈] 글로우 천연가죽 4인용 소파 3colors (스툴선택)">
              <td>
                <div class="information">
                  <img src="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-159675718020982429.jpg/320/320" alt="320">
                  <div>
                    <div class="name">[포더홈] 글로우 천연가죽 4인용 소파 3colors (스툴선택)</div>
                    <div class="option">추가상품 - 글로우 스툴/베이지</div>
                    <div class="cost_count">
                      <div class="cost">99,000원</div>
                      <div class="divider">|</div>
                      <div class="count">1개</div>
                    </div>
                  </div>
                </div>
              </td>
            </tr>
        </tbody>
      </table>

    </div>
			<div class="panel">
      <div class="title">
        <div class="title">배송지</div>
      </div>
      <div class="input">
        <div class="field">
          <div class="label">받는분</div>
          <div class="input">
              <input autocomplete="off" class="can_copy half" data-hj-suppress="" 
              type="text" name="order[recipient]" id="order_recipient" value="<%= userinfoDTO.get(0).getUs_name()%>">
            <input type="hidden" name="order[received_name]" id="order_received_name">
          </div>
        </div>
        <div class="field">
          <div class="label">우편번호</div>
          <div class="input">
              <input class="non_edit quarter" readonly="readonly" value=<%= adressAll[0]%> data-hj-suppress="" type="text" name="order[received_zip_code]" id="order_received_zip_code">
              <span id="find_address" onclick="addressFinder()">우편번호</span>
          </div>
        </div>
        <div class="field">
          <div class="label">주소</div>
          <div class="input vertical">
              <input  class="non_edit full" value="<%= adressAll[1]%>" type="text" name="order[received_at]" id="order_received_at">           
              <input value="<%= adressAll[2]%>" autocomplete="off" data-hj-suppress="" class="full" type="text" name="order[received_at_detail]" id="order_received_at_detail">
            <input  value="" data-hj-suppress="" class="full" type="hidden" name="order[received_at_sido]" id="order_received_at_sido">
            <input  value="" data-hj-suppress="" class="full" type="hidden" name="order[received_at_post_code6]" id="order_received_at_post_code6">
          </div>
        </div>
        <div class="field">
          <div class="label">휴대전화</div>
          <div class="input phone">
              <input value="<%= userinfoDTO.get(0).getUs_tel()%>"data-hj-suppress="" type="text" name="order[received_phone_number]" id="order_received_phone_number">
          </div>
        </div>
        <div class="field">
          <div class="label vertical">
            배송 메모
          </div>
          <div class="input vertical">
            <input type="text" name="delivery_message" id="delivery_message" class="delivery_memo donot_check_before_payment full view_delivery_preset" autocomplete="off" data-hj-suppress="">
            <div id="delivery_messages" style="display: none;">
              
                <div class="delivery_message first">
                  <div class="product_name">[마틸라]디저트 프리미엄 차렵이불(단품/세트) 10colors</div>
                  <input class="delivery_each_memo donot_check_before_payment full view_delivery_preset" autocomplete="off" data-hj-suppress="" type="text" name="order[order_productions_attributes][0][delivery_memo]" id="order_order_productions_attributes_0_delivery_memo">
                </div>
                <input class="products_delivery_is_backwoods" type="hidden" value="false" name="order[order_productions_attributes][0][is_backwoods]" id="order_order_productions_attributes_0_is_backwoods">
<input type="hidden" value="52600849" name="order[order_productions_attributes][0][id]" id="order_order_productions_attributes_0_id">            </div>
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
            <input value="" autocomplete="off" data-hj-suppress="" class="half" type="text" name="order[payer_name]" id="order_payer_name">
          </div>
        </div>
        <div class="field">
          <div class="label">이메일</div>
          <div class="input email">
            <input value="" autocomplete="off" data-hj-suppress="" type="text" name="order[payer_email]" id="order_payer_email">
          </div>
        </div>
        <div class="field">
          <div class="label">휴대전화</div>
          <div class="input phone">
            <input value="" data-hj-suppress="" type="text" name="order[payer_phone_number]" id="order_payer_phone_number">
            <div id="verified_phone_number">
              <div class="verified_phone_number" data-value="" data-verified=""></div>
              <div class="need_verified">
                <div id="do_verified_phone_number">인증받기</div>
                <div id="verified_inputs" style="display: none;">
                  <input id="verified_input" class="donot_check_before_payment" placeholder="인증번호" autocomplete="off" type="text" data-hj-suppress="" size="6">
                  <div id="check_verified">확인</div>
                  <div id="resend_verified_number">재전송</div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="field">
          <div class="label"></div>
          <div class="input">
            <div class="form-check sms_agreement">
              <label class="form-check-label" for="order_sms_aggrement">
                <input name="order[sms_aggrement]" type="hidden" value="0"><input class="form-check" type="checkbox" value="1" checked="checked" name="order[sms_aggrement]" id="order_sms_aggrement">
                <span class="check-img"></span>
                SMS 수신동의 <span> (배송 정보를 SMS로 보내드립니다.)</span>
</label>            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="panel">
      <div class="title">최종 결제 금액</div>
      <div class="cost">
        <div class="cost_panel">
          <div class="title">총 상품 금액</div>
          <div class="amount" id="preview_product_cost" data-hj-suppress="">45,800</div>
        </div>

        <div class="cost_panel">
          <div class="title">배송비</div>
          <div class="amount" id="preview_delivery_cost" data-hj-suppress="">3,000</div>
        </div>

        <div class="cost_panel">
          <div class="title">쿠폰 사용</div>
          <div class="amount" id="preview_coupon_cost" data-hj-suppress="">0</div>
        </div>

        <div class="cost_panel">
          <div class="title">포인트 사용</div>
          <div class="amount" id="preview_mileage_cost" data-hj-suppress="">0</div>
        </div>

        <div class="total cost_panel">
          <div class="amount" id="preview_selling_cost" data-hj-suppress="">48,800원</div>
        </div>
      </div>

      <input type="hidden" name="order[imp_uid]" id="order_imp_uid">
      <input type="hidden" name="order[apply_number]" id="order_apply_number">
      <input type="hidden" name="order[receipt_url]" id="order_receipt_url">
      <input type="hidden" value="bp_p00000000_000028153412" name="order[merchant_uid]" id="order_merchant_uid">
      <input type="hidden" name="order[vbank_num]" id="order_vbank_num">
      <input type="hidden" name="order[vbank_name]" id="order_vbank_name">
      <input type="hidden" name="order[vbank_holder]" id="order_vbank_holder">
      <input type="hidden" name="order[vbank_date]" id="order_vbank_date">
      <input type="hidden" value="0" name="order[real_pay_cost]" id="order_real_pay_cost">
      <input type="hidden" value="3000" name="order[delivery_cost]" id="order_delivery_cost">
      <input value="0" type="hidden" name="order[mileage_cost]" id="order_mileage_cost">
      <input value="0" type="hidden" name="order[coupon_cost]" id="order_coupon_cost">
      <input type="hidden" value="Web" name="order[os_type]" id="order_os_type">
      <input type="hidden" name="coupon_id" id="coupon_id" value="0">
      <input type="hidden" value="false" name="order[from_cart]" id="order_from_cart">
    </div>
    <div id="confirm_checkbox">
      <div class="form-check check_agree_policy">
        <label class="form-check-label" for="check_agree_policy">
          <input type="checkbox" id="check_agree_policy" class="form-check">
          <span class="check-img"></span>
          결제 진행 필수사항 동의
        </label>
      </div>

      <div class="all_policy">
        <div class="title">개인정보 제 3자 제공 및 결제대행 서비스 표준 이용약관</div>
        <div class="opener">보기</div>
      </div>
      <div id="do_payment">결제하기</div>
    </div>
    </form>
		</div>
		<footer class="f_wrap">
		</footer>
</body>
</html>