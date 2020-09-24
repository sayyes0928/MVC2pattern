<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.jachi.DTO.BeautyRoomDTO"%>

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
				<li><a href="MypageProfile.bo">마이페이지</a></li>
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

		<div id="sub" class="sub_menu">
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
		ArrayList<BeautyRoomDTO> article = (ArrayList<BeautyRoomDTO>) request.getAttribute("article");
		String board_num = request.getParameter("board_num");
		String post_image1 = article.get(0).getPost_pic();
		String post_image2 = article.get(0).getPost_pic_2();
		String post_image3 = article.get(0).getPost_pic_3();
		String post_image4 = article.get(0).getPost_pic_4();
		String post_image[] = { post_image1, post_image2, post_image3, post_image4 };
	%>
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
							<img src="<%=request.getContextPath()%>/upload/<%= post_image1%>">
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
					<div class="myhomeContentLeft_main_userContent">
						<p>
							<span><%=article.get(0).getPost_title()%>></span>
						</p>
					</div>
					<div class="myhomeContentLeft_main_userContent">
						<p>
							<span><%=article.get(0).getPost_posting()%>></span>
						</p>
					</div>

					<div class="myhomeContentLeft_main_keyword">
						<ul class="myhomeContentLeft_main_keyword_tag">
							<%
								String post_tag[] = null;
								String post_tagAll = article.get(0).getPost_tag();
								post_tag = post_tagAll.split(",");

								for (int i = 0; i < post_tag.length; i++) {
							%>
							<li><a href="#"><%=post_tag[i]%></a></li>
							<%
								}
							%>
						</ul>
					</div>
				</div>

				<ul class="myhomeContentLeft_main_usercomment">
					<li><span>조회수</span> <span>35</span></li>
					<li><span>댓글</span> <span>0</span></li>
					<li><span>공유</span> <span>1</span></li>
					<li><input type="button" value="신고" /></li>
				</ul>

				<div class="myhomeContentLeft_main_writeComment">
					<section class="section_left">
						<div class="card-detail-comment-section">
							<section class="comment-feed">
								<h1 class="comment-feed__header">
									댓글&nbsp;<span class="comment-feed__header__count">267</span>
								</h1>
								<form class="comment-feed__form" action="myPage_reply_insert.bo">
						
									<div class="comment-feed__form__user">
										<img
											src="https://image.ohou.se/i/bucketplace-v2-development/uploads/default_images/avatar.png?gif=1&amp;w=36&amp;webp=1"
											srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/default_images/avatar.png?gif=1&amp;w=72&amp;webp=1 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/default_images/avatar.png?gif=1&amp;w=72&amp;webp=1 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/default_images/avatar.png?gif=1&amp;w=144&amp;webp=1 3x">
									</div>
									<div class="comment-feed__form__input">
										<div class="comment-feed__form__content">
											<div class="comment-content-input">
												<div
													class="comment-content-input__text comment-feed__form__content__text"
													data-ph="칭찬과 격려의 댓글은 작성자에게 큰 힘이 됩니다 :)"
													contenteditable="true"></div>
											</div>
										</div>
										<div class="comment-feed__form__actions">
											<button class="comment-feed__form__submit" aria-label="등록"
												type="submit" disabled="">등록</button>
										</div>
									</div>
								</form>
								<ul class="comment-feed__list">
									<li class="comment-feed__list__item"><article
											class="comment-feed__item">
											<p class="comment-feed__item__content">
												<a href="/users/6600494"
													class="comment-feed__item__content__author"><img
													class="comment-feed__item__content__author__image"
													alt="오세두"
													src="https://image.ohou.se/i/bucketplace-v2-development/uploads/users/profile_images1581002795_917854.jpeg?gif=1&amp;w=36&amp;webp=1"
													srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/users/profile_images1581002795_917854.jpeg?gif=1&amp;w=72&amp;webp=1 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/users/profile_images1581002795_917854.jpeg?gif=1&amp;w=72&amp;webp=1 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/users/profile_images1581002795_917854.jpeg?gif=1&amp;w=144&amp;webp=1 3x"><span
													class="comment-feed__item__content__author__name">오세두</span></a><span
													class="comment-feed__item__content__content">이쁘네요</span>
											</p>
											<footer class="comment-feed__item__footer">
												<time class="comment-feed__item__footer__time">3주 전</time>
												<span class="comment-feed__item__footer__likes zero">
													<a class="comment-feed__item__footer__likes__icon" href="#">
														<svg class="badge" width="15" height="14"
															preserveAspectRatio="xMidYMid meet">
		<path fill-rule="evenodd" class="heart"
																d="M7 12.4c4.8-2.5 6.7-5.2 6.5-8-.3-3-4.1-4-6.1-1.4l-.4.5-.4-.5C4.6.4.8 1.5.6 4.4c-.3 2.8 1.6 5.5 6.4 8z"></path>
		                                       </svg>
												</a> <span class="comment-feed__item__footer__likes__count">0</span>
												</span> <a class="comment-feed__item__footer__like-btn" href="#">좋아요</a>
												<a class="comment-feed__item__footer__reply-btn"
													href="/users/sign_in">답글 달기</a><a
													class="comment-feed__item__footer__report-btn" href="#">신고</a>
											</footer>
										</article></li>
								</ul>
								<ul class="list-paginator">
									<li><button class="list-paginator__page sm selected"
											type="button">1</button></li>
									<li><button class="list-paginator__next" type="button">
											<svg width="26" height="26" viewBox="0 0 26 26"
												preserveAspectRatio="xMidYMid meet">
												<g fill="none" fill-rule="evenodd"
													transform="matrix(-1 0 0 1 26 0)">
												<rect width="25" height="25" x=".5" y=".5" stroke="#DCDCDC"
													rx="4"></rect>
												<g stroke="#424242" stroke-linecap="square" stroke-width="2">
												<path d="M14.75 8.263L10.25 13M10.25 13l4.5 4.737"></path></g></g></svg>
										</button></li>
								</ul>
							</section>
						</div>
					</section>
				</div>
			</div>

		</div>

		<%
			String like = "0";
			String bookmark = "0";
			like = (String) request.getAttribute("Like");
			bookmark = (String) request.getAttribute("Bookmark");
			if (us_id != null) {
				if (like.equals("1")) {
					like = "./img/myhome/icons8-heart-50-2.png";

				} else {
					like = "./img/myhome/icons8-heart-50.png";
				}

				if (bookmark.equals("1")) {
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


					<div class="myhomeContentRight_userinfo">
						<div>
							<span class="Right_userID"><%=article.get(0).getpost_nickname()%></span>
						</div>
						<button type="button" class="btm_image">팔로우</button>
					</div>
					<div class="myhomeContentRight_userimage_container">
						<div class="myhomeContentRight_userimage">
							<a href="#"><img
								src="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots1563202386_bcE0MUD3.jpeg?gif=1&w=160&h=160&c=c" /></a>
						</div>
						<div class="myhomeContentRight_userimage">
							<a href="#"><img
								src="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots1563596725_O.jpeg?gif=1&w=160&h=160&c=c&webp=1" /></a>
						</div>
						<div class="myhomeContentRight_userimage">
							<a href="#"><img
								src="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots1564145477_Vz05afV.jpeg?gif=1&w=160&h=160&c=c&webp=1" /></a>
						</div>
						<div class="myhomeContentRight_userimage">
							<a href="#"><img
								src="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots1564296425_omoVsNdH.jpeg?gif=1&w=160&h=160&c=c&webp=1" /></a>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	</main>
	</div>
</body>
</html>