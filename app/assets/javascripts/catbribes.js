$(document).ready( function() {
	$('.star').live('click',function() {
	    $(this).closest('form').submit();
	});
});