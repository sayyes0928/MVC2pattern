<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="org.apache.catalina.ant.SessionsTask"%>
<%@ page import="javax.websocket.Session"%>
<%@ page import="java.util.*"%>
<%@ page import="com.jachi.DTO.ProductinfoDTO"%>
<%@page import="java.text.DecimalFormat" %>
<%
	ArrayList<ProductinfoDTO> article = (ArrayList<ProductinfoDTO>) request.getAttribute("article");

    DecimalFormat aaa = new DecimalFormat("###,###");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 구매페이지1</title>

<link rel="stylesheet" href="./myhome.web.css/ProdcutPost.css" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript" src="./myhome.web.js/ProductPost.js"></script>
<script src="./myhome.web.js/teamTopnav.js"></script>

<script>
	//////////// 주문 목록 리스트 
/*	$(function() {
		$('.Option1')
				.on(
						'change',
						function() {
							var pro_name = $('#product_name').text();
							var optiongroup = $('.Option1 option:first').val();
							var option = $('.Option1 option:selected').val();
							var buylist_cell1 = $(".buylist_cell1").html();
							var item_size = $(".Option1 option").size();
							var idx = $(".Option1 option").index(
									$(".Option1 option:selected"));
							var item_text = $(".Option1 option:selected")
									.text();
							var option2 = $(".buylist_section1 #buy_option")
									.text();

							$(".buylist_section1").css("display", "block");
							$("#buylist1").text(
									pro_name + " / " + optiongroup + " : ");
							$("#buy_option").text(option);
							$(".buylist_cell2").append(buylist_cell1);

						});
	});

	////////// 주문 목록 삭제버튼
	$(document).on("click", ".buylist_delete1", function() {
		$(this, '.buylist_delete1').parent().css("display", "none");
	}); */   
</script>

</head>
<body>
	<form id="contentPage" action="#">
		<!-- Header include -->
		<jsp:include page="HeaderTestjsp.jsp"></jsp:include>
		
        <section id="s_wrap">
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
				</div>
				<div class="s_category">
					<ul>
						<li><a href="#">가구</a>></li>
						<li><a href="#">학생/서재가구</a>></li>
						<li><a href="#">학생/오피스의자</a>></li>
						<li><a href="#">학생의자</a></li>
					</ul>
				</div>
		   <div id="pr_wrap">
				<div id="mainsize">
					<div class="s_subimg">
						<ul id="pr_imgs">
							<!-- <li><img class="s_imgborder"
								src="<%=request.getContextPath()%>/upload/<%=article.get(0).getPro_mainimg()%>"></li>-->
							<li><img class="s_imgborder"
								src="img/ProductPost/sofar1.webp"></li>
							<li><img class="s_imgborder"
								src="img/ProductPost/sofar2.webp"></li>
						</ul>
					</div>
					<div id="showimg" class="s_mainimg">
						<img
							src="img/ProductPost/sofar1.webp">
					</div>
					<div class="s_maintitle">
						<div class="s_mainproduct">
							<ul>
								<li class="s_maintitlefont01">의자왕</li>
								<li id="product_name" class="s_maintitlefont02"><%=article.get(0).getPro_name()%></li>
								<li class="s_maintitlefont01">3개 리뷰</li>
								<li class="s_maintitlefont03">54%</li>
								<li class="s_li_inline"><%=aaa.format(article.get(0).getPro_price())%>
									원</li>
							</ul>
						</div>
						
						<div class="product_orderbox">
						<div class="s_combobox">
							<ul>
						      <% String option1 = article.get(0).getPro_option1();
							     String[] option_split1 = option1.split(",");
						         if(!article.get(0).getPro_option1().equals(",")) { %>
								     <li><select class="Option1" >
								       <%  for (int x=0; x<option_split1.length; x++) {  %>
										    <option value="<%=option_split1[x]%>"><%=option_split1[x]%></option>
									   <%
										   }
									   %>

								     </select></li>
						       <%
								   }
							   %>
							</ul>
						 	<div id="buylist_cell1">
						 	      <% int price = article.get(0).getPro_price();
						 	         for(int i=0; i<option_split1.length; i++) {%>
								<div class="buylist_section1">
									<div class="buylist" name="<%= i%>" ><%= option_split1[i]%></div>
									<span class="buy_option"></span> 
									<input class="buylist_delete1" type="button" value="X">
									<select class="product_count" name="or_count">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
										<option value="7">7</option>
										<option value="8">8</option>
										<option value="9">9</option>
										<option value="10">10+</option>
									</select> 
									<span class="count_price"><%=aaa.format(article.get(0).getPro_price())%>원</span>
									<input class="ep_price" type="hidden" value="0">
								</div>
								<%} %> 						
							</div>
						</div>
						
						<script>
						
						    /*	 $(".Option1").on('change',function(){
						    		 $('.buylist').data('price'); //80000;
						    		 $('.buylist').data('price')
						    		 
						    		 console.log("옵션 1체인지");
						    		 var str = "";
						    		 var op1 = $(".Option1").size();
						    		 var op1_vla = $(".Option1").val();
						    		 var op2 = $("#Option2").size();
						    		 var op3 = $("#Option3").size();
						    		 var op = $(".input").val();
						    		 
						    		 str += "<div>";
						    		 str += "<input class='input' type='button' value='"+op1_vla+"'>";
						    		 str += "</div>";
						    		 
						    		 console.log(op1+","+ op2);
						    		 
						    		 if(op1_vla == op){
						    			 alert("이미 선택한 옵션입니다.");
						    			 return;
						    		 }		 
							    		 
						    		 $(".buylist_cell1").append(str);
						    	     
						    		 console.log(op);
						    	 }); */
						    	 
						         // 가격 콤마
								   function addComma(num) {
								      var regexp = /\B(?=(\d{3})+(?!\d))/g;
								      return num.toString().replace(regexp, ',');
								   }  
						    	 
						    	 // 주문 옵션 리스트
						    	  $(document).ready(function(){
						    		  
						    		  var price_all = 0;
						    		  var sum = 0;
                                    //  var j = new Array();  내가 선택한 인덱스 값
                                     
						    		  $(".Option1").on('change',function(){
						    			 
							    		 var idx = $(".Option1 option").index($(".Option1 option:selected"));
							    		 var op2 = $(".Option1").size();
							    		 
							    		 
							    		/* for(var i=0; i<j.length; i++){
							    			   if(j[i] == idx){
							    				 alert("이미 선택한 옵션입니다.");
							    			 	 return;   
							    			   }
							    		 }*/
							    		 console.log(idx);
							    		 
							    		 if(idx!=0){
					    				   $("div[name='"+idx+"']").parent().css("display", "block");

					    				   
					    				   $(".ep_price:eq("+idx+")").val(<%=price%>);
					    				   
					    				   var count = $(".product_count:eq("+idx+") option:selected").val();
								    	   var pr_price = parseInt(count * <%=price%>);
					    				   $(".product_count:eq("+idx+")").next(".count_price").text(addComma(pr_price)+" 원")
					    				   calculator();
							    		  
							    		 }
							    		 
							    	 });
							          
							    	 // 주문 삭제버튼
							    	 $(document).on("click", ".buylist_delete1", function() {
							    			$(this, '.buylist_delete1').parent().css("display", "none");							    			
							    		   
							    			var n = $(".buylist_delete1").index(this);
							    			$(".ep_price:eq("+n+")").val("0");
							    		    
							    			$(".product_count:eq("+n+") option:eq(0)").prop("selected", true);
							    			
							    			calculator();
							    	 });
							    	 
						    	     // 상품 수량
							    	 $(document).on('change','.product_count',function(){
							    		 var n = $(".product_count").index(this);
							    		 var count = $(".product_count:eq("+n+") option:selected").val();
							    		 var pr_price = parseInt(count * <%=price%>);

							    		 $(".product_count:eq("+n+")").next(".count_price").text(addComma(pr_price)+" 원");
							    		 $(".ep_price:eq("+n+")").val(pr_price);

							    		 calculator();
							    		 
							    	 });
						    	 });
						    	 
						    	 // 값 계산
						    	 function calculator(){
						    		 var sum = 0;
						    		 var  v = document.getElementsByClassName('ep_price'); //each
						    		    for(var i=1; i<v.length; i++){						    		    	
						    		    	 sum += parseInt(v[i].value);
						    		    	 
						    		    }
						    		   // alert(sum);
						    		  $('.price02').text(addComma(sum)+" 원");
						    		  $('.buy_price').val(sum);
						    	 }
						    	 
						</script>
							
						<%
							String pro_code = (String) request.getParameter("pro_num");
						%>
						
						<input type="hidden" value="<%= pro_code%>" name="pro_code" id="pro_code">
						
					         <ul class="s_price">
								<li class="price01">주문금액</li>
								<li class="price02">0원</li>
							</ul>
					
						<input class="buy_price" type="hidden" value="">
						<div class="s_button">
							<ul id="product_info">

								<li><button class="m_button01" type="button"
										onclick="cart()">장바구니</button></li>
								<li><button class="m_button02" type="button"
										onclick="buy()">바로구매</button></li>
							</ul>
						</div>
						</div>
						
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
				
					</div>
				</div>
		   </div>
		   <div id="r_wrap">


						<ul class="s_infonav">
							<li><a href="#product_info">상품정보</a></li>
							<li>|</li>
							<li><a href="#product_review">리뷰</a></li>
							<li>|</li>
							<li><a href="#product_inquiry">문의</a></li>
							<li>|</li>
							<li><a href="#product_delivery">배송/환불</a></li>
						</ul>
		
					<div class="productinfo_wrap">
							<p>상품정보</p>
						<div class="productimg">
							<img class="pro_detail_img"
								src="img/ProductPost/sofar_detail1.jpg">
						</div>
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
				</div>
		</section>
		<footer class="f_wrap">
			<hr>
		</footer>
	</form>
</body>
>>>>>>> refs/remotes/jooyoungHOME/master
</html>