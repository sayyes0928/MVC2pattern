<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>

<%@page import="javaproject.new_table.Dao.*"%>
<%@page import="javaproject.new_table.Dto.Qna_dto"%>
<%@page import="javaproject.new_table.Dto.User_dto"%>
<%@page import="java.util.List"%>



<%String b = (String)session.getAttribute("us_id");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="NewFile2.css" type="text/css">
<link rel="stylesheet" href="qna_section2.css" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0-alpha1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/typed.js/1.1.1/typed.min.js"></script>

<script type="text/javascript" src="banner.js"></script>

<script type="text/javascript" src="search.js"></script>



<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">


<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


</head>


<body>
	<form name="go" action="NewFile.jsp">
		  <header>
        <div id="h_wrap">
            <div class="h_div_side"></div>
            <div class="h_div">
            <ul>
            <li style="padding-top:110px"><img src="grass2icon.svg" width="30" height="30"/></li>
            <li style="padding-top:80px"><img src="truck2.svg" width="70" height="70"/></li>
            <li><img src="sunicon.svg" width="60" height="60"/></li>
            <li style="padding-top:110px"><img src="grass2icon.svg" width="30" height="30"/></li>
            <li style="padding-top:100px"><img src="grassicon.svg" width="40" height="40"/></li> 
            
            <li><h1>자취해보자</h1></li>
            <li style="padding-top:20px">
             <img src="houseiconcolor.svg" width="100" height="100" onmouseover="this.src='houseicon.svg'" onmouseout="this.src='houseiconcolor.svg'"/>
             </li>
             <li style="padding-top:100px"><img src="grassicon.svg" width="40" height="40"/></li>
             <li style="padding-top:100px"><img src="grassicon.svg" width="40" height="40"/></li> 
             <li style="padding-top:110px"><img src="grass2icon.svg" width="30" height="30"/></li>
            </ul>
            </div>
            <div class="h_div_side">    
             <%
                if(b == null){
              %>
              <ul class="login_go">
              <li><a href="loginPage.jsp" >로그인</a></li>
              <li><span> | </span></li>
              <li><a href="join.jsp">회원가입</a></li>
              </ul>

              <%
              }else{
              %>
              
             <ul class="login_go">
             <li><span><%= b %></span></li>
             <li><span> | </span></li>
             <li><a href="logoutActionPage.jsp" >로그아웃</a></li>
              </ul>
              <%
                }
              %>
            </div>
        </div>
        <script>
  $(function() {
    $('#main_nav ul li').hover(
      function() {
        $(this).addClass('main_navov');
      },
      function() {
        $(this).removeClass('main_navov');
      });
  });
</script>
<script>
  $(function() {
    $('#sub').hide();
    $('#main_nav').hover(function() {
      $(this).parent().find('#sub').slideDown();
      $(this).parent().hover(function() {

      }, function() {
        $(this).parent().find('#sub').slideUp(900);
      });
    });
  });
</script>
<script>
  $(document).ready(function() {
    $('.slider').bxSlider({
     mode:'horizontal',
     auto: true,
     speed: 600,
     pause: 4000
    });
  });
</script>
         <div id="main_nav">
            <ul>
              <li><a href="teampro_ver_01_1.html"><span>홈</span></a>
              <li><a href="teampro_ver_01_1.html"><span>스토어</span></a>
              <li><a href="teampro_myhome.html"><span>마이홈</span></a>
              <li><a href="teampro_myhome.html"><span>자취에대한 모든것</span></a>
              <li><a href="teampro_myhome.html"><span>고객센터</span></a>
            </ul>
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
			<h1>무엇이든 <span class="typed"></span></h1>
		</div>
	</div>
</div>
				</div>
			</div>
			<div id="s_fullsize">
				<div id="qna_size">




					<%if(b!=null){%>
					<a id="bta" href="qnainsert.jsp"><input type=button value="글쓰기"
						class="button2"></a>
					<%}else{}%>
					<hr id="qna_hr">
				</div>


				<div id="qna_body">
					<%
SqlSessionFactory sqlfactory = Dao.daopr();
SqlSession sqlsession = sqlfactory.openSession();
List<Qna_dto> sl2 = sqlsession.selectList("pr_select");
sqlsession.close();
for(int i=0; i<sl2.size(); i++){
%>
					<hr id="post_hr">
					<table id="tb">
						<tr>
							<td colspan="5"><a
								href="readpost.jsp?all_post=<%=sl2.get(i).getQna_num()%>">
									<h2><%=sl2.get(i).getQna_title()%></h2>
							</a></td>
						</tr>
						<tr>
							<td colspan="5" id="post"><%=sl2.get(i).getQna_post()%></td>

						</tr>
						<tr id="ps_bt">
							<td><img src="The_1975.jpg" class="img-circle"><span><%=sl2.get(i).getQna_num()%></span>
								<span><%=sl2.get(i).getQna_nickname()%></span><%=sl2.get(i).getQna_time()%><span></span><span></span></td>

						</tr>
					</table>
					<hr>
					<%
				}
				%>
				</div>


			</div>
		</section>
	</form>
</body>
</html>