<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="java.util.*" %>
    <%@ page import="com.jachi.DTO.QnABBS" %>
    <%@ page import="com.jachi.DTO.QnA_Comment"%>
    <%@ page import="com.jachi.DTO.PageInfo" %>
    
    <%
    ArrayList<QnABBS> qna_detail = (ArrayList<QnABBS>) request.getAttribute("listall");
    ArrayList<QnA_Comment> qna_list = (ArrayList<QnA_Comment>) request.getAttribute("qnacommentlist");
    PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
    int listCount = pageInfo.getListCount();
	int nowPage = pageInfo.getPage();
	int maxPage = pageInfo.getMaxPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();

    %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QNA 상세페이지</title>
<link rel="stylesheet" href="./myhome.web.css/teamTopNav.css"
	type="text/css">
<link rel="stylesheet" href="./Teamcss/Yuchanqnadetail.css" type="text/css">
<link rel="stylesheet" href="./Teamcss/qna_comment.css" type="text/css">
<script src="http://code.jquery.com/jquery-latest.js"></script>

<script>
	$(document).ready(function(){
		$('#reply_inner_text').click(function(){
			$(this).val('');	
		});
	});
</script>
<script>
$(document).ready(function(){
	$('.reply_size').hide();
});



function aaa(btn){
	
	console.log(btn);
	console.log($('#test'+btn).index());
	if($('#reply_size'+btn).css('display') == 'none'){
		$('#reply_size'+btn).show().index();
	}else{
		$('#reply_size'+btn).hide().index();
	}
}

</script>
</head>
<body>
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
		<form action="qna_commentwrite.bo" method="post">
		
		<section>
		<div id="qna_detail_postsize">
			<div id="qna_titlenamesize"><a href="#" id="qna_titlename">질문과 답변</a></div>
			<div id="qna_post_titlesize"><%=qna_detail.get(0).getQna_title()%></div>
			<div id="qna_post_picsize"><img src="<%=request.getContextPath()%>/upload/<%=qna_detail.get(0).getQna_pw()%>"></div>
			<div id="qna_post_postingsize"><%=qna_detail.get(0).getQna_post()%></div>
			<div id="qna_post_timesize">글쓴시간:<%=qna_detail.get(0).getQna_time() %></div>
			<hr id="qna_post_line">
			
</div>


<div id="qna_asidesize">
			<span>
			<img src="<%=request.getContextPath()%>/upload/<%=qna_detail.get(0).getQna_img() %>" id="profile_img">
			</span>
			<span id="writer_name">
			<%=qna_detail.get(0).getQna_nickname()%>
			</span>		
		</div>



<div id="qna_post_replysize">
			<div id="reply_title_size">Comments</div>
			<%if(us_id != null){ %>
			<input type="text" id="reply_inner_text" value="댓글을 입력해주세요"
				name="comment_post"></input><br> 
				<input type="submit" value="등록" id="reply_button">
				<input type="hidden" value="<%=qna_detail.get(0).getQna_num()%>" name="getnum">
				<%}else{ %>
				<input type="text" id="reply_inner_text_null" value="로그인후 댓글 달기"
				name="comment_post" readonly></input>
				<% } %>
		
		댓글수 : <%= listCount %>
		<div id="comment_size">
		<%if(listCount > 0){
			for(int k = 0; k < qna_list.size(); k++ ){

			%>
		
			<span><img src="<%=request.getContextPath()%>/upload/<%=qna_list.get(k).getQc_img() %>" id="comment_profileimg"></span>
			<span id="comment_id"><%=qna_list.get(k).getQc_nickname() %></span><br>
			<div id="comment_content"><%=qna_list.get(k).getQc_content() %></div>
			<span id="commnet_number">글번호: <%=qna_list.get(k).getQc_num() %></span>
			|<span id="comment_date"><%=qna_list.get(k).getQc_date() %></span>
			<span><a href="#" class="comment_modify">수정</a></span><span>|</span><span>
			<a href="#" class="comment_modify">삭제</a></span>|<span>
			<input type="button" value="답글" onclick="aaa(<%=k %>)" id="test<%=k %>" ></span>
				<div class="reply_size" id="reply_size<%=k%>">
				<input type="text" id="reply_txt" class="reply_txt" name="reply_txt">
				<input type="submit" value="등록"></div>
				<hr id="comment_line">
				<%} %>
		<%}else if(listCount ==0){ %>
		<div id="null_comment">등록된 댓글이 없습니다</div>
		
			<%} %>
		</div>
		<section id="pageList">
			<%
				if (nowPage <= 1) {
			%>
			[이전]&nbsp;
			<%
				} else {
			%>
			<a href="qna_detail.bo?getnum=<%=qna_detail.get(0).getQna_num()%>&page=<%=nowPage - 1%>">[이전]</a>&nbsp;
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
			<a href="qna_detail.bo?getnum=<%=qna_detail.get(0).getQna_num()%>&page=<%=a%>">[<%=a%>]
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
			<a href="qna_detail.bo?getnum=<%=qna_detail.get(0).getQna_num()%>&page=<%=nowPage + 1%>">[다음]</a>
			<%
				}
			%>


		</section>

		
		</div>
		
		
		
		
		
		</section>
		</form>
</body>
</html>