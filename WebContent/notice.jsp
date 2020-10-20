<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.jachi.DTO.NoticeDTO"%>

<%
ArrayList<NoticeDTO> notice = (ArrayList<NoticeDTO>) request.getAttribute("notice");
String us_id = (String) session.getAttribute("us_id"); //로그인 유무 확인
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice</title>
<link rel="stylesheet" href="./Teamcss/notice.css" type="text/css">
<link rel="stylesheet" type="text/css"
   href="./myhome.web.css/scrapbook_1.css" />
<style>

</style>



</head>
<body>
	<header>
		<jsp:include page="HeaderTestjsp.jsp"></jsp:include>
	</header>

	<section>
		<div id="full_banner">
			<div id="back_text">공지사항</div>
			<div id="back_test2">NOTICE&INFO</div>
		</div>
		<div id="notice_size">
			<div id="faq-title">공지사항</div>


		<%if(notice.size()>0){ %>
			<%for(int i = 0; i < notice.size(); i++){ %>
			<div id="notice_card">
				<div class="faq-content">
					<button class="question" id="que-<%=i%>">
						<span class="notice_num"><%=notice.get(i).getNotice_num() %></span> 
						<span class="no_title"><%=notice.get(i).getNotice_title() %></span>
					</button>
					<div class="answer" id="ans-<%=i%>"><%=notice.get(i).getNotice_post() %></div>
				</div>
				<%} %>
				<%}else{ %>
				등록된 공지사항이 없습니다
				<%} %>




<script>

  const items = document.querySelectorAll('.question');

  function openCloseAnswer() {
    let answerId = this.id.replace('que', 'ans');

    if(document.getElementById(answerId).style.display === 'block') {
      document.getElementById(answerId).style.display = 'none';
    
    } else {
      document.getElementById(answerId).style.display = 'block';
     
    }
  }

  items.forEach(item => item.addEventListener('click', openCloseAnswer));

</script>


			</div>
		</div>

	</section>


	<footer>
	<jsp:include page="include_footer.jsp"></jsp:include>
	 </footer>

</body>
</html>