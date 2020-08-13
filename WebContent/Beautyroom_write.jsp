<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.jachi.DTO.BeautyRoomDTO"%>

<%
	ArrayList<BeautyRoomDTO> userpost = (ArrayList<BeautyRoomDTO>) request.getAttribute("article");
session.setAttribute("US_ID", "ljkim0829");
String us_id = (String) session.getAttribute("US_ID");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내방을 자랑해주세요</title>
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
		
		
		if(reader!=null){
			$('#add_bt').css('opacity',1);
			$('#add_bt').on('click',function(){
				$('.container').css('display','block');
					$('#add_bt').css('opacity',0);
					$('#cancel_bt').css('opacity',1);
					
				});
			$('#cancel_bt').on('click',function(){
				$('.container').css('display','none');
				$('#add_bt').css('opacity',1);
				$('#cancel_bt').css('opacity',0);
				
			});
			};
		
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

$(function(){
  $(".tags-new input").focus();
  	
  $(".tags-new input").keyup(function(){
      
		var tag = $(this).val().trim(),
		length = tag.length;

		if((tag.charAt(length - 1) == ',') && (tag != ","))
		{
			tag = tag.substring(0, length - 1);

			if(!existingTag(tag))
			{
				$('<li class="tags" ><span name="tagtest">' + tag + '</span><i class="fa fa-times" ></i></i></li>').insertBefore($(".tags-new"));
				$(this).val("");	
				
			}
			else
			{
				$(this).val(tag);
			}
	         
			 
			}
		

	});
  
  $(document).on("click", ".tags i", function(){
    $(this).parent("li").remove();
    
  });

});
            function test(aaa){
            	var tagAll = "";
            	var tagList = document.getElementsByName("tagtest");    
				 for (var i = 0; i < tagList.length; i++) {
					 tagAll += tagList[i].innerHTML;
			}
				
				 document.getElementById('myField').value = tagAll;
				 alert(tagAll);
				 aaa.submit();
				 
            }
 	
            
            
            
     
            $(document).ready(function(){ 
            	$(".imgAdd").on("click",function () {
            		var aa = new FileReader();
            		
            			$(this)
                	    .closest(".row")
                	    .find(".imgAdd")
                	    .before(
                	      '<div class="col-sm-2 imgUp" id="aa"><div class="imagePreview"></div><label class="btn btn-primary">사진추가<input type="file" class="uploadFile img" value="Upload Photo" style="width:0px;height:0px;overflow:hidden;"></label><i class="fa fa-times del"></i></div>'
                	    );

            		if($('.del').length==2){
            			$('.imgAdd').hide();
            			
            		}
            		
            	 
           	});});
          
            	
            $(document).on("click", "i.del", function () {
            	  $(this).parent().remove();
            	  $('.imgAdd').show();
            	});
            	$(function () {
            	  $(document).on("change", ".uploadFile", function () {
            	    var uploadFile = $(this);
            	    var files = !!this.files ? this.files : [];
            	    if (!files.length || !window.FileReader) return; // no file selected, or no FileReader support

            	    if (/^image/.test(files[0].type)) {
            	      // only image file
            	      var reader = new FileReader(); // instance of the FileReader
            	      reader.readAsDataURL(files[0]); // read the local file

            	      reader.onloadend = function () {
            	        // set image data as background of div
            	        //alert(uploadFile.closest(".upimage").find('.imagePreview').length);
            	        uploadFile
            	          .closest(".imgUp")
            	          .find(".imagePreview")
            	          .css("background-image", "url(" + this.result + ")");
            	      };
            	    }
            	  });
            	});

            
</script>
</head>
<body>
	<header>
		<div id="BT_writebannersize">
			<a href="#" id="BT_writebanner"><span>자취해보자</span></a>
		</div>

	</header>
	<main>
	<form name="aaa" id="aaa" action="beauty_write.bo" method="post"
		enctype="multipart/form-data" autocomplete="off">
		<div id="BT_writemainsize">
			<div id="file_upsize">
				<div class="filebox">
					<label for="cma_file">내 방사진 자랑하기</label>
					<input type="button" value="사진추가하기" id="add_bt">
					 <input type="button" value="취소" id="cancel_bt">
					 <input type="file"
						name="post_pic" id="cma_file" accept="image/*" capture="camera"
						onchange="getThumbnailPrivew(this,$('#cma_image'))" /> <br/><br/>
					<div id="cma_image"></div>
				</div>

				<div class="form__group field">
					<input type="input" class="form__field" placeholder="제목을 입력해주세요"
						name="post_title" id='name' required /> <label for="name"
						class="form__label">제목을 입력해주세요 :D</label>
				</div>
				<input type="hidden" value="<%=us_id%>" name="post_nickname">


				<div class="form__group2 field2">
					<textarea class="form__field2" id="BT_writepost" autocomplete="off"
						placeholder="내용을 입력해주세요" name="post_posting"></textarea>
					<label for="name" class="form__label2">내용을 입력해주세요 :D</label>
				</div>
			</div>


<br>
<div class="container">
  <div class="row">
    <div class="col-sm-2 imgUp">
      <div class="imagePreview"></div>
      <label class="btn btn-primary">
        사진추가<input type="file" class="uploadFile img" value="Upload Photo" style="width: 0px;height: 0px;overflow: hidden;"/>
      </label>
    </div>
    <i class="fa fa-plus imgAdd"></i>
  </div>
</div>



			<div id="tag_size">
				<div id="wrapper">
					<p>내 맘대로 태그</p>
					<ul class="tags-input">
						<li class="tags">자취해보자<i class="fa fa-times"></i></li>
						<li class="tags-new"><input type="text"></li>
					</ul>
				</div>
			</div>

			<input type="button" value="등록완료" id="write_submit"
				onclick="test(aaa)">
		</div>


	</form>
	</main>
</body>
</html>