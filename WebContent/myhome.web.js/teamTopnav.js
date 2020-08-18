$(function() {
	$('#main_nav ul li').hover(function() {
		$(this).addClass('main_navov');
	}, function() {
		$(this).removeClass('main_navov');
	});
});
$(function() {
	$('#sub').hide();
	$('#main_nav').hover(function() {
		$(this).parent().find('#sub').slideDown();
		$(this).parent().hover(function() {

		}, function() {
			$(this).parent().find('#sub').slideUp(900);
		});
	});
});
