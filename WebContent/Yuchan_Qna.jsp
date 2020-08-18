<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.jachi.DTO.QnABBS"%>
<%@ page import="com.jachi.DTO.PageInfo"%>



<%String b = (String)session.getAttribute("us_id");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./myhome.web.css/teamTopNav.css" type="text/css">
<link rel="stylesheet" href="./Teamcss/Yuchan_Qna.css" type="text/css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0-alpha1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/typed.js/1.1.1/typed.min.js"></script>


	
</script>

<script>
$(function(){
	$(".typed").typed({
		strings:["질문해주세요 :)", "답변해드립니다 :D"],
		// Optionally use an HTML element to grab strings from (must wrap each string in a <p>)
		stringsElement: null,
		// typing speed
		typeSpeed: 10,
		// time before typing starts
		startDelay: 1200,
		// backspacing speed
		backSpeed: 8,
		// time before backspacing
		backDelay: 800,
		// loop
		loop: true,
		// false = infinite
		loopCount: true,
		// show cursor
		showCursor: false,
		// character for cursor
		cursorChar: "|",
		// attribute to type (null == text)
		attr: null,
		// either html or text
		contentType: 'html',
		// call when done callback function
		callback: function() {},
		// starting callback function before each string
		preStringTyped: function() {},
		//callback for every typed string
		onStringTyped: function() {},
		// callback for reset
		resetCallback: function() {}
	});
});
</script>

<script>
$(function(){
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
	<form name="go" action="NewFile.jsp" >
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
				<input type="text" name="input" class="input" id="search-input">
  <button type="reset" class="search" id="search-btn"></button>
			</div>
			
			</div>
			<div id="s_fullsize">
				<div id="write_btsize">
					<input type="button" value="질문하기" id="qna_write_bt">
					</div>

					<%if(b!=null){%>
					<a id="bta" href="qnainsert.jsp"><input type=button value="글쓰기"
						class="button2"></a>
					<%}else{}%>
	
				<div id="qna_body">
					<!-- 

SqlSession sqlsession = sqlfactory.openSession();
List<Qna_dto> sl2 = sqlsession.selectList("pr_select");
sqlsession.close();
for(int i=0; i<sl2.size(); i++){
-->
					<hr id="post_hr">
					
					<table id="tb">
<!-- 						<tr> -->
							<td colspan="5"><a id="title_tag" href="readpost.jsp?all_post=  ">
									<span id="qna_posttitle">제목</span>
							</a></td>
							<td id="qna_table_ctr">
							<span><a>수정</a>  |  <a>삭제</a></span>
							</td>
						</tr>
						<tr>
							<td colspan="5" id="post">
								<!-- 내용들어갈거임 -->내용
							</td>

						</tr>
						<tr id="ps_bt">
							<td><img src="The_1975.jpg" class="img-circle"><span>
									<!-- 게시물번호 -->게시물번호
							</span> <span>
									<!-- 닉네임 -->닉네임
							</span>
							<!-- 시간 -->시간
								<span></span><span></span></td>

						</tr>
					</table>
					<hr>

				</div>


			</div>
		</section>
	</form>
</body>
</html>