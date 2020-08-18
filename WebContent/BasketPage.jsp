<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%  
  ArrayList<String[]> list = (ArrayList<String[]>)session.getAttribute("cart");
  String pro_all = request.getParameter("Pro_all");
  String pro_count = request.getParameter("Pro_count");
  String pro_price = request.getParameter("Pro_price");
  String pro_group[] = {pro_all, pro_count, pro_price};
  
if(list.get(0) == null){
  ArrayList<String[]> cartlist = new ArrayList<String[]>();
  cartlist.add(pro_group);
  session.setAttribute("cart", cartlist);
} else{

	list.add(pro_group);
	session.setAttribute("cart", list);
}
  
%>

<%ArrayList<String[]> Cart = (ArrayList<String[]>)session.getAttribute("cart"); %>
<% 
   out.print(Cart.get(0)[0]);
%> 
  
</body>
</html>