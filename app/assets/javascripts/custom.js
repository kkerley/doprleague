$(document).ready(function(){
	
	jQuery(".best_in_place").best_in_place();
	$(".best_in_place").bind('ajax:success', function(){ $(this).JQtextile('textile', this.innerHTML) });
	
	

	//functions for showing/hiding content expanders
	$("a.expand").click(function(){
		var location = $(this).parent().parent();
		$('.hidden', location).toggle('fast', function() {
			
		    // Animation complete.
		  });
		//$('i.only-this', location).toggleClass('icon-chevron-down icon-chevron-up');
		
	});
	
	
	$("div.alert-success").fadeOut(5000);
	
});