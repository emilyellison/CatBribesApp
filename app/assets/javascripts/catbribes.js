$(document).ready( function() {
	
	$('.star').live('click',function() {
	    $(this).closest('form').submit();
	});
	
	$('#catBribesTab a').click(function (e) {
	  e.preventDefault();
	  $(this).tab('show');
	})
	
	$(function() {
		$( "#datepicker" ).datepicker({});
	});

});