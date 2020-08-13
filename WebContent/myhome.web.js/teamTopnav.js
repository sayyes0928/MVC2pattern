   $(function () {
            $("#main_nav ul li").hover(
              function () {
                $(this).addClass("main_navov");
              },
              function () {
                $(this).removeClass("main_navov");
              }
            );
          });
    $(function () {
            $("#sub").hide();
            $("#main_nav").hover(function () {
              $("#sub").slideDown();
              $(this).parent().hover(
                  function () {},
                  function () {
                    $("#sub").slideUp(900);
                  }
                );
            });
          });