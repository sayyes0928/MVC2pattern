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
	        <!-- header -->
	    <jsp:include page="HeaderTestjsp.jsp"></jsp:include>
		<section>

			<div id="tip_banner">Tip 배너</div>
			<div id="s_wrap">
				<div id="section_header">
					<div id="page_title">집들이 Tip</div>
					<input id="tipBT_write" type="button" value="글쓰기"
						onclick="location='Tip_write.jsp'">
				</div>
				<%=tip_article.size() %>
				<div id="tip_list">				
				  <% if(tip_article.size() != 0){
					  
                      for(int i=0; i<tip_article.size(); i++){ %>
                                    
					<div class="tip_card">
						<button type="button">
							<img src="./img/myhome/icons8-bookmark-50-2.png">
						</button>
						<a href="tip_detail.bo?tip_num=<%= tip_article.get(i).getTip_num()%>">
						<img
							src="<%=request.getContextPath()%>/upload/<%=tip_article.get(i).getTip_coverimg()%>">
						<ul>
							<li id="card_title"><%=tip_article.get(i).getTip_title() %></li>
							<li id="card_nickname"><%=tip_article.get(i).getTip_nickname() %></li>
							<li id="count">조회수</li>
							<li id="scrap">스크랩</li>
						</ul>
						</a>
					</div>
                    <%
                        }
                      }else{
                    %>
                   
                    <span class="null_tipboard">등록된 글이 없습니다.</span>
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