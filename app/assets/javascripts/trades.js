$(document).ready(function(){
		
	$('body').popover({	selector: '[data-toggle="popover"]',
											content: function() { return trader2 } });
	var trader1;
	var trader2;
	var escaped_trader2;
	var options;
	var players = $('.filtered-players-select').html();
	// console.log(players);

	

	$(document).on('change','#trade_trader2_id', function(){
		var selectVal = $(this).val();
		trader2 = $('#trade_trader2_id :selected').text();

		if(selectVal){
			$('.hidden-content').show();
		} else {
			$('.hidden-content').hide();
		}
	});


	$(document).on('change', '.stipulation-type', function(){
		var selectBox = $(this);
		var location = selectBox.parent().parent().parent();
	
		var tradeType = selectBox.val();

		if(tradeType == "Player"){
			$(document).on('change', '.trade-direction', function(){
				var directionBox = $(this);
				var dbLoctation = directionBox.parent().parent().parent();
				
				var directionBoxRelatedPlayers = $('div', dbLoctation).next('.player-trade-fields');
				directionBoxRelatedPlayers.show();

				$('div', dbLoctation).next('.terms-field').hide();

				if(directionBox.val() == "from"){
					setDropdowns(trader2, directionBoxRelatedPlayers);
					//console.log(options);
				} else {
					trader1 = $('#trader1_team_name').text();
					setDropdowns(trader1, directionBoxRelatedPlayers);
					//$('div', dbLoctation).next('.player-trade-fields').css("background-color", "#c00");
				}
			});
			
			
		} else {
			$('div', location).next('.player-trade-fields').hide();
			$('div', location).next('.terms-field').show();
		}
	});
	

	function setDropdowns(trader, location) {
	  escaped_trader = trader.replace(/([ #;&,.+*~\':"!?^$[\]()=>|\/@])/g, '\\$1');
		options = "<option value=''>Select</option>";
		options += $(players, location).filter("optgroup[label=" + escaped_trader + "]").html();

		if(options){
			$('.filtered-players-select', location).html(options);
		} else {
			$('.filtered-players-select', location).empty();
		}
	}
});