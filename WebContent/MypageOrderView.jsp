<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.jachi.DTO.DeliveryDTO"%>
<%@ page import="com.jachi.DTO.OrderListDTO"%>
<!DOCTYPE html>
<html lang="en">
  <head>

    <meta charset="UTF-8" />
    <link rel="stylesheet" type="text/css" href="./myhome.web.css/teamTopNav.css" />
    <link rel="stylesheet" type="text/css" href="./myhome.web.css/teamMypage.css" />
    <link rel="stylesheet" type="text/css" href="./styleSlider.css" />
     
    
    
    <script type="text/javascript" src="./myhome.web.js/MypageOrder.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script type="text/javascript" src="./myhome.web.js/jquery-easing-1.3.pack.js"></script>
    <script
      type="text/javascript"
      src="./myhome.web.js/jquery-easing-compatibility.1.2.pack.js"
    ></script>
    <script type="text/javascript" src="./myhome.web.js/coda-slider.1.1.1.pack.js"></script>

    <script type="text/javascript">
      var theInt = null;
      var $crosslink, $navthumb;
      var curclicked = 0;

      theInterval = function (cur) {
        clearInterval(theInt);

        if (typeof cur != "undefined") curclicked = cur;

        $crosslink.removeClass("active-thumb");
        $navthumb.eq(curclicked).parent().addClass("active-thumb");
        $(".stripNav ul li a").eq(curclicked).trigger("click");

        theInt = setInterval(function () {
          $crosslink.removeClass("active-thumb");
          $navthumb.eq(curclicked).parent().addClass("active-thumb");
          $(".stripNav ul li a").eq(curclicked).trigger("click");
          curclicked++;
          if (4 == curclicked) curclicked = 0;
        }, 3000);
      };

      $(function () {
        $("#main-photo-slider").codaSlider();

        $navthumb = $(".nav-thumb");
        $crosslink = $(".cross-link");

        $navthumb.click(function () {
          var $this = $(this);
          theInterval($this.parent().attr("href").slice(1) - 1);
          return false;
        });

        theInterval();
      });
    </script>

    <title>MYpage</title>
  </head>
  <body>
    <%
 
    ArrayList<Integer> articleCount = null;
    articleCount= (ArrayList<Integer>)request.getAttribute("articleCount");
   
    %>
    <!-- 게시판 등록 -->

    <form id="contentPage">
      <header>
        <div id="h_wrap">
          <div class="h_div">
            <ul>
              <li style="padding-top: 110px;">
                <img src="./img/grass2icon.svg" width="30" height="30" />
              </li>
              <li style="padding-top: 80px;">
                <img src="./img/truck2.svg" width="70" height="70" />
              </li>
              <li><img src="./img/sunicon.svg" width="60" height="60" /></li>
              <li style="padding-top: 110px;">
                <img src="./img/grass2icon.svg" width="30" height="30" />
              </li>
              <li style="padding-top: 100px;">
                <img src="./img/grassicon.svg" width="40" height="40" />
              </li>

              <li><h1>자취해보자</h1></li>
              <li style="padding-top: 20px;">
                <img
                  src="./img/houseiconcolor.svg"
                  width="100"
                  height="100"
                  onmouseover="this.src='./img/houseicon.svg'"
                  onmouseout="this.src='./img/houseiconcolor.svg'"
                />
              </li>
              <li style="padding-top: 100px;">
                <img src="./img/grassicon.svg" width="40" height="40" />
              </li>
              <li style="padding-top: 100px;">
                <img src="./img/grassicon.svg" width="40" height="40" />
              </li>
              <li style="padding-top: 110px;">
                <img src="./img/grass2icon.svg" width="30" height="30" />
              </li>
            </ul>

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
          </div>
        </div>
        <script>
          $(function () {
            $("#main_nav ul li").hover(
              function () {
                $(this).addClass("main_navov");
              },
              function () {
                $(this).removeClass("main_navov");
              }
            );
          });
        </script>
        <script>
          $(function () {
            $("#sub").hide();
            $("#main_nav").hover(function () {
              $(this).parent().find("#sub").slideDown();
              $(this)
                .parent()
                .hover(
                  function () {},
                  function () {
                    $(this).parent().find("#sub").slideUp(900);
                  }
                );
            });
          });
        </script>
        <script>
          $(document).ready(function () {
            $(".slider").bxSlider({
              mode: "horizontal",
              auto: true,
              speed: 600,
              pause: 4000,
            });
          });
        </script>
        <div id="main_nav">
          <ul>
            <li>
              <a href="teampro_ver_01_1.html"><span>홈</span></a>
            </li>
            <li>
              <a href="teampro_ver_01_1.html"><span>스토어</span></a>
            </li>
            <li>
              <a href="teampro_myhome.html"><span>커뮤니티</span></a>
            </li>
            <li>
              <a href="teampro_myhome.html"><span>자취에대한 모든것</span></a>
            </li>

            <li>
              <a href="teampro_myhome.html"><span>고객센터</span></a>
            </li>
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

      <div id="m_wrap">
        <main>
          <div class="MyPage_container">
            <div class="MyPage_container_header">
              <nav class="MyPage_container_header_nav">
                <ul>
                  <li>
                    <a href="#"><span>프로필</span></a>
                  </li>
                  <li>
                    <a href="#"><span>마이쇼핑</span></a>
                  </li>
                  <li>
                    <a href="#"><span>설정</span></a>
                  </li>
                </ul>
              </nav>
              <nav class="MyPage_container_header_nav_sub">
                <ul>
                  <li>
                    <a href="#"><span>주문배송내역 조회</span></a>
                  </li>
                  <li>
                    <a href="#"><span>장바구니</span></a>
                  </li>
                  <li>
                    <a href="#"><span>상품문의내역</span></a>
                  </li>
                </ul>
              </nav>
            </div>

            <!--                            ////////////////////////////// -->
            <div class="order-list__menu">
              <a class="order-list__menu__list" href="MypageOrderListView.bo?status=1">
                <div class="order-list__menu__list__wrap">
                  <div class="order-list__menu__list__title">입금대기</div>
                  <div class="order-list__menu__list__value"><%= articleCount.get(0) %></div>
                </div>
              </a>
              <a class="order-list__menu__list" href="MypageOrderListView.bo?status=2">
                <div class="order-list__menu__list__wrap">
                  <div class="order-list__menu__list__title">결제완료</div>
                  <div class="order-list__menu__list__value"><%= articleCount.get(1) %></div>
                </div>
              </a>
              <a class="order-list__menu__list" href="MypageOrderListView.bo?status=3">
                <div class="order-list__menu__list__wrap">
                  <div class="order-list__menu__list__title">배송준비</div>
                  <div class="order-list__menu__list__value"><%= articleCount.get(2) %></div>
                </div>
              </a>
              <a class="order-list__menu__list" href="MypageOrderListView.bo?status=4">
                <div class="order-list__menu__list__wrap">
                  <div class="order-list__menu__list__title">배송중</div>
                  <div class="order-list__menu__list__value"><%= articleCount.get(3) %></div>
                </div>
              </a>
              <a class="order-list__menu__list" href="MypageOrderListView.bo?status=5">
                <div class="order-list__menu__list__wrap">
                  <div class="order-list__menu__list__title">배송완료</div>
                  <div class="order-list__menu__list__value"><%= articleCount.get(4) %></div>
                </div>
              </a>
              <a class="order-list__menu__list" href="MypageOrderListView.bo?status=6">
                <div class="order-list__menu__list__wrap">
                  <div class="order-list__menu__list__title">구매확정</div>
                  <div class="order-list__menu__list__value"><%= articleCount.get(5) %></div>
                </div>
              </a>
            </div>

            <!-- ///////////////////////////////////조회내역///////////////////////////////// -->
            <div class="MyPage_container_selectlist">
             <table>
              <tr>
               <td class="MyPage_container_selectlist_orderDate">주문일</td>
               <td class="MyPage_container_selectlist_productName">제품명</td>
               <td class="MyPage_container_selectlist_deliveryNumber">송장번호</td>
               <td class="MyPage_container_selectlist_deliveryCompany">택배사</td>
               <td class="MyPage_container_selectlist_productPrice">가격</td>
              </tr>
              <%
              ArrayList<OrderListDTO> orderList = (ArrayList<OrderListDTO>)request.getAttribute("orderList_status");
              if(orderList != null){
              for(int i=0; i<orderList.size(); i++){
               
              %>
              <tr>
               <td><%= orderList.get(i).getList_date() %></td>
               <td><%= orderList.get(i).getList_delStatus() %></td>
               <td><%= orderList.get(i).getList_delNum() %></td>
               <td><%= orderList.get(i).getList_company() %></td>
               <td><%= orderList.get(i).getCal_price() %></td>
              </tr>
              <%
               }
               }
              %>
             </table>
                
            </div>
          </div>
        </main>
      </div>
      <footer>
        <div></div>
      </footer>
    </form>
  
  </body>
</html>
