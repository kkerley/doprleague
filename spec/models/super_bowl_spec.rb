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
		end
	end # end of context "users have different picks"

	context "users have the same pick" do	

		it "makes users put in tiebreaker total" do
		
			tied_users = FactoryGirl.create_list(:user_tie_breaker, 3)
			tied_users2 = FactoryGirl.create_list(:user_tie_breaker2, 2)
			picks = super_bowl.super_bowl_picks
			visit "/super_bowls/#{super_bowl.year}"
			click_link "Edit"
			
			click_button "Update Super bowl"

			# picks.by_team(super_bowl.nfl_team1_id).size.should == 5

			page.should have_content "Tie breakers"
			save_and_open_page
			visit "/payouts"
			save_and_open_page

		end
	end # end of context "users have the same pick"
end