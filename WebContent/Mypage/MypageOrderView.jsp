<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" type="text/css" href="./../myhome.web.css/teamTopNav.css" />
    <link rel="stylesheet" type="text/css" href="./../myhome.web.css/teamMypage.css" />
    <link rel="stylesheet" type="text/css" href="styleSlider.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script type="text/javascript" src="./../myhome.web.js/jquery-easing-1.3.pack.js"></script>
    <script
      type="text/javascript"
      src="./../myhome.web.js/jquery-easing-compatibility.1.2.pack.js"
    ></script>
    <script type="text/javascript" src="./../myhome.web.js/coda-slider.1.1.1.pack.js"></script>

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
    <!-- 게시판 등록 -->

    <form id="contentPage">
      <header>
        <div id="h_wrap">
          <div class="h_div">
            <ul>
              <li style="padding-top: 110px;">
                <img src="./../img/grass2icon.svg" width="30" height="30" />
              </li>
              <li style="padding-top: 80px;">
                <img src="./../img/truck2.svg" width="70" height="70" />
              </li>
              <li><img src="./../img/sunicon.svg" width="60" height="60" /></li>
              <li style="padding-top: 110px;">
                <img src="./../img/grass2icon.svg" width="30" height="30" />
              </li>
              <li style="padding-top: 100px;">
                <img src="./../img/grassicon.svg" width="40" height="40" />
              </li>

              <li><h1>자취해보자</h1></li>
              <li style="padding-top: 20px;">
                <img
                  src="./../img/houseiconcolor.svg"
                  width="100"
                  height="100"
                  onmouseover="this.src='./../img/houseicon.svg'"
                  onmouseout="this.src='./../img/houseiconcolor.svg'"
                />
              </li>
              <li style="padding-top: 100px;">
                <img src="./../img/grassicon.svg" width="40" height="40" />
              </li>
              <li style="padding-top: 100px;">
                <img src="./../img/grassicon.svg" width="40" height="40" />
              </li>
              <li style="padding-top: 110px;">
                <img src="./../img/grass2icon.svg" width="30" height="30" />
              </li>
            </ul>

            <ul class="login_go">
              <li><a href="loginPage.jsp">로그인</a></li>
              <li><span> | </span></li>
              <li><a href="join.jsp">회원가입</a></li>
            </ul>

            <ul class="login_go">
              <li><span></span></li>
              <li><span> | </span></li>
              <li><a href="logoutActionPage.jsp">로그아웃</a></li>
            </ul>
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
              <a href="teampro_myhome.html"><span>자취에대한 모든것</span></a>
            </li>
            <li>
              <a href="teampro_myhome.html"
                ><img
                  src="img/jachievery.PNG"
                  width="55"
                  height="55"
                  onmouseover="this.src='img/everyicon.svg'"
                  onmouseout="this.src='img/jachievery.PNG'"
              /></a>
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
              <a class="order-list__menu__list" href="#">
                <div class="order-list__menu__list__wrap">
                  <div class="order-list__menu__list__title">입금대기</div>
                  <div class="order-list__menu__list__value">0</div>
                </div>
              </a>
              <a class="order-list__menu__list" href="#">
                <div class="order-list__menu__list__wrap">
                  <div class="order-list__menu__list__title">결제완료</div>
                  <div class="order-list__menu__list__value">0</div>
                </div>
              </a>
              <a class="order-list__menu__list" href="#">
                <div class="order-list__menu__list__wrap">
                  <div class="order-list__menu__list__title">배송준비</div>
                  <div class="order-list__menu__list__value">0</div>
                </div>
              </a>
              <a class="order-list__menu__list" href="#">
                <div class="order-list__menu__list__wrap">
                  <div class="order-list__menu__list__title">배송중</div>
                  <div class="order-list__menu__list__value">0</div>
                </div>
              </a>
              <a class="order-list__menu__list" href="#">
                <div class="order-list__menu__list__wrap">
                  <div class="order-list__menu__list__title">배송완료</div>
                  <div class="order-list__menu__list__value">0</div>
                </div>
              </a>
              <a class="order-list__menu__list" href="#">
                <div class="order-list__menu__list__wrap">
                  <div class="order-list__menu__list__title">구매확정</div>
                  <div class="order-list__menu__list__value">0</div>
                </div>
              </a>
            </div>

            <!-- ///////////////////////////////////조회내역///////////////////////////////// -->
            <div class="MyPage_container_selectlist">

                
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
