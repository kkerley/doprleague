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

		$(document).on('change', '.stipulation-type', function(){
			var selectBox = $(this);
			var location = selectBox.parent().parent().parent();
		
			var tradeType = selectBox.val();

			if(tradeType == "Player"){
				$('div', location).next('.player-trade-fields').show();
			} else {
				$('div', location).next('.player-trade-fields').hide();
			}
		});
		
		
		$('body').popover({	selector: '[data-toggle="popover"]',
												content: function() { return trader2 } });

		
});