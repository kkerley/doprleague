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
	
	
	$("div.alert-success").fadeOut(5000);




	var members_chart;

	var members_chartData = gon.all_users_and_awards; 


	AmCharts.ready(function () {
	    // PIE CHART
	    members_chart = new AmCharts.AmPieChart();
	   
	    members_chart.dataProvider = members_chartData;
	    members_chart.titleField = "display_name";
	    members_chart.valueField = "total_winnings";
	    members_chart.sequencedAnimation = true;
	    members_chart.startEffect = "elastic";
	    members_chart.innerRadius = "30%";
	    members_chart.startDuration = 1;
	    members_chart.labelRadius = 15;
	    members_chart.balloonText = "[[title]]<br><span style='font-size:14px'><b>$[[value]]</b> ([[percents]]%)</span>";
	    // the following two lines makes the chart 3D
	    members_chart.depth3D = 10;
	    members_chart.angle = 15;
	    
	    // WRITE                                 
	   members_chart.write("members-chartdiv");
	});

	
});