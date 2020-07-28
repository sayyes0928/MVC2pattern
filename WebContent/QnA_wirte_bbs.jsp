<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.jachi.DAO.BoardDAO" %>
<%@page import="com.jachi.DTO.QnABBS" %>
<%@ page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("UTF-8");%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" type="text/css"href="teamTopNav.css" />
    <link rel="stylesheet" type="text/css"href="teamBBS.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>



    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"
    />
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"
    />
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <title>QnA</title>
  </head>
  <body>
  <% 
  String us_id =(String)session.getAttribute("us_id");
  if (us_id == null) { 
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요.')");
		script.println("location.href = 'loginPage.jsp'");
		script.println("</script>");
  }
 
 %>
  
      <form id="QnA_writePage" action="QnA_write_ActionPage.jsp" method="get">
        <header>
        <div id="h_wrap">
            <div class="h_div"></div>
            <div class="h_div">
              <h1>자취해보자</h1>
            </div>
            <div class="h_div">
              <ul style="margin: 25px 30px 0 0;">
                <img src="img/top/top_nav.png" />
              </ul>
              <div class="serch">
              </div>
            </div>
        </div>
        <div id="nav_hr">
          <nav role="navigation" class="primary-navigation">
            <ul id="m_line">
              <li><span>홈</span></li>
              <li><a href="teampro_ver_01_1.html"><span>스토어</span></a>
                <ul class="dropdown">
                  <li><a href="#">홈</a></li>
                  <li><a href="#">카테고리</a></li>
                  <li><a href="#">베스트</a></li>
                  <li><a href="#">특가</a></li>
                </ul>
              </li>
              <li><a href="teampro_myhome.html"><span>마이홈</span></a>
                <ul class="dropdown">
                  <li><a href="#">홈</a></li>
                  <li><a href="#">내방자랑</a></li>
                  <li><a href="#">내집자랑</a></li>
                  <li><a href="#">전문가집들이</a></li>
                </ul>
              </li>
              <li><span>자취에대한 모든것</span>
                <ul class="dropdown">
                  <li><a href="#">홈</a></li>
                  <li><a href="#">자취생TIP</a></li>
                  <li><a href="#">자취생QnA</a></li>
                  <li><a href="#">혼밥레시피</a></li>
                </ul>
              </li>
              <li><span>고객센터</span>
                <ul class="dropdown">
                  <li><a href="#">질문과답변</a></li>
                  <li><a href="#">공지사항</a></li>
                </ul>
              </li>
            </ul>
          </nav>
        </div>
        </header>
            <div id="m_wrap">
              <div>
      <table>
        <tr>
          <td>제목</td>
          <td>
            <input
              type="text"
              name="QnA_title"
              placeholder="제목을 입력하세요"
            />
          </td>
        </tr>
        <tr>
          <td>내용</td>
          <td>
            <textarea
              name="QnA_content"
              id="QnA_content"
              placeholder="내용을 입력하세요"
            ></textarea>
          </td>
        </tr>
        <tr>
          <td><input type="submit" value="등록" /></td>
        </tr>
      </table>
    </div>
            </div>
        <footer>
          <div></div>
        </footer>
      </form>
  </body>
</html>
