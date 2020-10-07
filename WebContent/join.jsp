<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign UP</title>

<!-- <link rel="stylesheet" href="header.css" type="text/css"> -->
<link rel="stylesheet" href="./myhome.web.css/join.css" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="./myhome.web.js/join.js"></script>
<script src="./myhome.web.js/teamTopnav.js"></script>

<script>
function cancel(){
	location.href='Jachi_main.bo';
}
</script>

</head>
<body>
	<form name="myform" action="join_Insert.bo" method="post" enctype="multipart/form-data" autocomplete="off">
	<header>
        <div id="h_wrap">
          <div class="h_div">
         
       <jsp:include page="HeaderTestjsp.jsp"></jsp:include>
        
        
      </header>
		<section>
			<table style="height:1250">
				<tr>
					<td id="subtitle" colspan="2">
						<h2 id="subtitle1">일반</h2>
						<h2>회원가입</h2>
					</td>
				</tr>
				<tr>
					<th>아이디 :</th>
					<td><input id="id_check" type="text" name="id"> 
					<span id="ok"></span></td>
				</tr>
				<tr>
					<th>비밀번호 :</th>
					<td><input id="pw" type="password" name="pw"></td>
				</tr>
				<tr>
					<th>비밀번호 확인 :</th>
					<td><input id="pw_check" type="password" name="pw_check"
						onchange="password_check()"> <span id="same"></span></td>
				</tr>
				<tr>
					<th>이름 :</th>
					<td><input id="name" type="text" name="name"></td>
				</tr>
				<tr>
					<th>닉네임 :</th>
					<td><input id="nick_check" type="text" name="nick">
					<span id="ok2"></span></td>
				</tr>
				<tr>
					<th>프로필 사진 :</th>
					<td><input id="profile_img" type="file" name="profile_img"
					 accept="image/gif, image/jpeg, image/png">
				</tr>
				<tr>
					<th>생년월일 :</th>
					<td><input id="year" type="text" name="year" value="" size="4"
						placeholder="년(4자)"> <select id="month" name="month">
							<option>월</option>
							<option>01</option>
							<option>02</option>
							<option>03</option>
							<option>04</option>
							<option>05</option>
							<option>06</option>
							<option>07</option>
							<option>08</option>
							<option>09</option>
							<option>10</option>
							<option>11</option>
							<option>12</option>
					</select> <select id="day" name="day">
							<option>일</option>
							<option>01</option>
							<option>02</option>
							<option>03</option>
							<option>04</option>
							<option>05</option>
							<option>06</option>
							<option>07</option>
							<option>08</option>
							<option>09</option>
							<option>10</option>
							<option>11</option>
							<option>12</option>
							<option>13</option>
							<option>14</option>
							<option>15</option>
							<option>16</option>
							<option>17</option>
							<option>18</option>
							<option>19</option>
							<option>20</option>
							<option>21</option>
							<option>22</option>
							<option>23</option>
							<option>24</option>
							<option>25</option>
							<option>26</option>
							<option>27</option>
							<option>28</option>
							<option>29</option>
							<option>30</option>
							<option>31</option>
					</select></td>
				</tr>
				<tr>
					<th>휴대폰 :</th>
					<td><select id="phon1" name="phon1">
							<option value="010">010</option>
							<option value="011">011</option>
					</select> - <input id="phon2" type="text" name="phon2" value="" size="5">
						- <input id="phon3" type="text" name="phon3" value="" size="5"></td>
				</tr>
				<tr>
					<th>SMS수신 :</th>
					<td><input type="radio" name="sms_agree" value="agree">
						수신동의 <input id="sms_agree" type="radio" name="sms_agree"
						value="disagree" checked="checked"> 수신거부</td>

				</tr>
				<tr>
					<th>이메일 :</th>
					<td><input id="email1" type="text" name="email1" value="">
						@ <input id="email2" type="text" name="email2"> <select
						id="email_select" onchange="emailauto(myform.email_select)">
							<option>직접입력</option>
							<option>naver.com</option>
							<option>hanmail.net</option>
							<option>gmail.com</option>
					</select></td>
				</tr>
				<tr>
					<th>메일수신 :</th>
					<td><input type="radio" name="email_agree" value="agree">
						수신동의 <input id="email_agree" type="radio" name="email_agree"
						value="disagree" checked="checked"> 수신거부</td>
				</tr>
				<tr>
					<th>주소 :</th>
					<td><input id="sample6_postcode" type="text" name="postcode"
						value="" size="8" placeholder="우편번호"> <input type="button"
						value="우편번호 찾기" onclick="sample6_execDaumPostcode()"> <br>
						<input id="sample6_address" type="text" name="addr1" value=""
						size="48" placeholder="주소"> <br> <input
						id="sample6_detailAddress" type="text" name="addr2" value=""
						size="48" placeholder="상세주소"> <input
						id="sample6_extraAddress" type="text" name="addr3" value=""
						placeholder="참고항목"></td>
				</tr>
				<tr>
					<th id="agree_title" colspan="2">이용약관 동의</th>
				</tr>
				<tr>
					<td class="agree_cell" colspan="2"><iframe src="yak.html"
							width="700" height=""></iframe></td>
				</tr>
				<tr>
					<td class="agree_check" colspan="2">
						<div class="agree_checkbox">
							이용약관에 동의하십니까? <input type="checkbox" name="agree1" value="agree">
							동의함
						</div>
					</td>
				</tr>
				<tr>
				<th id="agree_title" colspan="2">개인정보 수집 및 이용 동의</th>
				</tr>
				<tr>
					<td class="agree_cell" colspan="2"><iframe src="gain.html"
							width="700" height=""></iframe></td>
				</tr>
				<tr>
					<td class="agree_check" colspan="2">
						<div class="agree_checkbox">
							이용약관에 동의하십니까? <input type="checkbox" name="agree2" value="agree">
							동의함
						</div>
					</td>
				</tr>

				<tr>
					<td id="lastbutton" colspan="2"><input id="joinbutton"
						type="button" name="SUBMIT" value="가입하기" onclick="out()">
						<input type="button" name="CANCEL" value="취소하기" id="cancelbt" onclick='cancel()'></td>
				</tr>
			</table>
		</section>
	</form>
</body>
</html>