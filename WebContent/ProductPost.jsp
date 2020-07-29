<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.jachi.DTO.ProductinfoDTO"%>
    <%
    ArrayList<ProductinfoDTO> article = (ArrayList<ProductinfoDTO>)request.getAttribute("article");
  
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 구매페이지</title>
<link rel="stylesheet" href="./myhome.web.css/teamTopNav.css" type="text/css">
<link rel="stylesheet" href="./myhome.web.css/ProdcutPost.css" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript" src ="./myhome.web.js/ProductPost.js"></script>
</head>
<body>
<form>
    <header>
        <div id="h_wrap">
            <div class="h_div_side"></div>
            <div class="h_div">
            <ul>
            <li style="padding-top:110px"><img src="img/grass2icon.svg" width="30" height="30"/></li>
            <li style="padding-top:80px"><img src="truck2.svg" width="70" height="70"/></li>
            <li><img src="sunicon.svg" width="60" height="60"/></li>
            <li style="padding-top:110px"><img src="grass2icon.svg" width="30" height="30"/></li>
            <li style="padding-top:100px"><img src="grassicon.svg" width="40" height="40"/></li> 
            
            <li><h1>자취해보자</h1></li>
            <li style="padding-top:20px">
             <img src="houseiconcolor.svg" width="100" height="100" onmouseover="this.src='houseicon.svg'" onmouseout="this.src='houseiconcolor.svg'"/>
             </li>
             <li style="padding-top:100px"><img src="grassicon.svg" width="40" height="40"/></li>
             <li style="padding-top:100px"><img src="grassicon.svg" width="40" height="40"/></li> 
             <li style="padding-top:110px"><img src="grass2icon.svg" width="30" height="30"/></li>
            </ul>
            </div>
            <div class="h_div_side">    
             <%
               // if(us_id == null){
              %>
              <ul class="login_go">
              <li><a href="loginPage.jsp" >로그인</a></li>
              <li><span> | </span></li>
              <li><a href="join.jsp">회원가입</a></li>
              </ul>

              <%
            //  }else{
              %>
              
             <ul class="login_go">
             <li><span></span></li>
             <li><span> | </span></li>
             <li><a href="logoutActionPage.jsp" >로그아웃</a></li>
              </ul>
              <%
              //  }
              %>
            </div>
        </div>
        <script>
  $(function() {
    $('#main_nav ul li').hover(
      function() {
        $(this).addClass('main_navov');
      },
      function() {
        $(this).removeClass('main_navov');
      });
  });
</script>
<script>
  $(function() {
    $('#sub').hide();
    $('#main_nav').hover(function() {
      $(this).parent().find('#sub').slideDown();
      $(this).parent().hover(function() {

      }, function() {
        $(this).parent().find('#sub').slideUp(900);
      });
    });
  });
</script>
<script>
  $(document).ready(function() {
    $('.slider').bxSlider({
     mode:'horizontal',
     auto: true,
     speed: 600,
     pause: 4000
    });
  });
</script>
         <div id="main_nav">
            <ul>
              <li><a href="teampro_ver_01_1.html"><span>홈</span></a>
              <li><a href="teampro_ver_01_1.html"><span>스토어</span></a>
              <li><a href="teampro_myhome.html"><span>자취에대한 모든것</span></a>
              <li><a href="teampro_myhome.html"><img src="jachievery.PNG" width="55" height="55"
              onmouseover="this.src='everyicon.svg'" onmouseout="this.src='jachievery.PNG'"></a>
              <li><a href="teampro_myhome.html"><span>고객센터</span></a>
            </ul>
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
                  
                  <li><a href="#">자취생TIP</a></li>
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
     
             
          
    <div id="s_wrap">
      <section>
        <div id="s_menusize">
          <div class="s_menu1">
            <ul>
              <li>스토어홈</li>
              <li>카테고리</li>
              <li>신혼가구</li>
              <li>베스트</li>
              <li>특가</li>
              <li>여름빅세일</li>
              <li>기획전</li>
            </ul>
          </div>
          <div id="s_menuhr">
            <hr>
          </div>
        </div>
        <div class="s_category">
          <ul>
            <li><a href="#">가구</a>></li>
            <li><a href="#">학생/서재가구</a>></li>
            <li><a href="#">학생/오피스의자</a>></li>
            <li><a href="#">학생의자</a></li>
          </ul>
        </div>
        <div id="mainsize">
          <div class="s_subimg">
            <ul id="pr_imgs">
              <li><img class="s_imgborder" src="<%=request.getContextPath()%>/upload/<%=article.get(0).getPro_mainimg()%>"></li>
              <li><img class="s_imgborder" src="img/ProductPost/chair02.webp"></li>
              <li><img class="s_imgborder" src="img/ProductPost/chair03.webp"></li>
              <li><img class="s_imgborder" src="img/ProductPost/chair04.webp"></li>
              <li><img class="s_imgborder" src="img/ProductPost/chair05.webp"></li>
              <li><img class="s_imgborder" src="img/ProductPost/chair06.webp"></li>
              <li><img class="s_imgborder" src="img/ProductPost/chair_info01.webp"></li>
              <li><img class="s_imgborder" src="img/ProductPost/chair_info02.webp"></li>
            </ul>
          </div>
          <div id="showimg" class="s_mainimg">
            <img src="<%=request.getContextPath()%>/upload/<%=article.get(0).getPro_mainimg()%>">
          </div>
          <div class="s_maintitle">
            <div class="s_mainproduct">
              <ul>
                <li class="s_maintitlefont01">의자왕</li>
                <li class="s_maintitlefont02"><%= article.get(0).getPro_name()%></li>
                <li class="s_maintitlefont01"> 3개 리뷰</li>
                <li class="s_maintitlefont03">54%</li>
                <li class="s_li_inline"><%= article.get(0).getPro_price()%> 원</li>
              </ul>
            </div>
            <hr class="clear">
            <div class="s_combobox">
              <ul>
                
                 <% if(article.get(0).getPro_option1()!=null){
                      String option = null;
                      String [] optionsp = null;
                      for(int i=0; i<article.size(); i++ ){
        	                option = article.get(i).getPro_option1();
        	                optionsp = option.split(",");%>
                    <%} %>     
                 <li>
                  <select>
                        
                   <%   for(int x=0; x < optionsp.length; x++){%>  
                         <option><%=optionsp[x]%></option>
                    <%} %>  
                  </select>
                  </li>
                  <%} %>
                 
                 <% if(article.get(0).getPro_option2()!=null){
                      String option = null;
                      String [] optionsp = null;
                      for(int i=0; i<article.size(); i++ ){
        	                option = article.get(i).getPro_option2();
        	                optionsp = option.split(",");%>
                    <%} %>     
                 <li>
                  <select>
                  <%   for(int x=0; x < optionsp.length; x++){%>  
                         <option><%=optionsp[x]%></option>
                    <%} %>  
                  </select>
                  </li>
                 <% }%>
                
                    <% if(article.get(0).getPro_option3()!=null){
                      String option = null;
                      String [] optionsp = null;
                      for(int i=0; i<article.size(); i++ ){
        	                option = article.get(i).getPro_option3();
        	                optionsp = option.split(",");%>
                    <%} %>     
                 <li>
                  <select>
                  <%   for(int x=1; x < optionsp.length; x++){%>  
                         <option><%=optionsp[x]%></option>
                    <%} %>  
                  </select>
                  </li>
                 <% }%>
              
              </ul>
            </div>
            <div class="s_price">
              <ul>
                <li class="price01">주문금액</li>
                <li class="price02">0원</li>
              </ul>
            </div>
            <hr>
            <div class="s_button">
              <ul id="product_info">
                <li><button class="m_button01" type="button">장바구니</button></li>
                <li><button class="m_button02" type="button">바로구매</button></li>
              </ul>
            </div>
          </div>
        </div>
        <div id="r_wrap">
          <div class="pr_nav">
            <ul class="s_infonav" >
              <li><a href="#product_info">상품정보</a></li>
              <li><a href="#product_review">리뷰</a></li>
              <li><a href="#product_inquiry">문의</a></li>
              <li><a href="#product_delivery">배송/환불</a></li>
            </ul>
          </div>
          <div class="productinfo_wrap">
            <ul class="productimg">
              <li>상품정보</li>
              <li><img class="s_infoimgsize01" src="img/c_product/intro1.jpg"></li>
              <li><img class="s_infoimgsize02" src="img/c_product/intro2.gif"></li>
              <li><img class="s_infoimgsize03" src="img/c_product/intro3.jpg"></li>
              <li><img class="s_infoimgsize04" src="img/c_product/CS_.jpg"></li>
            </ul>
            <div class="pr_info">
              <table>
                <tr>
                  <td class="td_size">품명</td>
                  <td class="tablepadding">사무용/컴퓨터 메쉬의자9종</td>
                </tr>
                <tr>
                  <td class="table_hr" colspan="2">
                    <hr>
                  </td>
                </tr>
                <tr>
                  <td>KC 인증 필 유무</td>
                  <td class="tablepadding">해당사항 없음</td>
                </tr>
                <tr>
                  <td class="table_hr" colspan="2">
                    <hr>rgb(224, 61, 40)
                  </td>
                </tr>
                <tr>
                  <td>색상</td>
                  <td class="tablepadding">상세페이지 참조</td>
                </tr>
                <tr>
                  <td class="table_hr" colspan="2">
                    <hr>
                  </td>
                </tr>
                <tr id="product_review">
                  <td>구성품</td>
                  <td class="tablepadding">의자</td>
                </tr>
                <tr>
                  <td class="table_hr" colspan="2">
                    <hr>
                  </td>
                </tr>
                <tr>
                  <td>주요 소재</td>
                  <td class="tablepadding">매쉬</td>
                </tr>
                <tr>
                  <td class="table_hr" colspan="2">
                    <hr>
                  </td>
                </tr>
                <tr>
                  <td>제조자,<p>수입품의 경우 수입자를 함께 표기</p>
                  </td>
                  <td class="tablepadding">(주)의자왕</td>
                </tr>
                <tr>
                  <td class="table_hr" class="table_hr" colspan="2">
                    <hr>
                  </td>
                </tr>
                <tr>
                  <td>제조국</td>
                  <td class="tablepadding">중국</td>
                </tr>
                <tr>
                  <td class="table_hr" colspan="2">
                    <hr>
                  </td>
                </tr>
                <tr>
                  <td>크기</td>
                  <td class="tablepadding">상세페이지 참조</td>
                </tr>
                <tr>
                  <td class="table_hr" colspan="2">
                    <hr>
                  </td>
                </tr>
                <tr>
                  <td>배송, 설치비용</td>
                  <td class="tablepadding">품질보증기준</td>
                </tr>
                <tr>
                  <td class="table_hr" colspan="2">
                    <hr>
                  </td>
                </tr>
                <tr>
                  <td>품질보증기준</td>
                  <td class="tablepadding">상세페이지 참조</td>
                </tr>
                <tr>
                  <td class="table_hr" colspan="2">
                    <hr>
                  </td>
                </tr>
                <tr>
                  <td>A/S 책임자와 전화번호</td>
                  <td class="tablepadding">상세페이지 참조</td>
                </tr>
                <tr>
                  <td class="table_hr" colspan="2">
                    <hr>
                  </td>
                </tr>
              </table>
            </div>
            <!-- ================review============== -->
            <div id="review">
              <div class="r_header">
                <div class="r_title">
                  리뷰
                </div><span class="r_count">1000</span>
                <div class="r_b_write">
                  <button id="review_button" type="button" name="button" onclick="createRow()">리뷰쓰기</button>
                </div>
              </div>
              <div class="review_feed">
                <div class="feed_header">
                  <span class="header_stars">4.2</span>
                  <span class="stars_icon"><img src="img/c_product/stars.png"> </span>
                </div>
                <div class="feed_filter">
                  <ul class="filter_best">
                    <li><button class="r_align" type="button" name="button">베스트순</button> </li>
                    <li><button class="r_align" type="button" name="button">최신순</button> </li>
                    <li><button class="b_picture" type="button" name="button"><img src="img/c_product/camera.png"><span class="cameratext
                    ">사진리뷰</span></button> </li>
                  </ul>
                  <ul class="filter_option">
                    <li><button type="button" name="button">별점<img src="img/c_product/d_arrow.png"></button> </li>
                    <li><button type="button" name="button">옵션<img src="img/c_product/d_arrow.png"> </button> </li>
                  </ul>
                </div>
                <div id="product_inquiry" class="review_list_wrap">
                  <table id="review_list">
                  </table>
                </div>
              </div>
              <div id="product_delivery" class="inquiry">
                <ul>
                  <li>문의</li>
                  <li>1000</li>
                </ul>
               <button type="button" name="button">문의하기</button>
              </div>
              <div class="delivery">
                <div class="delivery_title01" >
                  배송
                </div>
                <table>
                  <tr>
                    <td class="td_size">배송</td>
                    <td>화물택배상품</td>
                  </tr>
                  <tr>
                    <td class="table_hr" colspan="2">
                      <hr>
                    </td>
                  </tr>
                  <tr>
                    <td>배송비</td>
                    <td>5000원</td>
                  </tr>
                  <tr>
                    <td class="table_hr" colspan="2">
                      <hr>
                    </td>
                  </tr>
                  <tr>
                    <td>도서산간 추가 배송비</td>
                    <td>배송불가 지역이 없습니다.</td>
                  </tr>
                  <tr>
                    <td class="table_hr" colspan="2">
                      <hr>
                    </td>
                  </tr>
                  <tr>
                    <td>비례 배송비</td>
                    <td>주문 상품 개수에 비례하여 배송비 부과</td>
                  </tr>
                  <tr>
                    <td class="table_hr" colspan="2">
                      <hr>
                    </td>
                  </tr>
                </table>
                <div class="delivery_title02" >
                  교환/환불
                </div>
                <table>
                  <tr>
                    <td class="td_size">반품배송비</td>
                    <td>5,000원(최초 배송비가 무료인 경우 10,000원 부과)</td>
                  </tr>
                  <tr>
                    <td class="table_hr" colspan="2">
                      <hr>
                    </td>
                  </tr>
                  <tr>
                    <td>교환배송비</td>
                    <td>10,000원</td>
                  </tr>
                  <tr>
                    <td class="table_hr" colspan="2">
                      <hr>
                    </td>
                  </tr>
                  <tr>
                    <td>보내실 곳</td>
                    <td>(10008) 경기 김포시 하성면 하성로 721 (양택리) (주)노마드족</td>
                  </tr>
                  <tr>
                    <td class="table_hr" colspan="2">
                      <hr>
                    </td>
                  </tr>
                </table>
              </div>
            </div>
          </div>
          <div class="product_selling">
            <div class="selling01">
              <div class="selling_select">
                <ul>
                  <li>
                    <select class="" name="">
                      <option value="">색상</option>
                    </select>
                  </li>
                  <li>
                    <select class="" name="">
                      <option value="">추가상품을 선택해주세요</option>
                    </select>
                  </li>
                </ul>
              </div>
              <div class="pr_contents">
                <ul>
                  <li></li>
                  <li></li>
                </ul>
              </div>
              <div class="pr_price">
                <ul>
                  <li class="price01">주문금액</li>
                  <li class="price02">0원</li>
                </ul>
              </div>
            </div>
            <div class="selling02">
              <ul>
                <li><button class="scrapsize" type="button"><img src="img/c_product/scrap.png"></button></li>
                <li><button class="selling02_button02" type="button">장바구니</button></li>
                <li><button class="selling02_button02" type="button">바로구매</button></li>
              </ul>
            </div>
          </div>
        </div>
      </section>
    </div>
    <footer class="f_wrap">
      <hr>
    </footer>
  </form>
</body>
</html>