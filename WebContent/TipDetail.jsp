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
 		
      <section>
        <div id="swrap">
          <div id="detail_cover">
             <img src="<%=request.getContextPath()%>/upload/<%=tip_detail.get(0).getTip_coverimg()%>">
             <p>[커버이미지 : <%=tip_detail.get(0).getTip_nickname()%>님의 스타일링샷]</p>
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
        </div>
      </section>
     </form>
</body>
</html>