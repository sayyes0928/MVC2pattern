   $(function () {
	   $("#sub").hide();
            $("#main_nav ul li").mouseover(		
              function () {	  
                $(this).addClass("main_navov");
                $(this).addClass("sub_menu");
                $("#main_nav").mouseenter(function () {
                    $("#sub").slideDown();
                  });
                $("#m_line li").hover(function () {},function(){             
                    $("#main_nav ul li").removeClass("sub_menu",function(){
                    	 $("#sub").slideUp(1500);
                    });
                               });
              }
            );
            $("#main_nav ul li").mouseout( function () {
                $(this).removeClass("main_navov");
            });
          });
    $(function () {
//            $("#sub").hide();
//            $("#main_nav").mouseenter(function () {
//              $("#sub").slideDown();
//              $("#main_nav ul li").addClass("sub_menu");
//            });
//            $("#main_nav li").mouseleave(function () {
//                $("#sub").slideUp(1500);
//                $("#main_nav ul li").removeClass("sub_menu");
//                           });
            });
