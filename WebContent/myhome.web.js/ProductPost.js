
    $(document).ready(function() {
      $('#pr_imgs li img').on("mouseover", function() {
        $('#showimg').show();
        var imgSrc = "";
        imgSrc = $(this).attr("src");
        imgSrc = "<img src='" + imgSrc + "' />";
        $('#showimg').html(imgSrc);
      });
    });
  
               
    $(document).ready(function() {
        $('#pr_imgs li img').hover(
          function() {
            $(this).removeClass('.s_imgborder');
            $(this).addClass('imghover');
          },
          function() {
            $(this).removeClass('imghover');
          }
        );
      });
    
    
  //////////// 주문 목록 리스트 
    $(function() {
  	  $('#Option1').on('change', function() {   		    
		 	 var pro_name = $('#product_name').text();
		     var optiongroup = $('#Option1 option:first').val();
		     var option = $('#Option1 option:selected').val();  		     	
		     var buylist_cell1 = $("#buylist_cell1").html();
 		     var item_size = $("#Option1 option").size(); 
  		     var idx = $("#Option1 option").index($("#Option1 option:selected"));
  		     var item_text = $("#Option1 option:selected").text();
 		     var option2 = $("#buylist_section1 #buy_option").text();
  		     alert(option2);
//  		     if(){
//  		    	 
//  		     };
  		     $("#buylist_section1").css("display", "block");
  		     $("#buylist1").text( pro_name+" / "+optiongroup+" : ");	
  		   $("#buy_option").text(option);	
  		     $("#buylist_cell2").append(buylist_cell1);
		       		     
  		 });
    });
    
   ////////// 주문 목록 삭제버튼
    $(document).on("click","#buylist_delete1",function(){
        $(this, '#buylist_delete1').parent().css("display", "none");
    });
    

   
    function createRow() {

      var ta = document.getElementById("review_list");
      var ta1 = document.getElementById("review_list");
      var ta2 = document.getElementById("review_list");
      var row = ta.insertRow(ta.rows.length);
      var row1 = ta1.insertRow(ta1.rows.length);
      var row2 = ta2.insertRow(ta2.rows.length);
      var td1 = row.insertCell(0);
      var td2 = row1.insertCell(0);
      var td3 = row2.insertCell(0);

      td1.innerHTML = "리뷰쓰기";
      td2.innerHTML = "<textarea name='name' rows='8' cols='80'></textarea>";
      td3.innerHTML = "<input type='button' value='리뷰등록' onclick='' />"
                     +"<input type='button' value='리뷰취소' onclick='delCheck(this)' />";
    }


    function delCheck(obj) {
      var tr = obj.parentNode.parentNode.parentNode;
      tr.parentNode.removeChild(tr);
    }
