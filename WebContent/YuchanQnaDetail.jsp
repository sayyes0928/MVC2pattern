<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.*"%>
<%@ page import="com.jachi.DTO.QnABBS"%>
<%@ page import="com.jachi.DTO.QnA_Comment"%>
<%@ page import="com.jachi.DTO.PageInfo"%>
<%@ page import="com.jachi.DTO.Qna_comment_reply"%>

<%
	ArrayList<QnABBS> qna_detail = (ArrayList<QnABBS>) request.getAttribute("listall");
	ArrayList<QnA_Comment> qna_list = (ArrayList<QnA_Comment>) request.getAttribute("qnacommentlist");
	ArrayList<Qna_comment_reply> reply = (ArrayList<Qna_comment_reply>) request.getAttribute("replylist");
	
	String us_id = (String) session.getAttribute("us_id"); //로그인 유무 확인
	String us_nk = (String) session.getAttribute("nkname"); 
	//로그인된 아이디와 게시물의 닉네임 일치 여부 확인 (수정/삭제)

	PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
	int listCount = pageInfo.getListCount();
	int nowPage = pageInfo.getPage();
	int maxPage = pageInfo.getMaxPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();
	int getnum = qna_detail.get(0).getQna_num();
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QNA 상세페이지</title>

<link rel="stylesheet" href="./Teamcss/Yuchanqnadetail.css" type="text/css">
<link rel="stylesheet" href="./Teamcss/qna_comment.css" type="text/css">
<script src="http://code.jquery.com/jquery-latest.js"></script>

<script>
	//댓글 입력창 focus -> 초기화 스크립트
	$(document).ready(function(){
		$('#reply_inner_text').click(function(){
			$(this).val('');	
		});
	});
</script>


</head>
<body>
	<!-- Header include -->
	<jsp:include page="HeaderTestjsp.jsp"></jsp:include>

	<form action="qna_commentwrite.bo" method="post">

		<section>
		
			<!-- main content -->
			<div id="qna_detail_postsize">
				<div id="qna_titlenamesize">
					<a href="qna.bo" id="qna_titlename">질문과 답변</a>
					<hr id="title_hr">
				</div>
				<div id="qna_post_titlesize"><%=qna_detail.get(0).getQna_title()%></div>

				<div id="qna_post_picsize">
					<img src="<%=request.getContextPath()%>/upload/<%=qna_detail.get(0).getQna_pw()%>" id="post_pic">
				</div>
				<div id="qna_post_postingsize"><%=qna_detail.get(0).getQna_post()%></div>
				<div id="qna_post_timesize">글쓴시간:<%=qna_detail.get(0).getQna_time()%></div>
				<hr id="qna_post_line">
			</div>
			

			<!-- aside content -->
			<div id="qna_asidesize">
				<span> 
					<img src="<%=request.getContextPath()%>/upload/<%=qna_detail.get(0).getQna_img()%>" id="profile_img">
				</span> 
				<span id="writer_name"> <%=qna_detail.get(0).getQna_nickname()%></span>
				<span>님의 질문입니다 :D</span>
			</div>


			<!-- reply -->
			<div id="qna_post_replysize">
				<div id="reply_title_size">Comments</div>
				<%
					if (us_id != null) {//로그인이 되어있지 않을때
				%>
				<input type="text" id="reply_inner_text" value="댓글을 입력해주세요" name="comment_post"></input>
				<input type="submit" value="등록" id="reply_button"><br>
				<input type="hidden" value="<%=qna_detail.get(0).getQna_num()%>" name="getnum">
				<%
					} else { //로그인 되어있을때
				%>
				<input type="text" id="reply_inner_text_null" value="로그인후 댓글 달기" name="comment_post" readonly></input>
				<%
					}
				%>

				<span id="comment_count">댓글수 : <%=listCount%></span>
				
				<!-- reply select -->
				<div id="comment_size">
					<%
						if (listCount > 0) { //등록된 댓글이 있을시
							for (int k = 0; k < qna_list.size(); k++) { 
					%>

					<span>
						<img src="<%=request.getContextPath()%>/upload/<%=qna_list.get(k).getQc_img()%>" id="comment_profileimg">
					</span> 
					<span id="comment_id"><%=qna_list.get(k).getQc_nickname()%></span><br>
					<div id="comment_content"><%=qna_list.get(k).getQc_content()%></div>
					<span id="commnet_number">글번호: <%=qna_list.get(k).getQc_num()%></span>
					<span id="comment_date"><%=qna_list.get(k).getQc_date()%></span>

					<%
						if (us_nk != null) {
					%>
						<%
 							if (us_nk.equals(qna_list.get(k).getQc_nickname())) { 
 							//로그인된 계정과 댓글 목록의 아이디가 같을시 수정/삭제버튼 활성화
 						%>
					<span>
						<a href="qna_comment_delete.bo?renum=<%=qna_list.get(k).getQc_num()%>&postnum=<%=qna_list.get(k).getQcb_num()%>"
						class="comment_modify" id="comment_delete<%=k%>">삭제
						</a>
					</span>
					<%}else{ }}%>

					<hr id="comment_line">

					<%
						}
					%>
					
					<!-- paging	-->
					<div id="pageList">
						<%
							if (nowPage <= 1) {
						%>
							[이전]&nbsp;
						<%
							} else {
						%>
							<a href="qna_detail.bo?getnum=<%=getnum%>&page=<%=nowPage - 1%>">[이전]</a>&nbsp;
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
							<a href="qna_detail.bo?getnum=<%=getnum%>&page=<%=a%>">[<%=a%>]
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
							<a href="qna_detail.bo?getnum=<%=getnum%>&page=<%=nowPage + 1%>">[다음]</a>
						<%
							}
						%>
					</div>
					<%
						} else if (listCount == 0) { //등록된 댓글이 없을때
					%>
					<div id="null_comment">등록된 댓글이 없습니다</div>
					<%
						}
					%>
				</div>
			</div>
		</section>
	</form>
</body>
</html>