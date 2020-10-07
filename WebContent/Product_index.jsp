<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*"%>
<%@ page import="com.jachi.DTO.ProductinfoDTO"%>

<%
	ArrayList<ProductinfoDTO> article = (ArrayList<ProductinfoDTO>) request.getAttribute("article");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="./Teamcss/Product_index.css" type="text/css">
<link rel="stylesheet" type="text/css"
   href="./myhome.web.css/scrapbook_1.css" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<script>
	var bntest = jQuery.noConflict();
	bntest(document).ready(function(){
		bntest('#banner_box1').hover(function(){
			bntest('#banner2').css('color','black');
			bntest('#banner2').css('-webkit-transition','-webkit-transform .8s ease');
			bntest('#banner2').css('transform','scale(1.05)');
			bntest('#banner2').css('border','5px solid black');
			
			},
			function(){
				bntest('#banner2').css('color','white');
				bntest('#banner2').css('-webkit-transition','-webkit-transform .8s ease');
				bntest('#banner2').css('transform','scale(1.05)');
				bntest('#banner2').css('border','5px solid white');	
			});
		
		
		});
	
	</script>

</head>
<body>
<header>
<jsp:include page="HeaderTestjsp.jsp"></jsp:include>
<div id="full_banner"><div id="back_text">Beauty Store</div>
<div id="back_test2">Store & DIY</div></div>
</header>
	<main>
		<div id="store_index_banner_body">
			<a href="bestst.bo"><div id="banner_box1"><div id="banner1">TODAY BEST</div><div id="banner2">보러가기</div></div></a>
			<a href="storeList.bo"><div id="banner_box2"><div id="banner3">CATEGORY</div></div></a>
		</div>
		<div id="store_index_main">
			<div id="sub_title1">
				PRODUCT
			</div>
			
			<div class="m_img">
						<ul>


							<%
								for (int i = 0; i < article.size(); i++) {
							%>
							<a href="korea.bo?pro_num=<%=article.get(i).getPro_code()%>">
								<li>
									<div class="row">
										<figure class="effect1">
											<img class="m_imgsize"
												src="<%=request.getContextPath()%>/upload/<%=article.get(i).getPro_mainimg()%>">
											<figcaption>
												<p>제품 상세 정보</p>
											</figcaption>
										</figure>
									</div>

									<div class="m_pname"><%=article.get(i).getPro_name()%></div>
									<div class="m_pindex"><%=article.get(i).getPro_info()%></div>
									<div class="m_pindex2"><%=article.get(i).getPro_price()%></div>

							</li>
							</a>
							<%
								}
							%>
						</ul>
					</div>
		</div>
	
	
	</main>
		<jsp:include page="include_footer.jsp"></jsp:include>
</body>
</html>