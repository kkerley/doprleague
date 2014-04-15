require 'spec_helper'

describe Team do
	before(:each) do
		DatabaseCleaner.clean
		
		@admin = FactoryGirl.create(:admin)
		@user = FactoryGirl.create(:user)
		@player = FactoryGirl.create(:player, auction_value: 20, first_name: "Peyton", last_name: "Manning", nfl_team: "DEN", position: "QB")
		
		# import_salary_progressions
		# import_nfl_teams

	end

	context "creating a contract" do
		it "has a team page" do
			visit "/"
			click_link "Members"
			# click_link "Hilarious Team Name 2 [person1]"
			# save_and_open_page
		end

		it "creates a 4 year long contract" do
			log_in @admin
			visit "/salary_progressions"
	    @file = Rails.root + 'spec/fixtures/files/dopr_salary_chart.csv'
	    page.attach_file('file', @file)
	    click_button "Import"
	    # save_and_open_page
	    page.should have_content "Salary chart imported."
	    # save_and_open_page
	    team = @user.team
			contract = FactoryGirl.create(:contract, contract_length: 4, contracted_team: team.id, player_id: @player.id)
	 		visit "/contracts"
	 		click_link "contracted"
	 		save_and_open_page
		end

		it "allows a GM to extend and franchise a contract" do
			

		end

	end 
end