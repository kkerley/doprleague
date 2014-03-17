require 'spec_helper'

describe SuperBowl do
	let(:super_bowl) { FactoryGirl.create(:super_bowl) }

	before(:each) do
		DatabaseCleaner.clean
		# @super_bowl = FactoryGirl.create(:super_bowl)
		@admin = FactoryGirl.create(:admin)
		log_in @admin
		import_nfl_teams
		visit "/super_bowls/#{super_bowl.year}"
		click_link "Edit"
		fill_in "AFC team final score", :with => 48
		fill_in "NFC team final score", :with => 19
		click_button "Update Super bowl"
	end
	# let(:user) { FactoryGirl.create(:user) }
	
	


	context "users have different picks" do
		it "uploads NFL teams and create picks for the 2014 Super Bowl" do
			users = FactoryGirl.create_list(:user, 5)
			pick1 = FactoryGirl.create(:super_bowl_pick, super_bowl: super_bowl, team: users[0].team, nfl_team_id: 1)
			pick2 = FactoryGirl.create(:super_bowl_pick, super_bowl: super_bowl, team: users[1].team, nfl_team_id: 2)
			pick3 = FactoryGirl.create(:super_bowl_pick, super_bowl: super_bowl, team: users[2].team, nfl_team_id: 3)
			pick4 = FactoryGirl.create(:super_bowl_pick, super_bowl: super_bowl, team: users[3].team, nfl_team_id: 4)
			pick5 = FactoryGirl.create(:super_bowl_pick, super_bowl: super_bowl, team: users[4].team, nfl_team_id: 5)
			# visit "/"
			# log_in users[0]

			page.should have_content "2014"
			page.should have_content "New England Patriots"
			page.should have_content "Arizona Cardinals"
			save_and_open_page
			# page.should have_content "Buffalo Bills"
			 
			page.should have_content "WINNER: New England Patriots"
			page.should have_content "$5 Super Bowl pick winner: Hilarious Team Name 3"
			# save_and_open_page
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