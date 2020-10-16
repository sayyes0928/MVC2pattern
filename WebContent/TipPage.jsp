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
  
  String us_id = (String)session.getAttribute("us_id");
  
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>tipPage</title>

<link rel="stylesheet" href="./myhome.web.css/tip.css" type="text/css">
<link rel="stylesheet" type="text/css"
   href="./myhome.web.css/scrapbook_1.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script src="./myhome.web.js/teamTopnav.js"></script>
</head>
<script>
  function login(){
	  alert("로그인이 필요합니다.");
	  location.href = "LoginFormpage.bo"
  }
</script>
<body>
	<form id="contentPage" >
	        <!-- header -->
	    <jsp:include page="HeaderTestjsp.jsp"></jsp:include>
		<section>

			<div id="tip_banner"><div id="banner_text">TIP & INFORMATION</div></div>
			<div id="s_wrap">
				<div id="section_header">
					<div id="page_title">전문가 Tip</div>
					<%if(us_id != null){%>					
					 <input id="tipBT_write" type="button" value="글쓰기"
						 onclick="location.href='Tip_write.jsp'">
					<%}else{ %>
					  <input id="tipBT_write" type="button" value="글쓰기"
						 onclick="login()">
					<%} %>
					
				</div>
				<div id="tip_list">				
				  <% if(tip_article.size() != 0){
					  
                      for(int i=0; i<tip_article.size(); i++){ %>
                                    
					<div class="tip_card">
						<button type="button">
							<img src="./img/myhome/icons8-bookmark-50-2.png">
						</button>
						<a href="tip_detail.bo?tip_num=<%= tip_article.get(i).getTip_num()%>">
						<img
							src="<%=request.getContextPath()%>/upload/<%=tip_article.get(i).getTip_coverimg()%>" id="tip_img">
						<ul>
							<li id="card_title"><%=tip_article.get(i).getTip_title() %></li>
							<li id="card_nickname">by <%=tip_article.get(i).getTip_nickname() %></li>
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
		<jsp:include page="include_footer.jsp"></jsp:include>
	</form>
</body>
</html>