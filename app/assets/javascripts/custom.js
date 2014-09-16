$(document).ready(function(){
	
	jQuery(".best_in_place").best_in_place();
	$(".best_in_place").bind('ajax:success', function(){ $(this).JQtextile('textile', this.innerHTML) });
	
	var rand = Math.floor(Math.random() * 100) + 1;

	if(rand == 7){		
		$('#richard_sherman').show();
		$('#richard_sherman').click(function(){
			$(this).fadeOut('fast');
		});
	}

	//functions for showing/hiding content expanders
	$("a.expand").click(function(){
		var location = $(this).parent().parent();
		$('.hidden-content', location).toggle('fast', function() {
			
		    // Animation complete.
		  });
		$('i.only-this', location).toggleClass('fa fa-angle-down fa fa-angle-up');
		
	});
	
	
	$("div.alert-success").fadeOut(2000);
	$("div.alert-danger").fadeOut(2000);



	// function for going to a specific tab
	$(function () {
	   var activeTab = $('[href=' + location.hash + ']');
	   activeTab && activeTab.tab('show');
	});
	
	//enabling tooltip on the global search button
	$('#btn_players_search').tooltip();

	$('.add-to-draft-roster').click(function(event){
		event.preventDefault();
	});


	$('.longterm_check_box').on('click', function(){
		$('.longterm_length').toggle();
	});

	$('#user_quick_look_trigger').click(function(){
		if($(this).parent().css("right") == "-316px"){
			$('#user_quick_look').animate({ 'right': 0 }, 400); 
		} else {
			$('#user_quick_look').animate({ 'right': "-316px" }, 400); 
		}
		
	});
});