<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

String us_id = (String) session.getAttribute("us_id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tip 게시글 등록</title>

<link rel="stylesheet" href="./myhome.web.css/Tip_write1.css"
	type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>


<script src="./myhome.web.js/Tip_write.js"></script>


</head>
<body>
	<form action="tipwrite.bo" id="contentPage" method="post"
		enctype="multipart/form-data" autocomplete="off">
		<!-- header -->
		<jsp:include page="HeaderTestjsp.jsp"></jsp:include>
		<section>
			<div id="banner_wrap">
				<div id="tip_banner">
					<div id="banner_title1">자취에 대한 모든 것</div>
					<div id="banner_title2">자취생TIP</div>
					<div id="banner_title3">본인 만의 노하우를 알려주세요~</div>
				</div>
			</div>
			<div id="main_wrap">
				<div id="main_header">
					<div id="page_subtitle">Tip 등록</div>
					<hr id="title_line">
				</div>
				<div id="post_title">
					<div id="title_label">
						<label for="write_title">제목</label>
					</div>
					<input id="title_text" type="text" name="write_title"
						placeholder="제목을 입력해 주세요!">

				</div>
					<div id="img_size">
					  <p>커버 이미지 : </p>
					  <input id="cover_img" type="file" name="cover_img">
					</div>
				<textarea id="tip_post" name="tip_post" placeholder="내용을 입력해주세요."></textarea>
		<!-- 		<textarea id="summernote" name="editordata"></textarea>
				        <script>
            $(document).ready(function() {
                $('#summernote').summernote({ // summernote를 사용하기 위한 선언
                    height: 400,
					callbacks: { // 콜백을 사용
                        // 이미지를 업로드할 경우 이벤트를 발생
					    onImageUpload: function(files, editor, welEditable) {
						    sendFile(files[0], this);
						}
					}
				});
			});
		</script> -->


				<div id="button_list">
					<input id="button_insert" type="submit" value="등록하기" onclick="out()"> <input
						id="button_cancel" type="button" value="등록취소"
						onclick="location.href='tiplist.bo'">
				</div>
			</div>

		</section>
		  <script>
      function out() {
    	  var cover = $('#cover_img').val();
    	  
    	  if(!cover){
        	  alert("사진을 첨부해주세요!");
        	  $('#cover_img').focus();
        	  
        	  event.preventDefault();
      	    return;
          }
    	  
      }
      </script>
		<!--  	<script>
	
	$(document).ready(function() {
		 $('#summernote').summernote();
	 });
		 </script> 
		  <script>
	  $(document).ready(function() {
			  
		  $(document).ready(function() {
				//여기 아래 부분
				$('#summernote').summernote({
					  height: 600,                 // 에디터 높이
					  minHeight: null,             // 최소 높이
					  maxHeight: null,             // 최대 높이
					  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
					  lang: "ko-KR",					// 한글 설정
					  placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
			          
				});
			});
      });	 
		  
/*		  $('#summernote').on('summernote.change', function(we, contents, $editable) {
			  console.log('summernote\'s content is changed.');
			});*/

</script>-->


	</form>

</body>
</html>