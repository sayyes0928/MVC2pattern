<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.jachi.DTO.QnABBS"%>
<%@ page import="com.jachi.DTO.PageInfo"%>



<%
	ArrayList<QnABBS> userqna = (ArrayList<QnABBS>) request.getAttribute("qnaList");
	
	PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
	int listCount = pageInfo.getListCount();
	int nowPage = pageInfo.getPage();
	int maxPage = pageInfo.getMaxPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();
	
	String qna_num = request.getParameter("qna_num");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./myhome.web.css/teamTopNav.css"
	type="text/css">
<link rel="stylesheet" href="./Teamcss/Yuchan_Qna.css" type="text/css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0-alpha1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/typed.js/1.1.1/typed.min.js"></script>



</script>

<script>
	$(function() {
		$(".typed").typed({
			strings : [ "질문해주세요 :)", "답변해드립니다 :D" ],
			// Optionally use an HTML element to grab strings from (must wrap each string in a <p>)
			stringsElement : null,
			// typing speed
			typeSpeed : 10,
			// time before typing starts
			startDelay : 1200,
			// backspacing speed
			backSpeed : 8,
			// time before backspacing
			backDelay : 800,
			// loop
			loop : true,
			// false = infinite
			loopCount : true,
			// show cursor
			showCursor : false,
			// character for cursor
			cursorChar : "|",
			// attribute to type (null == text)
			attr : null,
			// either html or text
			contentType : 'html',
			// call when done callback function
			callback : function() {
			},
			// starting callback function before each string
			preStringTyped : function() {
			},
			//callback for every typed string
			onStringTyped : function() {
			},
			// callback for reset
			resetCallback : function() {
			}
		});
	});
</script>

<script>
	$(function() {
		$('button').on('click', expand);

	});

	function expand() {
		$(".search").toggleClass("close");
		$(".input").toggleClass("square");
		if ($('.search').hasClass('close')) {
			$('input').focus();
		} else {
			$('input').blur();
		}
	}
</script>




<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">


<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="./myhome.web.js/teamTopnav.js"></script>


</head>


<body>
	<form name="go" action="qna_search.bo">
		<header>
			<div id="h_wrap">
				<div class="h_div">

					<h1>자취해보자</h1>
				</div>

				<%
					String us_id = (String) session.getAttribute("us_id"); //로그인 유무 확인
					String us_nk = (String) session.getAttribute("nkname");
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


		<section>
			<div id="post_banner">
				<div id="inbanner_size">
					<div id="page_wrap">
						<span id="ques">질문</span><span id="req">과답변</span><br>
						<hr id="qnahr">
						<div class="banner">
							<div class="typed_wrap">
								<h1>
									무엇이든 <span class="typed"></span>
								</h1>
							</div>
						</div>
					</div>
				</div>

				<div id="content">
					<input type="text" name="input" class="input" id="search-input"
						autocomplete="off">
					<button type="reset" class="search" id="search-btn"></button>
				</div>

			</div>
			<div id="s_fullsize">


				<%
					if (us_id != null) {
				%>
				<div id="write_btsize">
					<input type="button" value="질문하기" id="qna_write_bt"
						onclick="goqnawrite()">
					<input type="button" value="목록으로" id="qna_list_bt"
						onclick="reset_list()">	
				</div>
				<%
					} else {
				%>
				<div id="wrtie_btsize">
					<input type="button" value="질문하기" id="qna_write_bt"
						onclick="alertLogin()">
					<input type="button" value="목록으로" id="qna_list_bt"
						onclick="reset_list()">	
				</div>

				<%
					}
				%>
				
				
				<script>
					function alertLogin() {
						alert('로그인이 필요합니다');
						location.href = "LoginFormpage.bo"
					}
				</script>
				<script>
					function goqnawrite() {
						location.href = "Yuchan_qnawrite.jsp"
					}
				</script>
				<script>
					function reset_list(){
						location.href = "qna.bo"
					}
				</script>

				<div id="qna_body">


					<%
						if (listCount > 0) {

							for (int i = 0; i < userqna.size(); i++) {
					%>
					<hr id="post_hr">

					<table id="tb">
										<tr> 
						<td colspan="5" id="td_size"><a id="title_tag"
							href="readpost.jsp?all_post=  "> <span id="qna_posttitle"><%=userqna.get(i).getQna_title()%></span>
						</a></td>
						<td id="qna_table_ctr">
						<%
						if(us_nk !=null){	
						%>
						<%if(us_nk.equals(userqna.get(i).getQna_nickname())){ %>
						<span><a href="Yuchan_qnamodify.jsp?qna_num=<%=userqna.get(i).getQna_num()%>&qna_title=<%=userqna.get(i).getQna_title()%>&qna_post=<%=userqna.get(i).getQna_post()%>&qna_pw=<%=userqna.get(i).getQna_pw()%>&qna_img=<%=userqna.get(i).getQna_img()%>">수정</a> | <a href="qna_delete.bo?qna_num=<%=userqna.get(i).getQna_num()%>">삭제</a></span></td>
						<%}else{ %>
						
						
						<%
						}	
						%>
						<%
						}else{
						%>
					
						<%} %>
						</tr>
						<tr>
							<td colspan="5" id="post">
								<!-- 내용들어갈거임 --><%=userqna.get(i).getQna_post()%>
							</td>
							<td rowspan="2"><img src="<%=request.getContextPath()%>/upload/<%=userqna.get(i).getQna_pw()%>" id="img_size"></td>
						</tr>
						<tr id="ps_bt">
							<td><img src="<%=request.getContextPath()%>/upload/<%=userqna.get(i).getQna_img() %>" class="img-circle"><span>
									<!-- 게시물번호 -->게시물번호 : <%=userqna.get(i).getQna_num()%>
							</span> <span> <!-- 닉네임 -->닉네임 : <%=userqna.get(i).getQna_nickname()%>
							</span> <!-- 시간 -->게시시간 : <%=userqna.get(i).getQna_time()%> <span></span><span></span></td>
						
						</tr>
					</table>
					<hr>
					<%
						}
					%>



					<%
						} else {
					%>
					<div id="none_posting">등록된글이 없습니다 ㅎㅎ</div>
					<%
						}
					%>

				</div>



			</div>
		</section>

		<section id="pageList">
			<%
				if (nowPage <= 1) {
			%>
			[이전]&nbsp;
			<%
				} else {
			%>
			<a href="qna.bo?page=<%=nowPage - 1%>">[이전]</a>&nbsp;
			<%
				}
			%>

			<%
				for (int a = startPage; a <= endPage; a++) {
					if (a == nowPage) {
			%>
			[<%=a%>]
			<%
				} else {
			%>
			<a href="qna.bo?page=<%=a%>">[<%=a%>]
			</a>&nbsp;
			<%
				}
			%>
			<%
				}
			%>


			<%
				if (nowPage >= maxPage) {
			%>
			[다음]
			<%
				} else {
			%>
			<a href="qna.bo?page=<%=nowPage + 1%>">[다음]</a>
			<%
				}
			%>


		</section>
	</form>
</body>
</html>