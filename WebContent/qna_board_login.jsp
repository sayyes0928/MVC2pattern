<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC2 로그인</title>
<style type="text/css">

</style>
</head>
<body>
	<!-- 로그인 -->

	<section id="writeForm">
		<h2>로그인</h2>
		<form action="boardLoginPro.bo" method="post" name="boardform">
			<table>
				<tr>
					<td class="td_left"><label for="userID">글쓴이</label></td>
					<td class="td_right"><input type="text" name="userID"
						id="BOARD_NAME" required="required" /></td>
				</tr>
				<tr>
					<td class="td_left"><label for="userPW">비밀번호</label></td>
					<td class="td_right"><input name="userPW" type="password"
						id="BOARD_PASS" required="required" /></td>
				</tr>
				
			</table>
			<section id="commandCell">
				<input type="submit" value="등록">&nbsp;&nbsp; <input
					type="reset" value="다시쓰기" />
			</section>
		</form>
	</section>
	<!-- 게시판 등록 -->
</body>
</html>