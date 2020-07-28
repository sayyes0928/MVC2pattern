<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
 
 SqlSessionFactory sqlfactory = UserDAO.getConn();
 SqlSession sqlsession = sqlfactory.openSession();
 
 List<QnABBS> selectList = sqlsession.selectList("select_QnA_content",qna_num);
%>
  
      <form action="QnA_UpdateAction_bbs.jsp?qna_num=<%= selectList.get(0).getQna_num() %>" method="get">
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
              <div class="QnA_container">
                <aside>
                  <div id="QnA_container_aside"></div>
                </aside>
                <div id="QnA_container_bbs_table">
                
                  <table>
                    <tr class="QnA_container_bbs_table_title">
                      <td class="QnA_container_bbs_table_title_no">No.</td>
                      <td class="QnA_container_bbs_table_title_title">Title</td>
                      <td class="QnA_container_bbs_table_title_writer">Writer</td>
                      <td class="QnA_container_bbs_table_title_comment">Comment</td>
                      <td class="QnA_container_bbs_table_title_date">Date</td>
                    </tr>
 
                    <tr>
                     <td><input type="text" value=<%= selectList.get(0).getQna_num() %> readonly name="qna_num"/></td>
                     <td><input type="text" value=<%= selectList.get(0).getQna_title() %> name="qna_title"/></td>
                     <td><input type="text" value=<%= selectList.get(0).getQna_post()%> name="qna_post"/></td>
                    </tr>
                    <tr>
                     <td>

                     </td>
                    </tr>
                  <tr>
                  <td><input type="submit" value="수정완료"></td>
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
