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
</head>
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
    <!--      <div id="swrap">
          <div id="detail_cover">
             <img src="<%=request.getContextPath()%>/upload/<%=tip_detail.get(0).getTip_coverimg()%>">
             <div class="cover_info">[커버이미지 : <%=tip_detail.get(0).getTip_nickname()%>님의 스타일링샷]</div>
             <div id="tip_post">
              팁 내용
             </div>
             <div id="tip_comment">
              댓글       <br/> 
              <table>
                  <th>
                    <td><img src="#"></td>
                    <td>
                      <div>
                        <input name="tip_reply_post" type="text">
                        <input type="submit" value="등록">
                      </div>
                    </td>
                  </th>
              </table>
             </div>
          </div>
          <div id="user_action">
                 <p>제목</p>
                 <p>게시물 시간</p>
                 <div class="scrapBT_list">
                   <span>좋아요</span>&nbsp;
                   <span>스크랩</span>
                   <span><input type="button" value="수정하기"></span>
                   <span><input type="button" value="등록하기"></span>
                 </div>
          </div>
        </div> -->
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
                <img src="#">
                <span><input type="text" placeholder="칭찬과 격려의 댓글은 장석자에게 큰 힘이 됩니다 :)"></span>
             </div>
         </div> 
          <div id="detail_sidebar"> 
        </div>
      </section>
      <footer>
       푸터당, 헤이트 : 200
      </footer>
     </form>
</body>
</html>