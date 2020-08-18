<%@page import="com.jachi.DTO.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.jachi.DTO.TipDTO"%>
<%
  ArrayList<TipDTO> tip_article = (ArrayList<TipDTO>)request.getAttribute("tiparticle");
  PageInfo page_article = (PageInfo)request.getAttribute("pageinfo");
  
  int ListCount = page_article.getListCount();
  int NowPage = page_article.getPage();
  int MaxPage = page_article.getMaxPage();
  int StartPage = page_article.getStartPage();
  int EndPage = page_article.getEndPage();
  
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>tip</title>
<link rel="stylesheet" href="./myhome.web.css/teamTopNav.css" type="text/css">
<link rel="stylesheet" href="./myhome.web.css/tip.css" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script src="./myhome.web.js/teamTopnav.js"></script>
</head>
<body>
	<form id="contentPage" >
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

			<div id="tip_banner">Tip 배너</div>
			<div id="s_wrap">
				<div id="section_header">
					<div id="page_title">집들이 Tip</div>
					<input id="tipBT_write" type="button" value="글쓰기"
						onclick="location='Tip_write.jsp'">
				</div>
				
				<div id="tip_list">				
				  <% if(tip_article.size() != 0){
					  
                      for(int i=0; i<tip_article.size(); i++){ %>
                                    
					<a href="#"><div class="tip_card">
						<button type="button">
							<img src="./img/myhome/icons8-bookmark-50-2.png">
						</button>
						<img
							src="<%=request.getContextPath()%>/upload/<%=tip_article.get(i).getTip_coverimg()%>">
						<ul>
							<li id="card_title"><%=tip_article.get(i).getTip_title() %></li>
							<li id="card_nickname"><%=tip_article.get(i).getTip_nickname() %></li>
							<li id="count">조회수</li>
							<li id="scrap">스크랩</li>
						</ul>
					</div></a>
                    <%
                        }
                      }else{
                    %>
                    <%=tip_article.size() +","+ tip_article %>
                    <span>등록된 글이 없습니다.</span>
                    <%
                      }
                    %>
				</div>
				<div id="page_button">
		           <%if(NowPage <= 1){ %>
		             [이전]&nbsp;
		           <%}else{ %>
		            <a href="tiplist.bo?page=<%= NowPage-1%>">[이전]</a>&nbsp;
		           <%} %>
		           
		           <%for(int i=StartPage; i<=EndPage; i++){ 
		               if(i == NowPage){ %>
		                 [<%=i %>]
		               <%}else{ %>
		                   <a href="tiplist.bo?page=<%= i%>">[<%=i %>]</a>&nbsp;
		               <%} %>
		           <%} %>
		           <%if(NowPage >= MaxPage){ %>
		           [다음]
		           <%}else{ %>
		           <a href="tiplist.bo?page=<%= NowPage+1%>">[다음]</a>
		           <%} %>
				</div>

			</div>
		</section>
	</form>
</body>
</html>