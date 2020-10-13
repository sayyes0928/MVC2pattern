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
		ArrayList<String[]> list = (ArrayList<String[]>) session.getAttribute("cart");
		String[] pro_all = request.getParameterValues("Pro_all");
		String[] pro_count = request.getParameterValues("Pro_count");
		//String pro_all = request.getParameter("Pro_all");
		//String pro_count = request.getParameter("Pro_count");
		String pro_price = request.getParameter("Pro_price");
		String pro_code = request.getParameter("Pro_code");
		String pro_img = request.getParameter("Pro_img");
		

		//pro_all[0]

		//{pro_all[0],pro_count[0].toString(),pro_price,pro_code};

		if (list == null) {
			//
			ArrayList<String[]> cartlist = new ArrayList<String[]>();
			for (int i = 0; i < pro_all.length; i++) {
				String pro_group[] = new String[5];
				String product_option = pro_all[i];
				String product_count = pro_count[i].toString();
				pro_group[0] = product_option;
				pro_group[1] = product_count;
				pro_group[2] = pro_price;
				pro_group[3] = pro_code;
				pro_group[4] = pro_img;
				cartlist.add(pro_group);
			}

			session.setAttribute("cart", cartlist);
		} else {

			for (int i = 0; i < pro_all.length; i++) {
				String pro_group[] = new String[5];
				String product_option = pro_all[i];
				String product_count = pro_count[i].toString();
				pro_group[0] = product_option;
				pro_group[1] = product_count;
				pro_group[2] = pro_price;
				pro_group[3] = pro_code;
				pro_group[4] = pro_img;
				list.add(pro_group);
			}

			session.setAttribute("cart", list);
		}
	%>

	<%
		ArrayList<String[]> Cart = (ArrayList<String[]>) session.getAttribute("cart");
	%>



</body>
</html>