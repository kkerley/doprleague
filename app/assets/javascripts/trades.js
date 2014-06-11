$(document).ready(function(){
	var trader2;
	$('#trade_trader2_id').change(function(){
		var selectVal = $(this).val();
		if(selectVal){
			$('.hidden-content').show();
			trader2 = $('#trade_trader2_id option:selected').text(); 
		} else {
			$('.hidden-content').hide();
		}

		
	});
	
	
	$('body').popover({	selector: '[data-toggle="popover"]',
											content: function() { return trader2 } });

});