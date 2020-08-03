<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.jachi.DAO.*" %>
<%@page import="com.jachi.DTO.*" %>
<%request.setCharacterEncoding("UTF-8");%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <%
  String us_id = request.getParameter("id");
  String us_pw = request.getParameter("pw");
  String us_name = request.getParameter("name");
  String us_nkname = request.getParameter("nick");
  String Year = request.getParameter("year");
  String Month = request.getParameter("month");
  String Day = request.getParameter("day");
  String us_birth = Year + "-" + Month + "-" + Day;
  String Phone1 = request.getParameter("phon1");
  String Phone2 = request.getParameter("phon2");
  String Phone3 = request.getParameter("phon3");
  String us_tel = Phone1 + "-" + Phone2 + "-" + Phone3;
  String us_telagr = request.getParameter("sms_agree");
  String Email1 = request.getParameter("email1");
  String Email2 = request.getParameter("email2");
  String us_mail = Email1 + "@" + Email2;
  String us_mailagr = request.getParameter("email_agree");
  String Postcode = request.getParameter("postcode");
  String Addr1 = request.getParameter("addr1");
  String Addr2 = request.getParameter("addr2");
  String Addr3 = request.getParameter("addr3");
  String us_adr = Postcode + "/"  + Addr1 + "/" + Addr2 + "/" + Addr3;
  
  UserinfoDTO user_dto = new UserinfoDTO();
  
  user_dto.setUs_id(us_id);
  user_dto.setUs_pw(us_pw);
  user_dto.setUs_name(us_name);
  user_dto.setUs_nkname(us_nkname);
  user_dto.setUs_birth(us_birth);
  user_dto.setUs_tel(us_tel);
  user_dto.setUs_telagr(us_telagr);
  user_dto.setUs_mail(us_mail);
  user_dto.setUs_mailagr(us_mailagr);
  user_dto.setUs_adr(us_adr);
  
  
  UserDAO userDAO = UserDAO.getinstance();
  SqlSessionFactory factory = UserDAO.getConn();
  SqlSession sqlsession = factory.openSession();
  sqlsession.insert("userinfo_insert", user_dto);
  sqlsession.commit();
  sqlsession.close();
  
  response.sendRedirect("QnA_view_bbs.jsp");
 %>
 
</body>
</html>