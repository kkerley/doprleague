require 'spec_helper'

describe SuperBowl do
	# let(:user) { FactoryGirl.create(:user) }
	users = FactoryGirl.create_list(:user, 5)
	let(:super_bowl) { FactoryGirl.create(:super_bowl) }
	
	it "should upload NFL teams and create picks for the 2014 Super Bowl" do
		log_in users[0]
		import_nfl_teams
		visit "/super_bowls/#{super_bowl.year}"
		page.should have_content "2014"
		page.should have_content "New England Patriots"
		page.should have_content "Arizona Cardinals"
		page.should have_content "Buffalo Bills"
		click_link "Edit"
		fill_in "AFC team final score", :with => 48
		fill_in "NFC team final score", :with => 19
		click_button "Update Super bowl" 
		page.should have_content "WINNER: New England Patriots"
		page.should have_content "$5 Super Bowl pick winner: Hilarious Team Name 3"
		save_and_open_page
	end

end