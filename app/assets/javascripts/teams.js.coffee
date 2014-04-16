# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# amCharts script for showing the donut chart on teams#show
members_chart = undefined
members_chartData = gon.all_users_and_awards if gon
AmCharts.ready ->
  
  # PIE CHART
  members_chart = new AmCharts.AmPieChart()
  members_chart.dataProvider = members_chartData
  members_chart.titleField = "display_name"
  members_chart.valueField = "total_winnings"
  members_chart.sequencedAnimation = true
  members_chart.startEffect = "elastic"
  members_chart.innerRadius = "30%"
  members_chart.startDuration = 1
  members_chart.labelRadius = 15
  members_chart.balloonText = "[[title]]<br><span style='font-size:14px'><b>$[[value]]</b> ([[percents]]%)</span>"
  
  # the following two lines makes the chart 3D
  members_chart.depth3D = 10
  members_chart.angle = 15
  
  # WRITE                                 
  members_chart.write "members-chartdiv"
  return

$("#payouts-tab").click ->
  members_chart.invalidateSize()
  return
