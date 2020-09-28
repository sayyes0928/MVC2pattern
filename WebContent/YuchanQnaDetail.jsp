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

<link rel="stylesheet" href="./Teamcss/Yuchanqnadetail.css"
	type="text/css">
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

<script>
	function reply_ok(testnum){
		console.log(testnum);
		console.log(<%=getnum%>);
		location.href = "qna_commentreplyselectList.bo?getnum="+<%=getnum%>+"&getconum="+testnum;
	}
</script>

<script>

	function md(num){
		
			$('#comment_content'+num).css('display','none');
			$('#commnet_number'+num).css('display','none');
			$('#comment_date'+num).css('display','none');
			$('#comment_reply'+num).css('display','none');
			$('#comment_delete'+num).css('display','none');
			$('test'+num).css('display','none');
			$('#modify_text'+num).css('display','inline');
			$('#modify_text'+num).focus();
			$('#modify_bt'+num).css('display','inline');
	
	}

</script>
</head>
<body>
	<!-- Header include -->
	<jsp:include page="HeaderTestjsp.jsp"></jsp:include>

	<form action="qna_commentwrite.bo" method="post">

		<section>
			<div id="qna_detail_postsize">
				<div id="qna_titlenamesize">
					<a href="#" id="qna_titlename">질문과 답변</a>
					<hr id="title_hr">
				</div>
				<div id="qna_post_titlesize"><%=qna_detail.get(0).getQna_title()%></div>
				
				<div id="qna_post_picsize">
					<img
						src="<%=request.getContextPath()%>/upload/<%=qna_detail.get(0).getQna_pw()%>">
				</div>
				<div id="qna_post_postingsize"><%=qna_detail.get(0).getQna_post()%></div>
				<div id="qna_post_timesize">
					글쓴시간:<%=qna_detail.get(0).getQna_time()%></div>
				<hr id="qna_post_line">

			</div>


			<div id="qna_asidesize">
				<span> <img
					src="<%=request.getContextPath()%>/upload/<%=qna_detail.get(0).getQna_img()%>"
					id="profile_img">
				</span> <span id="writer_name"> <%=qna_detail.get(0).getQna_nickname()%>
				</span>
			</div>

<div id="qna_post_replysize">
				<div id="reply_title_size">Comments</div>
				<%
					if (us_id != null) {
				%>
				<input type="text" id="reply_inner_text" value="댓글을 입력해주세요"
					name="comment_post"></input><input type="submit"
					value="등록" id="reply_button"><br>  <input type="hidden"
					value="<%=qna_detail.get(0).getQna_num()%>" name="getnum">
				<%
					} else {
				%>
				<input type="text" id="reply_inner_text_null" value="로그인후 댓글 달기"
					name="comment_post" readonly></input>
				<%
					}
				%>

				<span id="comment_count">댓글수 :</span>
				<%=listCount%>
				<div id="comment_size">
					<%
						if (listCount > 0) {
							for (int k = 0; k < qna_list.size(); k++) {
					%>

					<span><img
						src="<%=request.getContextPath()%>/upload/<%=qna_list.get(k).getQc_img()%>"
						id="comment_profileimg"></span> <span id="comment_id"><%=qna_list.get(k).getQc_nickname()%></span><br>
					<div id="comment_content<%=k%>"><%=qna_list.get(k).getQc_content()%></div>
					<span id="commnet_number<%=k%>">글번호: <%=qna_list.get(k).getQc_num()%></span>
					<span id="comment_date<%=k%>"><%=qna_list.get(k).getQc_date()%></span>
					<span><input type="button" class="comment_modify" id="comment_reply<%=k%>" value="수정" onclick="md(<%=k%>)"></span><span>
						<a href="qna_comment_delete.bo?renum=<%=qna_list.get(k).getQc_num()%>&postnum=<%=qna_list.get(k).getQcb_num() %>" class="comment_modify" id="comment_delete<%=k%>">삭제</a>
					</span><span> <input type="button" value="답글"
			onclick="aaa(<%=k%>)" id="test<%=k%>" class="re_bt"></span>
			
					<input type="text" id="modify_text<%=k%>" class="modify_text"><input type="button" id="modify_bt<%=k%>" value="수정" class="modify_bt">
			
			
			
					<div class="reply_size" id="reply_size<%=k%>">
						<input type="text" id="reply_txt<%=k %>" class="reply_txt"
							name="reply_txt<%=k %>"> <input type="button" value="등록" id="re_okbt<%=k %>" onclick="reply_ok(<%=qna_list.get(k).getQc_num()%>)">
					</div>
					<hr id="comment_line">
<!-- 						<div id="reply_reply_size"> -->
<%-- 							<span><img src="<%=request.getContextPath()%>/upload/<%=reply.get(0).getReplyimg()%>"></span><span>아이디</span><br> --%>
<!-- 							<div>콘텐츠</div> -->
<!-- 							<span>글번호</span><span>날짜</span><span>수정</span><span>삭제</span> -->
<!-- 						</div> -->
					<%
						}
					%>
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
						} else if (listCount == 0) {
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