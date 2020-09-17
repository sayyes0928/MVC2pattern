<header>
		<div id="h_wrap">
			<div class="h_div">

				<h1>자취해보자</h1>
			</div>

			<%
				String us_id = (String) session.getAttribute("us_id"); //로그인 유무 확인
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