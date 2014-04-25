require 'spec_helper'

describe Contract do
	before(:each) do
		DatabaseCleaner.clean
		
		@admin = FactoryGirl.create(:admin)
		@user = FactoryGirl.create(:user)
		@player = FactoryGirl.create(:player, auction_value: 20, first_name: "Peyton", last_name: "Manning", nfl_team: "DEN", position: "QB")
		
		# import_salary_progressions
		# import_nfl_teams

	end

	it "creates a contract" do
		log_in @admin
		visit "/salary_progressions"
    @file = Rails.root + 'spec/fixtures/files/dopr_salary_chart.csv'
    page.attach_file('file', @file)
    click_button "Import"
	end

end