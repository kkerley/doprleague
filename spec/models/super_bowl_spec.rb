require 'spec_helper'

describe SuperBowl do
	let(:super_bowl) { FactoryGirl.create(:super_bowl) }

	before(:each) do
		DatabaseCleaner.clean
		# @super_bowl = FactoryGirl.create(:super_bowl)
		@admin = FactoryGirl.create(:admin)
		@users = FactoryGirl.create_list(:user, 5)
		log_in @admin
		import_nfl_teams
		# @super_bowl = FactoryGirl.create(:super_bowl)
		visit "/super_bowls/#{super_bowl.year}"
		click_link "Edit"
		fill_in "AFC team final score", :with => 48
		fill_in "NFC team final score", :with => 19
		click_button "Update Super bowl"
	end

	context "users have different picks" do
		
		it "uploads NFL teams and create picks for the 2014 Super Bowl" do
			visit "/super_bowls/#{super_bowl.year}"
			page.should have_content "2014"
			page.should have_content "New England Patriots"
			page.should have_content "Arizona Cardinals"
			
			 
			page.should have_content "WINNER: New England Patriots"
			# page.should have_content "$5 Super Bowl pick winner: Hilarious Team Name 4"
			page.should have_content "Hilarious Team Name 4 chose New England Patriots"
			# visit "/super_bowl_picks"
			# visit "/members"
			save_and_open_page
		end
	end # end of context "users have different picks"

	context "users have the same pick" do
		

		it "only shows total score if a tiebreaker is necessary" do
			visit "/super_bowls/#{super_bowl.year}"
			click_link "Edit"
			check('Tie breaker')
			click_button "Update Super bowl"
			page.should have_content "Total points scored: 67"
			# save_and_open_page
		end

		it "makes users put in tiebreaker total" do
			users = FactoryGirl.create_list(:user, 5)
			picks = super_bowl.super_bowl_picks
		end
	end # end of context "users have the same pick"
end