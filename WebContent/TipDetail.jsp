<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.jachi.DTO.TipDTO"%>
    <%
      ArrayList<TipDTO> tip_detail = (ArrayList<TipDTO>)request.getAttribute("tipdetail");
      
      String us_id = (String)session.getAttribute("us_id");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tip 상세페이지</title>
<link rel="stylesheet" href="./myhome.web.css/teamTopNav.css" type="text/css">
<link rel="stylesheet" href="./myhome.web.css/TipDetail.css" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<script>

/*function add(){
	var tip_num = $('#tip_num').val();
	var tip_nickname = $('#tip_nickname').val();
	var tip_coverimg = $('#tip_coverimg').val();
	var rep_post = $(".comment_text").val();

	$(document).ready(function() {	
	$.ajax({
		url: 'tip_reply_write.bo',
		data: {
			'Tip_num' : tip_num,
			'Tip_nickname' : tip_nickname,
			'Tip_coverimg' : tip_coverimg,
			'Rep_post' : rep_post,
			
		},
		success: function (req){
			alert("댓글이 등록되었습니다.");
		}
	});
  });
	
  $(".comment_text").val('');
}*/

</script>
<body>
  <form action="tip_reply_write.bo">
 	  <!-- header -->
	  <jsp:include page="HeaderTestjsp.jsp"></jsp:include>
      <section>
        <div class="detail_coverimg"><img src="<%=request.getContextPath()%>/upload/<%=tip_detail.get(0).getTip_coverimg()%>"></div>
        <div id="detail">         
             <div class="detail_header">
               <div class="category">카테고리 예정 시공정보</div>
               <div class="tiptitle"><%=tip_detail.get(0).getTip_title()%></div>
               <div class="author_header">
                  <div class="author_img"><img src="<%=request.getContextPath()%>/upload/<%=tip_detail.get(0).getTip_img()%>"></div>
                  <p><%=tip_detail.get(0).getTip_nickname()%></p>
                  <p><%=tip_detail.get(0).getTip_date()%></p>
               </div>
             </div>
             <div class="detail_post">
                    게시물 내용      
             </div>
             <div class="comment">
                <hr>
                <p>댓글</p>
                <div class="comment_form">
                  <div class="comment_imgbox"><img src="https://image.ohou.se/i/bucketplace-v2-development/uploads/default_images/avatar.png?gif=1&amp;w=36&amp;webp=1"></div>
                  <div class="comment_textbox">
                    <input class="comment_text" type="text" name="reply_post" placeholder="칭찬과 격려의 댓글은 작성자에게 큰 힘이 됩니다 :)">
                  <%if(us_id != null){ %>
                    <input name="tip_num" type="hidden" value="<%=tip_detail.get(0).getTip_num()%>">
                    <input name="us_id" type="hidden" value="<%= us_id%>">
                    <input class="comment_write_btn" type="submit" value="등록">
                  <%}else{ %>
                    <input class="comment_write_btn" type="button" value="등록" onclick="login()">
                  <%} %>
                  </div>
                </div>
                 
        <script>
         function login(){
        	 alert("로그인이 필요합니다.");
        	 location.href = "LoginFormpage.bo"
         }
        </script>    
             
                <div class="comment_list">
                  <div class="comment_author_img"><img src="#"></div>
                  <p>내용</p>
                  <ul class="comment_list_feed">
                   <li>날짜</li>
                   <li>삭제버튼</li>
                  </ul>
                </div>
               
             </div>
         </div> 
          <div id="detail_sidebar">
        </div>
      </section>
      <footer>
       푸터
      </footer>
     </form>
</body>
</html>