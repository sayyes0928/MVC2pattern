<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.jachi.DTO.BeautyRoomDTO"%>
<%@ page import="com.jachi.DTO.Posting_replyDTO"%>
<%@ page import="com.jachi.DTO.PageInfo"%>
<%@ page import="com.jachi.DTO.UserinfoDTO"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />


<link rel="stylesheet" type="text/css"
	href="./myhome.web.css/myhome_write_css.css" />
<link rel="stylesheet" type="text/css"
	href="./myhome.web.css/heartbtn.css" />
<link rel="stylesheet" type="text/css"
	href="./myhome.web.css/bookmark.css" />
<link rel="stylesheet" type="text/css"
	href="./myhome.web.css/teamTopNav.css" />
<link rel="stylesheet" type="text/css"
	href="./myhome.web.css/styleSlider.css" />
<link rel="stylesheet" type="text/css"
	href="./myhome.web.css/myhome_detail_comment.css" />



<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="./myhome.web.js/MyhomeDtail.js"></script>
<script src="./myhome.web.js/teamTopnav.js"></script>




<title>MVC 게시판</title>
<style type="text/css">
</style>
</head>
<body>
	<!-- Header include -->
	<jsp:include page="HeaderTestjsp.jsp"></jsp:include>

	<!-- 서블릿 값 선언 -->
	<%
		ArrayList<BeautyRoomDTO> article = (ArrayList<BeautyRoomDTO>) request.getAttribute("article");
		ArrayList<Posting_replyDTO> coment = (ArrayList<Posting_replyDTO>) request.getAttribute("coment");
		ArrayList<BeautyRoomDTO> postList = (ArrayList<BeautyRoomDTO>) request.getAttribute("postList");
		ArrayList<UserinfoDTO> userinfoDTO = (ArrayList<UserinfoDTO>) request.getAttribute("userinfoDTO");

		String board_num = request.getParameter("board_num");
		String us_id = (String) session.getAttribute("us_id");
		PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");

		String post_image1 = article.get(0).getPost_pic();
		String post_image2 = article.get(0).getPost_pic_2();
		String post_image3 = article.get(0).getPost_pic_3();
		String post_image4 = article.get(0).getPost_pic_4();
		String post_image[] = { post_image1, post_image2, post_image3, post_image4 };
	%>

	<!-- 해당 페이지의 좋아요 기능을 위해 게시물 정보 Setting -->
	<input type="hidden" value=<%=board_num%> name="post_no" id="post_no" />
	<input type="hidden" value=<%=us_id%> name="us_id" id="us_id" />


	<div id="m_wrap">
		<main>
		<div class="myhomeContentLeft">
			<div class="myhomeContentLeft_header">
				<ul class="myhomeContentLeft_header_keyword">
					<li>키워드1 |</li>
					<li>키워드2 |</li>
					<li>키워드3 |</li>
				</ul>
				<div class="myhomeContentLeft_header_time">time</div>
			</div>

			<div class="myhomeContentLeft_main">
				<div id="bg_main">
					<div id="page-wrap">
						<div id="showimg" class="s_mainimg">
							<img src="<%=request.getContextPath()%>/upload/<%=post_image1%>">
						</div>
					</div>
					<ul id="pr_imgs">
						<li><img class="s_imgborder"
							src="<%=request.getContextPath()%>/upload/<%=article.get(0).getPost_pic()%>"></li>
						<%
							if (post_image2 != null) {
						%>
						<li><img class="s_imgborder"
							src="<%=request.getContextPath()%>/upload/<%=article.get(0).getPost_pic_2()%>"></li>
						<%
							if (post_image3 != null) {
						%>
						<li><img class="s_imgborder"
							src="<%=request.getContextPath()%>/upload/<%=article.get(0).getPost_pic_3()%>"></li>
						<%
							if (post_image4 != null) {
						%>
						<li><img class="s_imgborder"
							src="<%=request.getContextPath()%>/upload/<%=article.get(0).getPost_pic_4()%>"></li>
						<%
							}
								}
							}
						%>

					</ul>
				</div>

				<!-- 메인배경 -->
				<div id="myhomeContentLeft_main_userContent_bgImage">
					<div class="myhomeContentLeft_main_userContent_title">
						<p>
							<span><%=article.get(0).getPost_title()%></span>
						</p>
						<div class="myhomeContentLeft_main_userContent_text">
							<span><%=article.get(0).getPost_posting()%></span>
						</div>
					</div>


					<div class="myhomeContentLeft_main_keyword">
						<ul class="myhomeContentLeft_main_keyword_tag">
							<%
								String post_tag[] = null;
								String post_tagAll = article.get(0).getPost_tag();
								post_tag = post_tagAll.split(",");

								for (int i = 0; i < post_tag.length; i++) {
							%>
							<li><a href="#">#<%=post_tag[i]%></a></li>
							<%
							}
							%>
						</ul>
					</div>
				</div>

				<div class="myhomeContentLeft_main_writeComment">
					<jsp:include page="include_Myhome_Detail_coment.jsp">
						<jsp:param value="<%=coment%>" name="coment" />
						<jsp:param value="<%=board_num%>" name="post_num" />
						<jsp:param value="<%=pageInfo%>" name="pageInfo" />
					</jsp:include>
				</div>
			</div>

		</div>

		<%
			String like = "0";
			String bookmark = "0";
			like = (String) request.getAttribute("Like");
			bookmark = (String) request.getAttribute("Bookmark");
		%> 
		<%
 	if (us_id != null) {
 		if (like.equals("1")) {
 			like = "./img/myhome/icons8-heart-50-2.png";

 		} else {
 			like = "./img/myhome/icons8-heart-50.png";
 		}

 		if (bookmark.equals("0")) {
 			bookmark = "./img/myhome/icons8-bookmark-50-2.png";

 		} else {
 			bookmark = "./img/myhome/icons8-bookmark-50.png";
 		}
 	} else {
 		like = "./img/myhome/icons8-heart-50.png";
 		bookmark = "./img/myhome/icons8-bookmark-50-2.png";
 	}
 %>
		<div class="boxContainer">
			<div class="myhomeContentRight">
				<div class="myhomeContentRight_button">
					<div class="myhomeContentRight_button_btn">
						<button type="button" class="btm_image" id="heart_btn">
							<img id="img_btn" src="<%=like%>" />
						</button>


						<button type="button" class="btm_image" id="bookmark_btn">
							<img src="<%=bookmark%>" />
						</button>

					</div>


					<div class="user-profile__profile-image_container">
						<a class="user-profile__profile-image"> 
<!-- 						<img class="card-detail-writer__image" -->
<%-- 							src="<%=request.getContextPath()%>/upload/<%=userinfoDTO.get(0).getUs_pic()%>" /> --%>
						</a> <span class="Right_userID"><%=article.get(0).getpost_nickname()%></span>
					</div>

					<div class="myhomeContentRight_userimage_container">
						<%
							if (postList.size() != 0) {
								for (int i = 0; i < postList.size(); i++) {
									if(i<4){
						%>
						<div class="myhomeContentRight_userimage">
							<a href="Beautyroom_Detail.bo?board_num=<%= postList.get(i).getPost_num()%>"><img
								src="<%=request.getContextPath()%>/upload/<%=postList.get(i).getPost_pic()%>" /></a>
						</div>

						<% }
							 }
							}
						%>
					</div>
				</div>
			</div>

		</div>
	</div>
	</main>
	</div>
</body>
</html>