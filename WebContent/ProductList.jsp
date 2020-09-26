<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.jachi.DTO.ProductinfoDTO"%>


<%
	ArrayList<ProductinfoDTO> article = (ArrayList<ProductinfoDTO>) request.getAttribute("article");
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>자취해보자 스토어</title>


<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript"
	src="./myhome.web.js/jquery-easing-1.3.pack.js"></script>
<script type="text/javascript"
	src="./myhome.web.js/jquery-easing-compatibility.1.2.pack.js"></script>
<script type="text/javascript"
	src="./myhome.web.js/coda-slider.1.1.1.pack.js"></script>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>




<link rel="stylesheet" href="./Teamcss/ProductList.css" type="text/css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link rel="stylesheet" href="./Teamcss/teampro_ver_01.css"
	type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script src="./myhome.web.js/teamTopnav.js"></script>


<!-- <script type="text/javascript" src="jquery-1.5.2.min.js"></script> -->
<script type="text/javascript"
	src="./Teamjs/scriptbreaker-multiple-accordion-1.js"></script>
<script>
var jb = jQuery.noConflict();
jb(function() {
	jb('.slider').bxSlider({
			mode : 'horizontal',
			auto : true,
			speed : 600,
			pause : 4000
		});
	});
	$(function() {
		//use the scriptbreaker.com multiple accordion menu
		$(".topnav").accordion({
			accordion : true,
			speed : 500
		});
	});
</script>

</head>

<body>
	<form id="contentPage">
		<!-- Header include -->
		<jsp:include page="HeaderTestjsp.jsp"></jsp:include>



		<section>

			<div id="m_wrap">
				<aside id="as_size">
					<ul class="topnav">
						<li><a href="#">가구</a>
							<ul>
								<li><a href="#">소파/거실가구</a>
									<ul>
										<li><a href="cate_search.bo?cate=소파">소파</a></li>
										<li><a href="cate_search.bo?cate=거실수납장">거실/TV장</a></li>
										<li><a href="cate_search.bo?cate=가구">거실/소파테이블</a></li>
										<li><a href="cate_search.bo?cate=거실수납장">의자</a></li>
									</ul></li>
								<li><a href="#">침실가구</a>
									<ul>
										<li><a href="cate_search.bo?cate=침구">침대</a></li>
										<li><a href="cate_search.bo?cate=블라인드">매트리스</a></li>
										<li><a href="cate_search.bo?cate=침구">화장대</a></li>
										<li><a href="cate_search.bo?cate=블라인드">서랍장</a></li>
										<li><a href="cate_search.bo?cate=블라인드">거울</a></li>
									</ul></li>
								<li><a href="#">드레스룸</a>
									<ul>
										<li><a href="#">드레스룸</a></li>
										<li><a href="#">옷장</a></li>
										<li><a href="#">행거</a></li>
										<li><a href="#">서랍장</a></li>
									</ul></li>
								<li><a href="#">주방가구</a>
									<ul>
										<li><a href="#">식탁</a></li>
										<li><a href="#">아일랜드식탁</a></li>
										<li><a href="#">주방의자</a></li>
										<li><a href="#">주방수납</a></li>
									</ul></li>
								<li><a href="#">학생/서재가구</a>
									<ul>
										<li><a href="#">책상</a></li>
										<li><a href="#">책장</a></li>
										<li><a href="#">의자</a></li>
										<li><a href="#">오피스/수납</a></li>
									</ul></li>
								<li><a href="#">수납가구</a>
									<ul>
										<li><a href="#">선반</a></li>
										<li><a href="#">수납장</a></li>
										<li><a href="#">진열/장식장</a></li>
									</ul></li>
								<li><a href="#">테이블</a>
									<ul>
										<li><a href="#">좌식테이블</a></li>
										<li><a href="#">사이드테이블</a></li>
										<li><a href="#">접이식테이블</a></li>
									</ul></li>
								<li><a href="#">의자/스툴</a>
									<ul>
										<li><a href="#">일반의자</a></li>
										<li><a href="#">좌식의자</a></li>
										<li><a href="#">안락/흔들의자</a></li>
										<li><a href="#">스툴</a></li>
										<li><a href="#">벤치</a></li>
										<li><a href="#">발받침</a></li>
									</ul></li>

							</ul></li>
						<li><a href="#">패브릭</a>
							<ul>
								<li><a href="#">침구</a>
									<ul>
										<li><a href="cate_search.bo?cate=침구">이불커버</a></li>
										<li><a href="cate_search.bo?cate=블라인드">이불솜</a></li>
										<li><a href="cate_search.bo?cate=침구">토퍼</a></li>
										<li><a href="cate_search.bo?cate=블라인드">베개커버</a></li>
										<li><a href="cate_search.bo?cate=침구">바디필로우</a></li>
										<li><a href="cate_search.bo?cate=블라인드">매트리스커버</a></li>
									</ul></li>
								<li><a href="#">커튼/블라인드</a>
									<ul>
										<li><a href="cate_search.bo?cate=블라인드">암막커튼</a></li>
										<li><a href="cate_search.bo?cate=블라인드">일반커튼</a></li>
										<li><a href="cate_search.bo?cate=블라인드">레이스/속커튼</a></li>
										<li><a href="cate_search.bo?cate=블라인드">롤스크린</a></li>
									</ul></li>
								<li><a href="#">카페트/러그</a>
									<ul>
										<li><a href="#">극세사러그</a></li>
										<li><a href="#">샤기카페트</a></li>
										<li><a href="#">페르시안카페트</a></li>
										<li><a href="#">면/라탄/핸드메이드</a></li>
										<li><a href="#">발매트</a></li>
										<li><a href="#">주방/다용도매트</a></li>
										<li><a href="#">유아용매트</a></li>
										<li><a href="#">원목/쿨매트</a></li>
										<li><a href="#">피크닉매트</a></li>
									</ul></li>
								<li><a href="#">쿠션/방석</a>
									<ul>
										<li><a href="#">쿠션</a></li>
										<li><a href="#">방석</a></li>
										<li><a href="#">방석솜</a></li>
									</ul></li>
								<li><a href="#">홈패브릭</a>
									<ul>
										<li><a href="#">담요</a></li>
										<li><a href="#">실내화</a></li>
										<li><a href="#">소파패드</a></li>
										<li><a href="#">소파커버</a></li>
										<li><a href="#">선풍기/에어컨커버</a></li>
										<li><a href="#">기타</a></li>
									</ul></li>
								<li><a href="#">주방패브릭</a>
									<ul>
										<li><a href="#">식탁보</a></li>
										<li><a href="#">테이블매트</a></li>
										<li><a href="#">앞치마/주방장갑</a></li>
										<li><a href="#">행주/티타올</a></li>
										<li><a href="#">기타</a></li>
									</ul></li>
								<li><a href="#">공예/취미</a>
									<ul>
										<li><a href="#">털실/뜨개도구</a></li>
										<li><a href="#">자수/자수도구</a></li>
										<li><a href="#">원단</a></li>
										<li><a href="#">패턴</a></li>
										<li><a href="#">기타 수예용품</a></li>
									</ul></li>
							</ul></li>
						<li><a href="#">홈데코</a>
							<ul>
								<li><a href="#">조명</a>
									<ul>
										<li><a href="#">LED조명</a></li>
										<li><a href="#">포인트조명</a></li>
										<li><a href="#">레일조명</a></li>
										<li><a href="#">장스탠드</a></li>
										<li><a href="#">단스탠드</a></li>
										<li><a href="#">데스크스탠드</a></li>
										<li><a href="#">벽조명</a></li>
										<li><a href="#">무드등/장식등</a></li>
										<li><a href="#">센서등</a></li>
										<li><a href="#">형광등</a></li>
									</ul></li>
								<li><a href="#">시계</a>
									<ul>
										<li><a href="#">벽시계</a></li>
										<li><a href="#">알람/탁상시계</a></li>
										<li><a href="#">욕실방수시계</a></li>
										<li><a href="#">타이머/스탑워치</a></li>
									</ul></li>
								<li><a href="#">꽃/식물</a>
									<ul>
										<li><a href="#">식물</a></li>
										<li><a href="#">조화</a></li>
										<li><a href="#">플라워</a></li>
										<li><a href="#">화병/화분</a></li>
									</ul></li>
								<li><a href="#">홈갤러리</a>
									<ul>
										<li><a href="#">액자</a></li>
										<li><a href="#">패브릭 포스터</a></li>
										<li><a href="#">그림/사진</a></li>
									</ul></li>
								<li><a href="#">장식</a>
									<ul>
										<li><a href="#">드림캐쳐</a></li>
										<li><a href="#">데코스티커</a></li>
										<li><a href="#">기타</a></li>
									</ul></li>
								<li><a href="#">캔들/디퓨저</a>
									<ul>
										<li><a href="#">캔들</a></li>
										<li><a href="#">디퓨저</a></li>
										<li><a href="#">캔들홀더/워머</a></li>
										<li><a href="#">기타 액세서리</a></li>
									</ul></li>
								<li><a href="#">데스크/디자인</a>
									<ul>
										<li><a href="#">디자인 문구</a></li>
										<li><a href="#">데스크테리어</a></li>
										<li><a href="#">디지털/핸드폰</a></li>
									</ul></li>
							</ul></li>
						<li><a href="#">가전</a>
							<ul>
								<li><a href="#">주방가전</a>
									<ul>
										<li><a href="#">냉장고</a></li>
										<li><a href="#">에어프라이어</a></li>
										<li><a href="#">토스터</a></li>
										<li><a href="#">블랜더/믹서</a></li>
										<li><a href="#">오븐/전자렌지</a></li>
										<li><a href="#">인덕션/가스렌지</a></li>
										<li><a href="#">밥솥/찜기</a></li>
										<li><a href="#">커피머신</a></li>
										<li><a href="#">기타</a></li>
									</ul></li>
								<li><a href="#">생활가전</a>
									<ul>
										<li><a href="#">세탁기</a></li>
										<li><a href="#">건조기</a></li>
										<li><a href="#">다리미</a></li>
										<li><a href="#">멀티탭</a></li>
										<li><a href="#">비데</a></li>
										<li><a href="#">기타</a></li>
									</ul></li>
								<li><a href="#">청소가전</a>
									<ul>
										<li><a href="#">일반청소기</a></li>
										<li><a href="#">로봇청소기</a></li>
										<li><a href="#">침구청소기</a></li>
										<li><a href="#">스팀청소기</a></li>
										<li><a href="#">물걸레청소기</a></li>
									</ul></li>
								<li><a href="#">음향/영상가전</a>
									<ul>
										<li><a href="#">프로젝터</a></li>
										<li><a href="#">TV/모니터</a></li>
										<li><a href="#">스피커/라디오</a></li>
										<li><a href="#">턴테이블</a></li>
										<li><a href="#">이어폰/헤드셋</a></li>
										<li><a href="#">PC 액세서리</a></li>
									</ul></li>
							</ul></li>
						<li><a href="#">수납/정리</a>
							<ul>
								<li><a href="#">수납장/서랍장</a>
									<ul>
										<li><a href="#">플라스틱 서랍장</a></li>
										<li><a href="#">이동식 정리함</a></li>
										<li><a href="#">공간박스</a></li>
									</ul></li>
								<li><a href="#">리빙박스/수납함</a>
									<ul>
										<li><a href="#">리빙박스</a></li>
										<li><a href="#">수납정리함</a></li>
										<li><a href="#">기타수납/정리용품</a></li>
									</ul></li>
								<li><a href="#">바구니/바스켓</a>
									<ul>
										<li><a href="#">수납바스켓</a></li>
										<li><a href="#">라탄바스켓</a></li>
										<li><a href="#">빨래바구니/보관함</a></li>
										<li><a href="#">소품 트레이/기타</a></li>
									</ul></li>
								<li><a href="#">행거</a>
									<ul>
										<li><a href="#">스탠드행거</a></li>
										<li><a href="#">이동식행거</a></li>
										<li><a href="#">고정식행거</a></li>
									</ul></li>
								<li><a href="#">선반</a>
									<ul>
										<li><a href="#">벽선반</a></li>
										<li><a href="#">스탠드선반</a></li>
										<li><a href="#">세탁기선반</a></li>
									</ul></li>
								<li><a href="#">옷걸이/옷정리</a>
									<ul>
										<li><a href="#">옷/바지걸이</a></li>
										<li><a href="#">서랍칸막이/수납함</a></li>
										<li><a href="#">속옷정리함</a></li>
										<li><a href="#">옷커버/압축팩</a></li>
										<li><a href="#">후크/수납걸이</a></li>
									</ul></li>
								<li><a href="#">화장대/테이블정리</a>
									<ul>
										<li><a href="#">화장품정리</a></li>
										<li><a href="#">쥬얼리정리</a></li>
										<li><a href="#">소품정리</a></li>
										<li><a href="#">거치대</a></li>
									</ul></li>
								<li><a href="#">현관/신발정리</a>
									<ul>
										<li><a href="#">신발장/정리대</a></li>
										<li><a href="#">신발수납함</a></li>
										<li><a href="#">우산꽂이</a></li>
										<li><a href="#">실내화거치대</a></li>
									</ul></li>
							</ul></li>
						<li><a href="#">생활용품</a>
							<ul>
								<li><a href="#">욕실용품</a>
									<ul>
										<li><a href="#">욕실소품/디스펜서</a></li>
										<li><a href="#">욕실정리/수납장</a></li>
										<li><a href="#">욕실선반</a></li>
										<li><a href="#">양치용품</a></li>
										<li><a href="#">비누받침</a></li>
										<li><a href="#">샤워기</a></li>
										<li><a href="#">샤워/목욕용품</a></li>
										<li><a href="#">샤워커튼/봉</a></li>
										<li><a href="#">욕실/발매트</a></li>
										<li><a href="#">욕실화</a></li>
										<li><a href="#">변기솔</a></li>
										<li><a href="#">변기커버</a></li>
										<li><a href="#">기타욕실용품</a></li>
									</ul></li>
								<li><a href="#">수건/타월</a>
									<ul>
										<li><a href="#">세면타월</a></li>
										<li><a href="#">가운/기타</a></li>
									</ul></li>
								<li><a href="#">청소용품</a>
									<ul>
										<li><a href="#">휴지통</a></li>
										<li><a href="#">분리수거함</a></li>
										<li><a href="#">먼지제거/클리너</a></li>
										<li><a href="#">청서솔/브러쉬</a></li>
										<li><a href="#">기타청소용품</a></li>
									</ul></li>
								<li><a href="#">세탁용품</a>
									<ul>
										<li><a href="#">빨래건조대</a></li>
										<li><a href="#">빨래보관함</a></li>
										<li><a href="#">다리미판/기타</a></li>
									</ul></li>
								<li><a href="#">생필품</a>
									<ul>
										<li><a href="#">세탁세제</a></li>
										<li><a href="#">주방세제</a></li>
										<li><a href="#">섬유유연제</a></li>
										<li><a href="#">제습제</a></li>
										<li><a href="#">방향/탈취제</a></li>
										<li><a href="#">청소세제</a></li>
										<li><a href="#">화장지/물티슈</a></li>
										<li><a href="#">칫솔/치약/세면</a></li>
										<li><a href="#">헤어/바디케어</a></li>
										<li><a href="#">살충/방충제</a></li>
										<li><a href="#">기타생필품</a></li>
									</ul></li>
								<li><a href="#">생활잡화</a>
									<ul>
										<li><a href="#">모기장/방충망</a></li>
										<li><a href="#">난방텐트/단열용품</a></li>
										<li><a href="#">여해용품</a></li>
										<li><a href="#">마스크/건강용품</a></li>
										<li><a href="#">기타생활잡화</a></li>
									</ul></li>
							</ul></li>
						<li><a href="#">주방</a>
							<ul>
								<li><a href="#">그릇/홈세트</a>
									<ul>
										<li><a href="#">그릇세트</a></li>
										<li><a href="#">공기/대접</a></li>
										<li><a href="#">접시/플레이트</a></li>
										<li><a href="#">면기/파스타</a></li>
										<li><a href="#">식판/나눔접시</a></li>
										<li><a href="#">유아식기</a></li>
									</ul></li>
								<li><a href="#">수저/커트</a>
									<ul>
										<li><a href="#">수저/커트세트</a></li>
										<li><a href="#">스푼/포크/나이프</a></li>
										<li><a href="#">수저받침/소품</a></li>
									</ul></li>
								<li><a href="#">컵/잔/텀블러</a>
									<ul>
										<li><a href="#">머그컵</a></li>
										<li><a href="#">유리컵/물컵</a></li>
										<li><a href="#">텀블러/보틀</a></li>
										<li><a href="#">물병/주전자</a></li>
										<li><a href="#">맥주잔/와인잔</a></li>
										<li><a href="#">소주/사케/막걸리잔</a></li>
										<li><a href="#">빨대/컵소품/기타</a></li>
									</ul></li>
								<li><a href="#">냄비/프라이팬</a>
									<ul>
										<li><a href="#">냄비/프라이팬세트</a></li>
										<li><a href="#">냄비/뚝배기</a></li>
										<li><a href="#">얍력솥/찜솥</a></li>
										<li><a href="#">그릴</a></li>
									</ul></li>
								<li><a href="#">조리도구/도마</a>
									<ul>
										<li><a href="#">조리도구세트</a></li>
										<li><a href="#">뒤집개/주걱/국자</a></li>
										<li><a href="#">도마</a></li>
										<li><a href="#">채반/바구니</a></li>
										<li><a href="#">찜기</a></li>
										<li><a href="#">계량도구/타이머</a></li>
										<li><a href="#">휴대용가스레인지</a></li>
									</ul></li>
								<li><a href="#">칼/커팅도구</a>
									<ul>
										<li><a href="#">채칼/다지기</a></li>
										<li><a href="#">칼/가위</a></li>
										<li><a href="#">칼세트</a></li>
										<li><a href="#">칼갈이</a></li>
										<li><a href="#">칼꽂이</a></li>
									</ul></li>
								<li><a href="#">주방수납/정리</a>
									<ul>
										<li><a href="#">주방선반/정리대</a></li>
										<li><a href="#">컵걸이/컵꽂이</a></li>
										<li><a href="#">수저통</a></li>
										<li><a href="#">홀더</a></li>
										<li><a href="#">수세미걸이/세제통</a></li>
										<li><a href="#">음식물쓰레기통</a></li>
									</ul></li>
								<li><a href="#">식기건조대</a>
									<ul>
										<li><a href="#">드라잉매트</a></li>
										<li><a href="#">식기건조대</a></li>
										<li><a href="#">설거지통</a></li>
									</ul></li>
								<li><a href="#">보관/용기/도시락</a>
									<ul>
										<li><a href="#">양념통/오일병</a></li>
										<li><a href="#">냉장고정리/소분용기</a></li>
										<li><a href="#">쌀통/브레드함</a></li>
										<li><a href="#">밀폐용기</a></li>
										<li><a href="#">도시락통</a></li>
										<li><a href="#">아이스박스</a></li>
										<li><a href="#">지퍼백/일회용품</a></li>
									</ul></li>
								<li><a href="#">주방잡화</a>
									<ul>
										<li><a href="#">얼음트레이/버킷</a></li>
										<li><a href="#">수세미/브러쉬</a></li>
										<li><a href="#">고무장갑/행주</a></li>
										<li><a href="#">물막이/배수구용품</a></li>
										<li><a href="#">다용도덮개</a></li>
										<li><a href="#">냄비받침/컵받침</a></li>
										<li><a href="#">가스레인지가드</a></li>
									</ul></li>
								<li><a href="#">커피/베이킹용품</a>
									<ul>
										<li><a href="#">커피용품</a></li>
										<li><a href="#">베이킹용품</a></li>
									</ul></li>
							</ul></li>
						<li><a href="#">DIY셀프시공</a>
							<ul>
								<li><a href="#">페인트/부자재</a></li>
								<li><a href="#">벽지/시트지</a></li>
								<li><a href="#">바닥재</a></li>
								<li><a href="#">타일/벽돌</a></li>
								<li><a href="#">목재</a></li>
								<li><a href="#">공구</a></li>
								<li><a href="#">몰딩</a></li>
								<li><a href="#">가구부속품</a></li>
								<li><a href="#">손잡이/방문/유리</a></li>
								<li><a href="#">접착제/보수용품</a></li>
								<li><a href="#">수도/전기</a></li>
							</ul></li>
						<li><a href="#">전문가 서비스</a>
							<ul>
								<li><a href="#">종합시공/올수리</a></li>
								<li><a href="#">부분시공</a></li>
								<li><a href="#">주방</a></li>
								<li><a href="#">도어/중문</a></li>
								<li><a href="#">욕실</a></li>
								<li><a href="#">철거/홈케어</a></li>
								<li><a href="#">마루/장판</a></li>
								<li><a href="#">도배/페인트</a></li>
							</ul></li>
					</ul>

				</aside>


				<main id="cate_main">
				<div class="m_best">
					<div class="m_mar">


						<span>스토어 상품</span><br>
						<hr>
					</div>
					<div class="slider">
						<div>
							<a href="#"><img src="nocrack_store/SB_1.webp"></a>
						</div>
						<div>
							<a href="#"><img src="nocrack_store/SB_2.webp"></a>
						</div>
						<div>
							<a href="#"><img src="nocrack_store/SB_3.webp"></a>
						</div>
						<div>
							<a href="#"><img src="nocrack_store/SB_4.webp"></a>
						</div>
						<div>
							<a href="#"><img src="nocrack_store/SB_3.webp"></a>
						</div>
					</div>
				</div>
				<div class="m_best">
					<div class="m_mar">
						<span>Best 상품</span><br>
						<hr>
					</div>

					<div class="m_img">
						<ul>


							<%
								for (int i = 0; i < article.size(); i++) {
							%>
							<a href="korea.bo?pro_num=<%=article.get(i).getPro_code()%>">
								<li>
									<div class="row">
										<figure class="effect1">
											<img class="m_imgsize"
												src="<%=request.getContextPath()%>/upload/<%=article.get(i).getPro_mainimg()%>">
											<figcaption>
												<p>제품 상세 정보</p>
											</figcaption>
										</figure>
									</div>

									<div class="m_pname"><%=article.get(i).getPro_name()%></div>
									<div class="m_pindex"><%=article.get(i).getPro_info()%></div>
									<div class="m_pindex2"><%=article.get(i).getPro_price()%></div>

							</li>
							</a>
							<%
								}
							%>
						</ul>
					</div>
				</div>

				</main>

			</div>
		</section>

		<footer> </footer>
	</form>
</body>

</html>
