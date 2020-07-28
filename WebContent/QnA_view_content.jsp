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
 String us_id = (String)session.getAttribute("us_id");
 String qna_num_not = request.getParameter("qna_num");
 
 Integer qna_num = Integer.parseInt(qna_num_not);
 
 QnABBS qnaDTO = new QnABBS();
 qnaDTO.setQna_num(qna_num);
 
 UserDAO userDAO = UserDAO.getinstance();
 SqlSessionFactory sqlfactory = UserDAO.getConn();
 SqlSession sqlsession = sqlfactory.openSession();
 List<QnABBS> selectList = sqlsession.selectList("select_QnA_content",qna_num);
%>
  
      <form action="QnA_wirte_bbs.jsp" method="get">
        <header>
        <div id="h_wrap">
            <div class="h_div"></div>
            <div class="h_div">
              <h1>자취해보자</h1>
            </div>
            <div class="h_div">
              <div class="serch">
               <%
                if(us_id == null){
              %>
              <input type="button" value="로그인" onclick="location.href='loginPage.jsp'"/>
              <input type="button" value="회원가입" onclick="location.href='join.jsp'"/>
              <%
              }else{
              %>
              <%= us_id%>
              <input type="button" value="로그아웃" onclick="location.href='logoutActionPage.jsp'"/>
              <%
                }
              %>
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
              <div class="QnA_container">
                <aside>
                  <div id="QnA_container_aside"></div>
                </aside>
                <div id="QnA_container_bbs_table">
                
                  <table>
                    <tr class="content-border">
                     <td class="QnA_view_content_title"><%= selectList.get(0).getQna_num()%></td>
                     <td><%= selectList.get(0).getQna_title()%></td>
                    </tr>
                    <tr>
                    <td colspan="2" style="height:500px"><%= selectList.get(0).getQna_post()%></td>
                    </tr>
                    <%
                    if(us_id != null){
                     if(us_id.equals(selectList.get(0).getQna_nickname())){
                    %>
                    <tr>
                     <td colspan="2">
                     <input type="button" value="수정" onclick="location.href='QnA_Update_wirte_bbs.jsp?qna_num=<%=qna_num%>'" >
                     <input type="button" value="삭제" onclick="location.href='QnA_Update_wirte_bbs.jsp?qna_num=<%=qna_num%>'" >
                     <input type="button" value="목록" onclick="history.back()" >
                     
                     </td>
                    </tr>
                    <% 
                       }
                    }
                    %>
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
