<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.jachi.DTO.TipDTO"%>
    <%
      ArrayList<TipDTO> tip_detail = (ArrayList<TipDTO>)request.getAttribute("tipdetail");
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
 	<header>
        <div id="h_wrap">
          <div class="h_div">
         
        <h1>자취해보자</h1>
              </div>
         
       <%
       String us_id = (String)session.getAttribute("us_id"); //로그인 유무 확인
       if(us_id==null){
     %>
            <ul class="login_go">
              <li><a href="LoginFormpage.bo">로그인</a></li>
              <li><span> | </span></li>
              <li><a href="join.bo">회원가입</a></li>
            </ul>
      

     <%
       }else{
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
            <li>
              <a href="Index.jsp"><span>홈</span></a>
            </li>
            <li>
              <a href="storeList.bo"><span>스토어</span></a>
            </li>
            <li>
              <a href="beauty.bo"><span>커뮤니티</span></a>
            </li>
            <li>
              <a href="#"><span>자취에대한 모든것</span></a>
            </li>

            <li>
              <a href="#"><span>고객센터</span></a>
            </li>
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
                      <li><a href="tiplist.bo">자취생TIP</a></li>
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
        <div class="detail_coverimg"><img src="<%=request.getContextPath()%>/upload/<%=tip_detail.get(0).getTip_coverimg()%>"></div>
        <div id="detail">         
             <div class="detail_header">
               <div class="category">카테고리 예정 시공정보</div>
               <div class="tiptitle"><%=tip_detail.get(0).getTip_title()%></div>
               <div class="author_header">
                  <div class="author_img"><img src="upload/t1.PNG"></div>
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
                  <input name="tip_num" type="hidden" value="<%=tip_detail.get(0).getTip_num()%>">
                  <input name="user_nickname" type="hidden" value="<%=tip_detail.get(0).getTip_nickname()%>">
                  <input name="user_img" type="hidden" value="11">
                  <div class="comment_imgbox"><img src="#"></div>
                  <div class="comment_textbox">
                    <input class="comment_text" type="text" name="reply_post" placeholder="칭찬과 격려의 댓글은 작성자에게 큰 힘이 됩니다 :)">
                    <input class="comment_write_btn" type="submit" value="등록">
                  </div>
                <table>
                 <tr>
                   <td>
                     <img src="#">
                   <td>
                 </tr>
                </table>
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