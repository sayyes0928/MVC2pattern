<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.jachi.DTO.QnABBS"%>

<%
	ArrayList<QnABBS> userpost = (ArrayList<QnABBS>) request.getAttribute("article");
session.setAttribute("US_ID", "ljkim0829");
String us_id = (String) session.getAttribute("US_ID");
String qna_title = request.getParameter("qna_title");
String qna_post = request.getParameter("qna_post");
String qna_pw = request.getParameter("qna_pw");
String qna_num = request.getParameter("qna_num");
String qna_img = request.getParameter("qna_img");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA</title>
<link rel="stylesheet" href="./Teamcss/Beautyroom_write.css"
	type="text/css">
<link
	href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css"
	rel="stylesheet">
	
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
	


<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	

<script>


$(document).ready(function(){
	$('#cancel_bt').hide();

	
});


function getThumbnailPrivew(html, $target) {
	var a = $('#qna_pw').val();

	if (html.files && html.files[0]) {
		var reader = new FileReader();
		
		var b = $('#aa').val();
		var c = '<img src="' + b +"/upload/" + a + '"  border="0" width="400px" height="400px" alt="" />';
		
		reader.onload = function(e) {
			$target.css('display', '');
			//$target.css('background-image', 'url(\"' + e.target.result + '\")'); // 배경으로 지정시
			
			$target.html('<img src="' + e.target.result + '"  border="0" width="400px" height="400px" alt="" />');
		}
		reader.readAsDataURL(html.files[0]);
	}
	
	
	if(reader!=null){
		
		$('#cancel_bt').show();
		$('#cancel_bt').on('click',function(){	
		
		console.log(a);
		console.log(b);	
			$('#bb').val("");
			$target.css('display', '');
			$target.html('<img src="" border="0" width="400px" height="400px" alt="" />');
			$('#cancel_bt').hide();	
		});
		}
	
}
	
	
	
	
</script>

<script>

function existingTag(text)
{
	var existing = false,
		text = text.toLowerCase();

	$(".tags").each(function(){
		if ($(this).text().toLowerCase() == text) 
		{
			existing = true;
			return "";
		}
	});

	return existing;
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
	<form action="qna_modify.bo" method="post"
		enctype="multipart/form-data" autocomplete="off">
		<div id="BT_writemainsize"> 
			<div id="file_upsize">
				<div class="filebox">
					<label for="cma_file">사진변경</label>
					<input type="button" value="취소" id="cancel_bt">
					 <input type="file"
						name="post_pic" id="cma_file" accept="image/*" capture="camera"
						onchange="getThumbnailPrivew(this,$('#cma_image'))"  /> <br/><br/>
					<div id="cma_image"><img src="<%=request.getContextPath()%>/upload/<%=qna_pw%>" border="0" width="400px" height="400px" alt=""></div>
				</div>

				<div class="form__group field">
					<input type="input" class="form__field" placeholder="제목을 입력해주세요"
						name="qna_title" id='name' required maxlength="45" value="<%=qna_title%>"/> <label for="name"
						class="form__label">제목을 입력해주세요 :D</label>
				</div>
				<input type="hidden" value="<%=us_id%>" name="post_nickname">
				<input type="hidden" value="<%=qna_num%>" name="qna_num">
                <input type="hidden" id="qna_pw" value="<%=qna_pw%>">
                <input type="hidden" id="qna_img" value="<%=qna_img%>">
                <input type="hidden" id="aa" value="<%=request.getContextPath()%>">
				<div class="form__group2 field2">
					<textarea class="form__field2" id="BT_writepost" autocomplete="off"
						placeholder="내용을 입력해주세요" name="qna_post" maxlength="150"><%=qna_post%></textarea>
					<label for="name" class="form__label2">내용을 입력해주세요 :D</label>
				</div>
			</div>


<br>
	
			<input type="submit" value="수정완료" id="write_submit">
				
		</div>


	</form>
	</main>
</body>
</html>