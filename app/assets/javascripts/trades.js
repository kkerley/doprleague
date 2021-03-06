$(document).ready(function(){
		
	$('body').popover({	selector: '[data-toggle="popover"]',
											content: function() { return trader2 } });
	var trader1;
	var trader2;
	var escaped_trader2;
	var options;
	var players = $('.filtered-players-select').html();
	var directionBox;
	var dbLoctation;

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
		var location = selectBox.closest(".stipulation.fields");	
		var tradeType = selectBox.val();

		$('div', location).find('.trade-direction').prop('selectedIndex',0);


		if(tradeType == "Player"){
			$(document).on('change', '.trade-direction', function(){
				directionBox = $(this);
				dbLoctation = directionBox.closest(".stipulation.fields");
				
				
				var directionBoxRelatedPlayers = dbLoctation.find('.player-trade-fields');
				directionBoxRelatedPlayers.toggle();

				$('div', dbLoctation).next('.terms-field').hide();

				if(directionBox.val() == "from"){
					setDropdowns(trader2, directionBoxRelatedPlayers);
					
				} else {
					trader1 = $('#trader1_team_name').text();
					setDropdowns(trader1, directionBoxRelatedPlayers);
				}
			});
			
			
		} else if(tradeType == "Cap space") {
			$(document).on('change', '.trade-direction', function(){
				directionBox = $(this);
				dbLoctation = directionBox.closest(".stipulation.fields");
				
				location.find('.player-trade-fields').hide();
				location.find('.terms-field').show();
				location.find('.input-group-addon.cap-space').css('display', 'table-cell');
			});
		} else if(tradeType == "Draft spot") {
			$(document).on('change', '.trade-direction', function(){
				directionBox = $(this);
				dbLoctation = directionBox.closest(".stipulation.fields");
				
				location.find('.player-trade-fields').hide();
				location.find('.terms-field').show();
				location.find('.input-group-addon.draft-spot').css('display', 'table-cell');
			});
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