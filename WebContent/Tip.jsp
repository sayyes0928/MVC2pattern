<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="./myhome.web.css/teamTopNav.css" type="text/css">
</head>
<body>
  <form>
 		<header>
        <div id="h_wrap">
          <div class="h_div">
         
        <h1>�����غ���</h1>
              </div>
         
       <%
       String us_id = (String)session.getAttribute("us_id"); //�α��� ���� Ȯ��
       if(us_id==null){
     %>
            <ul class="login_go">
              <li><a href="LoginFormpage.bo">�α���</a></li>
              <li><span> | </span></li>
              <li><a href="join.bo">ȸ������</a></li>
            </ul>
      

     <%
       }else{
     %>
            <ul class="login_go">
              <li><span></span></li>
              <li><a href="MypageOrderView.bo">����������</a></li>
              <li><span> | </span></li>
              <li><a href="logoutActionPage.jsp">�α׾ƿ�</a></li> 
            </ul>
        
       

     <%
       }
     %>
          <div id="main_nav">
          <ul>
            <li>
              <a href="Index.jsp"><span>Ȩ</span></a>
            </li>
            <li>
              <a href="storeList.bo"><span>�����</span></a>
            </li>
            <li>
              <a href="beauty.bo"><span>Ŀ�´�Ƽ</span></a>
            </li>
            <li>
              <a href="#"><span>���뿡���� ����</span></a>
            </li>

            <li>
              <a href="#"><span>������</span></a>
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
                      <li><a href="#">ī�װ�</a></li>
                      <li><a href="#">����Ʈ</a></li>
                      <li><a href="#">Ư��</a></li>
                    </ul>
                  </li>
                  <li>
                    <ul class="m_line">
                      <li><a href="#">�����ڶ�</a></li>
                      <li><a href="#">�����ڶ�</a></li>
                      <li><a href="#">������������</a></li>
                    </ul>
                  </li>
                  <li>
                    <ul class="m_line">
                      <li><a href="tiplist.bo">�����TIP</a></li>
                      <li><a href="#">�����QnA</a></li>
                      <li><a href="#">ȥ�䷹����</a></li>
                    </ul>
                  </li>
                  <li>
                    <ul class="m_line">
                      <li><a href="#">�������亯</a></li>
                      <li><a href="#">��������</a></li>
                    </ul>
                  </li>
                </ul>
              </nav>
            </div>
          </div>
        </div>   
      </header>
      <section>
      
      </section>
     </form>
</body>
</html>