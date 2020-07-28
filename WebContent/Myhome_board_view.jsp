<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


    <link rel="stylesheet" type="text/css" href="./myhome.web.css/myhome_write_css.css" />
    <link rel="stylesheet" type="text/css" href="./myhome.web.css/page_myhome/heartbtn.css" />
    <link rel="stylesheet" type="text/css" href="./myhome.web.css/page_myhome/bookmark.css" />

    <link rel="stylesheet" type="text/css"  href="./myhome.web.css/teamTopNav.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" type="text/css" href="./myhome.web.css//styleSlider.css" />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script
      type="text/javascript"
      src="./myhome.web.js/jquery-easing-1.3.pack.js"
    ></script>
    <script
      type="text/javascript"
      src="./myhome.web.js/jquery-easing-compatibility.1.2.pack.js"
    ></script>
    <script
      type="text/javascript"
      src="./myhome.web.js/coda-slider.1.1.1.pack.js"
    ></script>

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
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"
    />
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"
    />
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<title>MVC 게시판</title>
<style type="text/css">

</style>
</head>
<body>
	<!-- 게시판 등록 -->
	<%
	
/*	 String userID = (String)session.getAttribute("userID");
	if(userID == null){
		out.println("<script>");
		out.println("alert('로그인이 필요한 작업입니다.');");
		out.println("history.back();");
		out.println("</script>");
	}*/
	%>

	<form id="contentPage">
         <header>
        <div id="h_wrap">
            <div class="h_div_side"></div>
            <div class="h_div">
            <ul>
            <li style="padding-top:110px"><img src="img/grass2icon.svg" width="30" height="30"/></li>
            <li style="padding-top:80px"><img src="img/truck2.svg" width="70" height="70"/></li>
            <li><img src="img/sunicon.svg" width="60" height="60"/></li>
            <li style="padding-top:110px"><img src="img/grass2icon.svg" width="30" height="30"/></li>
            <li style="padding-top:100px"><img src="img/grassicon.svg" width="40" height="40"/></li> 
            
            <li><h1>자취해보자</h1></li>
            <li style="padding-top:20px">
             <img src="img/houseiconcolor.svg" width="100" height="100" onmouseover="this.src='img/houseicon.svg'" onmouseout="this.src='img/houseiconcolor.svg'"/>
             </li>
             <li style="padding-top:100px"><img src="img/grassicon.svg" width="40" height="40"/></li>
             <li style="padding-top:100px"><img src="img/grassicon.svg" width="40" height="40"/></li> 
             <li style="padding-top:110px"><img src="img/grass2icon.svg" width="30" height="30"/></li>
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
              <li><a href="teampro_myhome.html"><img src="img/jachievery.PNG" width="55" height="55"
              onmouseover="this.src='img/everyicon.svg'" onmouseout="this.src='img/jachievery.PNG'"></a>
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
       
        <div id="m_wrap">
          <main>
            <div class="myhomeContentLeft">
              <div class="myhomeContentLeft_header">
                <ul class="myhomeContentLeft_header_keyword">
                  <li>키워드1 |</li>
                  <li>키워드2 |</li>
                  <li>키워드3 |</li>
                </ul>
                <div class="myhomeContentLeft_header_time">
                  time
                </div>
              </div>

              <div class="myhomeContentLeft_main">
                <div id="bg_main">
                  <div id="page-wrap">
                    <div class="slider-wrap">
                      <div id="main-photo-slider" class="csw">
                        <div class="panelContainer">
                          <div class="panel" title="Panel 1">
                            <div class="wrapper">
                              <img
                                src="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/159031754537170619.jpeg?gif=1&w=850&webp=1"
                                alt="temp"
                              />
                            </div>
                          </div>
                          <div class="panel" title="Panel 2">
                            <div class="wrapper">
                              <img
                                src="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/159141479080575947.jpeg?gif=1&w=850&webp=1"
                                alt="temp"
                              />
                            </div>
                          </div>
                          <div class="panel" title="Panel 3">
                            <div class="wrapper">
                              <img
                                src="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/159158750321438442.jpeg?gif=1&w=850&webp=1"
                                alt="temp"
                              />
                            </div>
                          </div>
                          <div class="panel" title="Panel 4">
                            <div class="wrapper">
                              <img
                                src="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/159158779101441293.jpeg?gif=1&w=850&webp=1"
                                alt="temp"
                                class="floatleft"
                              />
                            </div>
                            <div class="panel" title="Panel 5">
                              <div class="wrapper">
                                <!-- <img
                                src="./../image/sliderimages/tempphoto-4.jpg"
                                alt="temp"
                                class="floatleft"
                              /> -->
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                      <ul id="thumbAll">
                        <li>
                          <a href="#1" class="cross-link active-thumb"
                            ><img
                              src="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/159031754537170619.jpeg?gif=1&w=850&webp=1"
                              class="nav-thumb"
                              alt="temp-thumb"
                          /></a>
                        </li>
                        <li>
                          <a href="#2" class="cross-link"
                            ><img
                              src="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/159141479080575947.jpeg?gif=1&w=850&webp=1"
                              class="nav-thumb"
                              alt="temp-thumb"
                          /></a>
                        </li>
                        <li>
                          <a href="#3" class="cross-link"
                            ><img
                              src="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/159158750321438442.jpeg?gif=1&w=850&webp=1"
                              class="nav-thumb"
                              alt="temp-thumb"
                          /></a>
                        </li>
                        <li>
                          <a href="#4" class="cross-link"
                            ><img
                              src="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/159158779101441293.jpeg?gif=1&w=850&webp=1"
                              class="nav-thumb"
                              alt="temp-thumb"
                          /></a>
                        </li>
                      </ul>
                    </div>
                  </div>
                </div>
                <!-- 메인배경용 -->
                <div id="myhomeContentLeft_main_userContent_bgImage">
                  <div class="myhomeContentLeft_main_userContent">
                    <p>
                      <span>사용자 코멘트 동해물과 백두산이 마르고 닳도록</span>
                    </p>
                  </div>

                  <div class="myhomeContentLeft_main_keyword">
                    <ul class="myhomeContentLeft_main_keyword_tag">
                      <li><a href="#">#태그1</a></li>
                      <li><a href="#">#태그2</a></li>
                      <li><a href="#">#태그3</a></li>
                      <li><a href="#">#태그4</a></li>
                    </ul>
                  </div>
                </div>

                <ul class="myhomeContentLeft_main_usercomment">
                  <li>
                    <span>조회수</span>
                    <span src="#">35</span>
                  </li>
                  <li>
                    <span>댓글</span>
                    <span src="#">0</span>
                  </li>
                  <li>
                    <span>공유</span>
                    <span src="#">1</span>
                  </li>
                  <li>
                    <input type="button" value="신고" />
                  </li>
                </ul>

                <div class="myhomeContentLeft_main_writeComment">
                  <h1>댓글</h1>
                  <section class="section_left">
                    <div><img src="#" id="userIcon" /></div>
                    <div>
                      <textarea
                        class="form-control"
                        rows="3"
                        id="userComent"
                      ></textarea>
                    </div>
                    <script>
                      function createRow() {
                        var coment = document.getElementById("userComent");
                        var ta = document.getElementById("tableList");
                        var row = ta.insertRow(ta.rows.length);
                        var td1 = row.insertCell(0); // inerthml
                        var td2 = row.insertCell(1);
                        var td3 = row.insertCell(2);
                        var td4 = row.insertCell(3);
                        td1.innerHTML =
                          "<img src='#' width='30px' height='30px' class='comentPic'/>";
                        td2.innerHTML =
                          "<span class='comentTxt'>" + coment.value + "</span>";
                        td3.innerHTML =
                          "<span class='comentUserID'>" + "userID" + "</span>";
                        td4.innerHTML =
                          "<input type ='button' value='삭제' onclick = 'delCheck(this)'/>";
                        coment.value = "";
                        // Ex) sel.getAttribute("name"); [속성] 가져오기 cf 값
                      }
                      function delCheck(obj) {
                        var tr = obj.parentNode.parentNode;
                        tr.parentNode.removeChild(tr);
                      }
                    </script>
                    <div>
                      <input
                        class="btn btn-default"
                        type="button"
                        value="댓글등록"
                        onclick="createRow()"
                      />
                    </div>
                    <article>
                      <table class="table table-hover" id="tableList"></table>
                      <ul class="pagination">
                        <li class="disabled">
                          <a href="#" aria-label="Previous"
                            ><span aria-hidden="true">&laquo;</span></a
                          >
                        </li>
                        <li class="active">
                          <a href="#">1 <span class="sr-only"></span></a>
                        </li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li>
                          <a href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                          </a>
                        </li>
                      </ul>
                    </article>
                  </section>
                </div>
              </div>
            </div>
            <div class="boxContainer">
              <div class="myhomeContentRight">
                <div class="myhomeContentRight_button">
                  <!-- 버튼 이미지로 만들기 -->
                  <!-- <div>
                    <button type="button" class="btm_image">
                      <img
                        id="img_btn"
                        src="img/page_myhome/icons8-heart-50.png"
                        clicked-image="img/page_myhome/icons8-heart-50-2.png"
                        unclicked-image="img/page_myhome/icons8-heart-50.png"
                      />
                    </button>
                  </div>
                  <div>
                    <button type="button" class="btm_image">
                      <img
                        src="img/page_myhome/icons8-bookmark-50-2.png"
                        clicked-image="img/page_myhome/icons8-bookmark-50.png"
                        unclicked-image="img/page_myhome/icons8-bookmark-50-2.png"
                      />
                    </button>
                  </div> -->
              <button type="button "class="like-button" id="heart-button">
                <div class="like-wrapper">
                  <img
                  id="img_btn"
                  src="img/page_myhome/icons8-heart-50.png"
                  clicked-image="img/page_myhome/icons8-heart-50-2.png"
                  unclicked-image="img/page_myhome/icons8-heart-50.png"
                />
                    <div class="particles" style="--total-particles: 6">
                      <div class="particle" style="--i: 1; --color: #7642F0"></div>
                      <div class="particle" style="--i: 2; --color: #AFD27F"></div>
                      <div class="particle" style="--i: 3; --color: #DE8F4F"></div>
                      <div class="particle" style="--i: 4; --color: #D0516B"></div>
                      <div class="particle" style="--i: 5; --color: #5686F2"></div>
                      <div class="particle" style="--i: 6; --color: #D53EF3"></div>
                    </div>
                </div>
              </button>
                <!-- <div class="myhomeContentRight_button">
                  <button class="bookmark-button" id="bookmark-button">
                    <div class="bookmark-wrapper">
                       <div class="bookmark_ripple"></div>
                         <svg class="bookmark" width="24" height="24" viewBox="0 0 24 24">
                            <path d="M 11.53 18.54 l -8.06 4.31 A 1 1 0 0 1 2 21.97 V 3.5 A 1.5 1.5 0 0 1 3.5 2 h 17 A 1.5 1.5 0 0 1 22 3.5 v 18.47 a 1 1 0 0 1 -1.47 0.88 l -8.06 -4.31 a 1 1 0 0 0 -0.94 0 Z"></path>
                     </svg>
                        <div class="bookmark_particles" style="--total-bookmark_particles: 6">
                          <div class="bookmark_particle" style="--i: 1; --color: #7642F0"></div>
                          <div class="bookmark_particle" style="--i: 2; --color: #AFD27F"></div>
                          <div class="bookmark_particle" style="--i: 3; --color: #DE8F4F"></div>
                          <div class="bookmark_particle" style="--i: 4; --color: #D0516B"></div>
                          <div class="bookmark_particle" style="--i: 5; --color: #5686F2"></div>
                          <div class="bookmark_particle" style="--i: 6; --color: #D53EF3"></div>
                        </div>
                    </div>
                  </button>
                    </div> -->


                </div>
                <div class="myhomeContentRight_userinfo">
                  <div><span class="Right_userID">UserID</span></div>
                  <button type="button" class="btm_image">팔로우</button>
                </div>
                <div class="myhomeContentRight_userimage_container">
                  <div class="myhomeContentRight_userimage">
                    <a href="#"
                      ><img
                        src="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots1563202386_bcE0MUD3.jpeg?gif=1&w=160&h=160&c=c"
                    /></a>
                  </div>
                  <div class="myhomeContentRight_userimage">
                    <a href="#"
                      ><img
                        src="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots1563596725_O.jpeg?gif=1&w=160&h=160&c=c&webp=1"
                    /></a>
                  </div>
                  <div class="myhomeContentRight_userimage">
                    <a href="#"
                      ><img
                        src="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots1564145477_Vz05afV.jpeg?gif=1&w=160&h=160&c=c&webp=1"
                    /></a>
                  </div>
                  <div class="myhomeContentRight_userimage">
                    <a href="#"
                      ><img
                        src="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots1564296425_omoVsNdH.jpeg?gif=1&w=160&h=160&c=c&webp=1"
                    /></a>
                  </div>
                </div>
              </div>
              <script>
                $(document).ready(function () {
                  $("#heart-button").on("click", function () {
                    alert("123");
                    var clicked = $("div>img", this).attr("clicked-image");
                    var unclicked = $("div>img", this).attr("unclicked-image");
                    var now = $("div>img", this).attr("src");
                    if (now == unclicked) {
                      alert("123");
                      $("div>img[src]", this).attr("src", clicked);
                    } else if (now == clicked) {
                      $("div>img[src]", this).attr("src", unclicked);
                    }
                  });
                });
              </script>
            </div>
          </main>
        </div>
        <footer>
          <div></div>
        </footer>
      </form>
</body>
</html>