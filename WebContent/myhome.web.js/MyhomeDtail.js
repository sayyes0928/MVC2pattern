$(document).ready(function() {
	
      $('#pr_imgs li img').on("mouseover", 
    		  function() {
    	 console.log("들어옴");
        $('#showimg').show();
        var imgSrc = "";
        imgSrc = $(this).attr("src");
        imgSrc = "<img src='" + imgSrc + "' />";
        $('#showimg').html(imgSrc);
      });
    
       $('#pr_imgs li img').hover(
          function() {
            $(this).removeClass('.nav-thumb');
            $(this).addClass('imghover');
          },
          function() {
            $(this).removeClass('imghover');
          });
      
       
       $('#pr_imgs li img').on("mouseover", function() {
    	  	 console.log("들어옴");
    	      $('#showimg').show();
    	      var imgSrc = "";
    	      imgSrc = $(this).attr("src");
    	      imgSrc = "<img src='" + imgSrc + "' />";
    	      $('#showimg').html(imgSrc);
    	    });

    	      $('#pr_imgs li img').hover(
    	        function() {
    	          $(this).removeClass('.nav-thumb');
    	          $(this).addClass('imghover');
    	        },
    	        function() {
    	          $(this).removeClass('imghover');
    	        }
    	      ); 
    });

// 추천버튼 클릭시(추천 추가 또는 추천 제거)
$(function(){
	$("#heart_btn").click(function(){
	   var nowImage = $("#heart_btn img").attr("src");
		var LikeChecked = "./img/myhome/icons8-heart-50-2.png";
		var LikeUnchecked = "./img/myhome/icons8-heart-50.png";
		if(nowImage == LikeChecked){
			$("#heart_btn img").attr("src", LikeUnchecked);
		}else{
			$("#heart_btn img").attr("src", LikeChecked);
		}
		var post_no = document.getElementById("post_no").value;
		var us_id = document.getElementById("us_id").value;
		console.log(post_no);
		$.ajax({
			
			url: 'LikeUpdate.bo',
           type: "POST",
           data: {
               no: post_no,
               id: us_id
           },
           success: function (heart) {
        	
      			
           },
		})
	})
});
// 스크랩시 등록
$(function(){
	$("#bookmark_btn").click(function(){
	   var nowImage = $("#bookmark_btn img").attr("src");
		var LikeChecked = "./img/myhome/icons8-bookmark-50.png";
		var LikeUnchecked = "./img/myhome/icons8-bookmark-50-2.png";
		if(nowImage == LikeChecked){
			$("#bookmark_btn img").attr("src", LikeUnchecked);
		}else{
			$("#bookmark_btn img").attr("src", LikeChecked);
		}
		var post_no = document.getElementById("post_no").value;
		var us_id = document.getElementById("us_id").value;
		console.log(post_no);
		$.ajax({
			
			url: 'BookMarkUpdate.bo',
           type: "POST",
           data: {
               no: post_no,
               id: us_id
           },
           success: function (heart) {
        	
      			
           },
		})
	})
});