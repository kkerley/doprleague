$(document).ready(function(){
	
	jQuery(".best_in_place").best_in_place();
	$(".best_in_place").bind('ajax:success', function(){ $(this).JQtextile('textile', this.innerHTML) });
	
	

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



});