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
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script>

$(".upload-action").click(function () {
	  $(".upload-input").click();
	  $(".upload-input").change(function () {
	    preview(this, $(".preview-box"));
	  });
	});

	function preview(file, previewBox) {
	  if (file.files && file.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function (e) {
	      previewBox.html('<img src="' + e.target.result + '" />');
	    };
	    reader.readAsDataURL(file.files[0]);
	  } else {
	    previewBox.html(
	      '<div class="img" style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\'' + file.value + "'\"></div>'
	    );
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
	<div id="BT_writemainsize">
		<div class="upload-box">
			<input type="file" accept="image/png,image/jpeg,image/jpg"
				class="upload-input" />
			<div class="upload-action"></div>
			<div class="preview-box"></div>
		</div>
	</div>
	</main>
</body>
</html>