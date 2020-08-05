<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.jachi.DTO.BeautyRoomDTO"%>

<%
	ArrayList<BeautyRoomDTO> userpost = (ArrayList<BeautyRoomDTO>) request.getAttribute("article");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내방을 자랑해주세요</title>
<link rel="stylesheet" href="./Teamcss/Beautyroom_write.css"
	type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script>
	function getThumbnailPrivew(html, $target) {
		if (html.files && html.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$target.css('display', '');
				//$target.css('background-image', 'url(\"' + e.target.result + '\")'); // 배경으로 지정시
				$target
						.html('<img src="' + e.target.result + '" border="0" width="400px" height="400px" alt="" />');
			}
			reader.readAsDataURL(html.files[0]);
		}
	}
</script>


</head>
<body>
	<header>
		<div id="BT_writebannersize">
			<a href="#" id="BT_writebanner"><span>자취해보자</span></a>
		</div>

	</header>
	<main>
	<form name="form" id="form" action="" method="post"
		enctype="multipart/form-data" autocomplete="off">
		<div id="BT_writemainsize">
			<div id="file_upsize">
				<div class="filebox">
					<label for="cma_file">내 방사진 자랑하기</label> <input type="file"
						name="cma_file" id="cma_file" accept="image/*" capture="camera"
						onchange="getThumbnailPrivew(this,$('#cma_image'))" /> <br /> <br />
					<div id="cma_image"></div>
				</div>
				
				<div class="form__group field">
  <input type="input" class="form__field" placeholder="제목을 입력해주세요" name="name" id='name' required />
  <label for="name" class="form__label">제목</label>
</div>
				
				
				<input type="text" id="BT_wirtepost" autocomplete="off" placeholder="내용을 입력해주세요">
			</div>
			<input type="submit" value="등록완료" id="write_submit">
		</div>
	</form>
	</main>
</body>
</html>