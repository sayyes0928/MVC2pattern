<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="org.apache.catalina.ant.SessionsTask"%>
<%@ page import="javax.websocket.Session"%>
<%@ page import="java.util.*"%>
<%@ page import="com.jachi.DTO.ProductinfoDTO"%>
<%
	ArrayList<ProductinfoDTO> article = (ArrayList<ProductinfoDTO>) request.getAttribute("article");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 구매페이지1</title>
<link rel="stylesheet" href="./myhome.web.css/teamTopNav.css"
	type="text/css">
<link rel="stylesheet" href="./myhome.web.css/ProdcutPost.css"
	type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript" src="./myhome.web.js/ProductPost.js"></script>
<script src="./myhome.web.js/teamTopnav.js"></script>
<script>
	//////////// 주문 목록 리스트 
	$(function() {
		$('#Option1')
				.on(
						'change',
						function() {
							var pro_name = $('#product_name').text();
							var optiongroup = $('#Option1 option:first').val();
							var option = $('#Option1 option:selected').val();
							var buylist_cell1 = $("#buylist_cell1").html();
							var item_size = $("#Option1 option").size();
							var idx = $("#Option1 option").index(
									$("#Option1 option:selected"));
							var item_text = $("#Option1 option:selected")
									.text();
							var option2 = $("#buylist_section1 #buy_option")
									.text();

							$("#buylist_section1").css("display", "block");
							$("#buylist1").text(
									pro_name + " / " + optiongroup + " : ");
							$("#buy_option").text(option);
							$("#buylist_cell2").append(buylist_cell1);

						});
	});

	////////// 주문 목록 삭제버튼
	$(document).on("click", "#buylist_delete1", function() {
		$(this, '#buylist_delete1').parent().css("display", "none");
	});
</script>
</head>
<body>
	<form id="contentPage" action="#">
		<jsp:include page="includHeader.jsp"></jsp:include>

		<div id="s_wrap">
			<section>
				<div id="s_menusize">
					<div class="s_menu1">
						<ul>
							<li>스토어홈</li>
							<li>카테고리</li>
							<li>신혼가구</li>
							<li>베스트</li>
							<li>특가</li>
							<li>여름빅세일</li>
							<li>기획전</li>
						</ul>
					</div>
					<div id="s_menuhr">
						<hr>
					</div>
				</div>
				<div class="s_category">
					<ul>
						<li><a href="#">가구</a>></li>
						<li><a href="#">학생/서재가구</a>></li>
						<li><a href="#">학생/오피스의자</a>></li>
						<li><a href="#">학생의자</a></li>
					</ul>
				</div>
				<div id="mainsize">
					<div class="s_subimg">
						<ul id="pr_imgs">
							<li><img class="s_imgborder"
								src="<%=request.getContextPath()%>/upload/<%=article.get(0).getPro_mainimg()%>"></li>
							<li><img class="s_imgborder"
								src="img/ProductPost/chair02.webp"></li>
							<li><img class="s_imgborder"
								src="img/ProductPost/chair03.webp"></li>
							<li><img class="s_imgborder"
								src="img/ProductPost/chair04.webp"></li>
							<li><img class="s_imgborder"
								src="img/ProductPost/chair05.webp"></li>
							<li><img class="s_imgborder"
								src="img/ProductPost/chair06.webp"></li>
							<li><img class="s_imgborder"
								src="img/ProductPost/chair_info01.webp"></li>
							<li><img class="s_imgborder"
								src="img/ProductPost/chair_info02.webp"></li>
						</ul>
					</div>
					<div id="showimg" class="s_mainimg">
						<img
							src="<%=request.getContextPath()%>/upload/<%=article.get(0).getPro_mainimg()%>">
					</div>
					<div class="s_maintitle">
						<div class="s_mainproduct">
							<ul>
								<li class="s_maintitlefont01">의자왕</li>
								<li id="product_name" class="s_maintitlefont02"><%=article.get(0).getPro_name()%></li>
								<li class="s_maintitlefont01">3개 리뷰</li>
								<li class="s_maintitlefont03">54%</li>
								<li class="s_li_inline"><%=article.get(0).getPro_price()%>
									원</li>
							</ul>
						</div>
						<hr class="clear">
						<div class="s_combobox">
							<ul>

								<%
									if (article.get(0).getPro_option1() != null) {
										String option = null;
										String[] optionsp = null;
										for (int i = 0; i < article.size(); i++) {
											option = article.get(i).getPro_option1();
											optionsp = option.split(",");
								%>
								<%
									}
								%>
								<li><select id="Option1">


										<%
											for (int x = 0; x < optionsp.length; x++) {
										%>
										<option value="<%=optionsp[x]%>"><%=optionsp[x]%></option>
										<%
											}
										%>

								</select></li>
								<%
									}
								%>

								<%
									if (article.get(0).getPro_option2() != null) {
										String option = null;
										String[] optionsp = null;
										for (int i = 0; i < article.size(); i++) {
											option = article.get(i).getPro_option2();
											optionsp = option.split(",");
								%>
								<%
									}
								%>
								<li><select>
										<%
											for (int x = 0; x < optionsp.length; x++) {
										%>
										<option><%=optionsp[x]%></option>
										<%
											}
										%>
								</select></li>
								<%
									}
								%>

								<%
									if (article.get(0).getPro_option3() != null) {
										String option = null;
										String[] optionsp = null;
										for (int i = 0; i < article.size(); i++) {
											option = article.get(i).getPro_option3();
											optionsp = option.split(",");
								%>
								<%
									}
								%>
								<li><select>
										<%
											for (int x = 1; x < optionsp.length; x++) {
										%>
										<option><%=optionsp[x]%></option>
										<%
											}
										%>
								</select></li>
								<%
									}
								%>
							</ul>
							<div id="buylist_cell1">
								<div id="buylist_section1">
									<div id="buylist1"></div>
									<span id="buy_option"></span> <input id="buylist_delete1"
										type="button" value="X"> <select id="product_count1"
										name="or_count">
										<option>1</option>
										<option>2</option>
										<option>3</option>
										<option>4</option>
										<option>5</option>
										<option>6</option>
										<option>7</option>
										<option>8</option>
										<option>9</option>
										<option>10+</option>
									</select> <span id="proudctlist_price1"><%=article.get(0).getPro_price()%></span>원
								</div>
							</div>
							<div id="buylist_cell2"></div>
						</div>
						<%
							String pro_code = (String) request.getParameter("pro_num");
						%>
						<input type="hidden" value=<%=pro_code%> name="pro_code"
							id="pro_code">
						<div class="s_price">
							<ul>
								<li class="price01">주문금액</li>
								<li class="price02">0원</li>
							</ul>
						</div>
						<hr>
						<script>
							// 장바구니 및 구매 버튼 클릭시 발생 이벤트 
							function cart() {
								var proall = "";
								var pro_code = document
										.getElementById("pro_code").value;
								alert(pro_code);
								var pro_option = document
										.getElementById("buy_option").innerHTML;
								var pro_name = document
										.getElementById("buylist1").innerHTML;
								var pro_count = document
										.getElementById("product_count1").value;
								var pro_price = document
										.getElementById("proudctlist_price1").innerHTML;
								var pro_all = pro_name + pro_option;
								var pro_group = [ pro_all, pro_count, pro_price ];

								$.ajax({
									url : 'BasketPage.jsp',
									data : {
										'Pro_all' : pro_all,
										'Pro_count' : pro_count,
										'Pro_price' : pro_price,
										'Pro_code' : pro_code
									},

									success : function() {

									}

								});

							}
							function buy() {
								var proall = "";
								var pro_code = document
										.getElementById("pro_code").value;
								var pro_option = document
										.getElementById("buy_option").innerHTML;
								var pro_name = document
										.getElementById("buylist1").innerHTML;
								var pro_count = document
										.getElementById("product_count1").value;
								var pro_price = document
										.getElementById("proudctlist_price1").innerHTML;
								var pro_all = pro_name + pro_option;
								var pro_group = [ pro_all, pro_count, pro_price ];

								$.ajax({
									url : 'BasketPage.jsp',
									data : {
										'Pro_all' : pro_all,
										'Pro_count' : pro_count,
										'Pro_price' : pro_price,
										'Pro_code' : pro_code
									},

									success : function() {
										location.href = 'ProductOrderPage.bo';

									}

								});

							}
						</script>
						<div class="s_button">
							<ul id="product_info">

								<li><button class="m_button01" type="button"
										onclick="cart()">장바구니</button></li>
								<li><button class="m_button02" type="button"
										onclick="buy()">바로구매</button></li>
							</ul>
						</div>
					</div>
				</div>

				<div id="r_wrap">
					<div class="pr_nav">
						<ul class="s_infonav">
							<li><a href="#product_info">상품정보</a></li>
							<li><a href="#product_review">리뷰</a></li>
							<li><a href="#product_inquiry">문의</a></li>
							<li><a href="#product_delivery">배송/환불</a></li>
						</ul>
					</div>
					<div class="productinfo_wrap">
						<ul class="productimg">
							<li>상품정보</li>
							<li><img class="s_infoimgsize01"
								src="img/c_product/intro1.jpg"></li>
							<li><img class="s_infoimgsize02"
								src="img/c_product/intro2.gif"></li>
							<li><img class="s_infoimgsize03"
								src="img/c_product/intro3.jpg"></li>
							<li><img class="s_infoimgsize04" src="img/c_product/CS_.jpg"></li>
						</ul>
						<div class="pr_info">
							<table>
								<tr>
									<td class="td_size">품명</td>
									<td class="tablepadding">사무용/컴퓨터 메쉬의자9종</td>
								</tr>
								<tr>
									<td class="table_hr" colspan="2">
										<hr>
									</td>
								</tr>
								<tr>
									<td>KC 인증 필 유무</td>
									<td class="tablepadding">해당사항 없음</td>
								</tr>
								<tr>
									<td class="table_hr" colspan="2">
										<hr>
									</td>
								</tr>
								<tr>
									<td>색상</td>
									<td class="tablepadding">상세페이지 참조</td>
								</tr>
								<tr>
									<td class="table_hr" colspan="2">
										<hr>
									</td>
								</tr>
								<tr id="product_review">
									<td>구성품</td>
									<td class="tablepadding">의자</td>
								</tr>
								<tr>
									<td class="table_hr" colspan="2">
										<hr>
									</td>
								</tr>
								<tr>
									<td>주요 소재</td>
									<td class="tablepadding">매쉬</td>
								</tr>
								<tr>
									<td class="table_hr" colspan="2">
										<hr>
									</td>
								</tr>
								<tr>
									<td>제조자,
										<p>수입품의 경우 수입자를 함께 표기</p>
									</td>
									<td class="tablepadding">(주)의자왕</td>
								</tr>
								<tr>
									<td class="table_hr" class="table_hr" colspan="2">
										<hr>
									</td>
								</tr>
								<tr>
									<td>제조국</td>
									<td class="tablepadding">중국</td>
								</tr>
								<tr>
									<td class="table_hr" colspan="2">
										<hr>
									</td>
								</tr>
								<tr>
									<td>크기</td>
									<td class="tablepadding">상세페이지 참조</td>
								</tr>
								<tr>
									<td class="table_hr" colspan="2">
										<hr>
									</td>
								</tr>
								<tr>
									<td>배송, 설치비용</td>
									<td class="tablepadding">품질보증기준</td>
								</tr>
								<tr>
									<td class="table_hr" colspan="2">
										<hr>
									</td>
								</tr>
								<tr>
									<td>품질보증기준</td>
									<td class="tablepadding">상세페이지 참조</td>
								</tr>
								<tr>
									<td class="table_hr" colspan="2">
										<hr>
									</td>
								</tr>
								<tr>
									<td>A/S 책임자와 전화번호</td>
									<td class="tablepadding">상세페이지 참조</td>
								</tr>
								<tr>
									<td class="table_hr" colspan="2">
										<hr>
									</td>
								</tr>
							</table>
						</div>
						<!-- ================review============== -->
						<div id="review">
							<div class="r_header">
								<div class="r_title">리뷰</div>
								<span class="r_count">1000</span>
								<div class="r_b_write">
									<button id="review_button" type="button" name="button"
										onclick="createRow()">리뷰쓰기</button>
								</div>
							</div>
							<div class="review_feed">
								<div class="feed_header">
									<span class="header_stars">4.2</span> <span class="stars_icon"><img
										src="img/c_product/stars.png"> </span>
								</div>
								<div class="feed_filter">
									<ul class="filter_best">
										<li><button class="r_align" type="button" name="button">베스트순</button>
										</li>
										<li><button class="r_align" type="button" name="button">최신순</button>
										</li>
										<li><button class="b_picture" type="button" name="button">
												<img src="img/c_product/camera.png"><span
													class="cameratext
                    ">사진리뷰</span>
											</button></li>
									</ul>
									<ul class="filter_option">
										<li><button type="button" name="button">
												별점<img src="img/c_product/d_arrow.png">
											</button></li>
										<li><button type="button" name="button">
												옵션<img src="img/c_product/d_arrow.png">
											</button></li>
									</ul>
								</div>
								<div id="product_inquiry" class="review_list_wrap">
									<table id="review_list">
									</table>
								</div>
							</div>
							<div id="product_delivery" class="inquiry">
								<ul>
									<li>문의</li>
									<li>1000</li>
								</ul>
								<button type="button" name="button">문의하기</button>
							</div>
							<div class="delivery">
								<div class="delivery_title01">배송</div>
								<table>
									<tr>
										<td class="td_size">배송</td>
										<td>화물택배상품</td>
									</tr>
									<tr>
										<td class="table_hr" colspan="2">
											<hr>
										</td>
									</tr>
									<tr>
										<td>배송비</td>
										<td>5000원</td>
									</tr>
									<tr>
										<td class="table_hr" colspan="2">
											<hr>
										</td>
									</tr>
									<tr>
										<td>도서산간 추가 배송비</td>
										<td>배송불가 지역이 없습니다.</td>
									</tr>
									<tr>
										<td class="table_hr" colspan="2">
											<hr>
										</td>
									</tr>
									<tr>
										<td>비례 배송비</td>
										<td>주문 상품 개수에 비례하여 배송비 부과</td>
									</tr>
									<tr>
										<td class="table_hr" colspan="2">
											<hr>
										</td>
									</tr>
								</table>
								<div class="delivery_title02">교환/환불</div>
								<table>
									<tr>
										<td class="td_size">반품배송비</td>
										<td>5,000원(최초 배송비가 무료인 경우 10,000원 부과)</td>
									</tr>
									<tr>
										<td class="table_hr" colspan="2">
											<hr>
										</td>
									</tr>
									<tr>
										<td>교환배송비</td>
										<td>10,000원</td>
									</tr>
									<tr>
										<td class="table_hr" colspan="2">
											<hr>
										</td>
									</tr>
									<tr>
										<td>보내실 곳</td>
										<td>(10008) 경기 김포시 하성면 하성로 721 (양택리) (주)노마드족</td>
									</tr>
									<tr>
										<td class="table_hr" colspan="2">
											<hr>
										</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
					<div class="product_selling">
						<div class="selling01">
							<div class="selling_select">
								<ul>
									<%
										if (article.get(0).getPro_option1() != null) {
											String option = null;
											String[] optionsp = null;
											for (int i = 0; i < article.size(); i++) {
												option = article.get(i).getPro_option1();
												optionsp = option.split(",");
									%>
									<%
										}
									%>
									<li><select>


											<%
												for (int x = 0; x < optionsp.length; x++) {
											%>
											<option><%=optionsp[x]%></option>
											<%
												}
											%>

									</select></li>
									<%
										}
									%>

									<%
										if (article.get(0).getPro_option2() != null) {
											String option = null;
											String[] optionsp = null;
											for (int i = 0; i < article.size(); i++) {
												option = article.get(i).getPro_option2();
												optionsp = option.split(",");
									%>
									<%
										}
									%>
									<li><select>
											<%
												for (int x = 0; x < optionsp.length; x++) {
											%>
											<option><%=optionsp[x]%></option>
											<%
												}
											%>
									</select></li>
									<%
										}
									%>

									<%
										if (article.get(0).getPro_option3() != null) {
											String option = null;
											String[] optionsp = null;
											for (int i = 0; i < article.size(); i++) {
												option = article.get(i).getPro_option3();
												optionsp = option.split(",");
									%>
									<%
										}
									%>
									<li><select>
											<%
												for (int x = 1; x < optionsp.length; x++) {
											%>
											<option><%=optionsp[x]%></option>
											<%
												}
											%>
									</select></li>
									<%
										}
									%>

								</ul>
							</div>
							<div class="pr_contents">
								<ul>
									<li></li>
									<li></li>
								</ul>
							</div>
							<div class="pr_price">
								<ul>
									<li class="price01">주문금액</li>
									<li class="price02">0원</li>
								</ul>
							</div>
						</div>
						<div class="selling02">
							<ul>
								<li><button class="scrapsize" type="button">
										<img src="img/c_product/scrap.png">
									</button></li>
								<li><button class="selling02_button02" type="button">장바구니</button></li>
								<li><button class="selling02_button02" type="button">바로구매</button></li>
							</ul>
						</div>
					</div>
				</div>
			</section>
		</div>
		<footer class="f_wrap">
			<hr>
		</footer>
	</form>
</body>
</html>