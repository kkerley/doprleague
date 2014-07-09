# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
	location = $(this)
	$('.watchable', location).popover('hide')
	$(document).on "click", ".watchable", location ->
	  
	  return
	#$('.watchable', location).click().popover('show')