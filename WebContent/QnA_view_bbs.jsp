<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="mybatis.java.dao.UserDAO" %>
<%@page import="mybatis.java.dto.QnABBS" %>
<% request.setCharacterEncoding("UTF-8");%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />

    <link rel="stylesheet" type="text/css" href="teamTopNav.css" />
    <link rel="stylesheet" type="text/css" href="teamBBS.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <title>QnA</title>
  </head>
  <body>
  <% 
 String us_id = (String)session.getAttribute("us_id");
 SqlSessionFactory sqlfactory = UserDAO.getConn();
 SqlSession sqlsession = sqlfactory.openSession();
 List<QnABBS> selectList = sqlsession.selectList("select_QnA");

%>
  
      <form action="QnA_wirte_bbs.jsp" method="get">
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
                if(us_id == null){
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
             <li><span><%= us_id %></span></li>
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
              <li><a href="teampro_myhome.html"><span>자취에대한 모든것</span></a>
              <li><a href="teampro_myhome.html"><img src="jachievery.PNG" width="55" height="55"
              onmouseover="this.src='everyicon.svg'" onmouseout="this.src='jachievery.PNG'"></a>
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
        
            <div id="m_wrap">
              <div class="QnA_container">
                <aside>
                  <div id="QnA_container_banner"></div>
                </aside>
                <div id="QnA_container_bbs_table">
                
                  <table class="table table-hover">
                    <tr class="QnA_container_bbs_table_title">
                      <td class="QnA_container_bbs_table_title_no">No.</td>
                      <td class="QnA_container_bbs_table_title_title">Title</td>
                      <td class="QnA_container_bbs_table_title_writer">Writer</td>
                      <td class="QnA_container_bbs_table_title_comment">Comment</td>
                      <td class="QnA_container_bbs_table_title_date">Date</td>
                    </tr>
                    
                  <% 
                  if(selectList.size()>0){
                  for(int i = 0; i <selectList.size(); i++ ){ 
                	  String userNick = sqlsession.selectOne("select_get_us_nkname",selectList.get(i).getQna_nickname());
             
                	
      
                	  %>
                    <tr class="active">
                      <td class="QnA_container_bbs_table_title_no"><%= selectList.get(i).getQna_num()%></td>
                      <td class="QnA_container_bbs_table_title_pre"><a href="QnA_view_content.jsp?qna_num=<%= selectList.get(i).getQna_num()%>"><%= selectList.get(i).getQna_title()%></a></td>
                      <td class="QnA_container_bbs_table_info"><%= userNick%></td>
                      <td>4</td>
                      <td class="QnA_container_bbs_table_info"><%= selectList.get(i).getQna_time()%></td>
                    </tr>
                  <%
                  } }else{
                	out.print("글없음");  
                  
                  }
                  %>
                  <tr>
                  <td colspan="5"><input type="button" style="float:right" value="글쓰기" onclick="location.href='QnA_wirte_bbs.jsp'" ></td>
                  </tr>
                  </table>
                
                </div>
              </div>
            </div>
        <footer>
          <div></div>
        </footer>
      </form>
  </body>
</html>
