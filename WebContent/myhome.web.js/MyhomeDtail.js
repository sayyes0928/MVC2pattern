
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
    
    
 
