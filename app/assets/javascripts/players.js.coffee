# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
	location = $(this)
	# rosters = gon.current_user_draft_rosters
	# all_rosters = []

	# buildLink = (roster) ->
		# @roster_name = '<% form_tag(new_player_path) do %>Add a new roster<% end %>'
		# all_rosters += @roster_name

	# buildLink roster for roster in rosters
		
	# $('.watchable', location).attr('data-content', all_rosters)
	$('.watchable', location).popover('hide')