require 'spec_helper'
require 'cancan/matchers'

describe SalaryProgression do
	let(:user) { FactoryGirl.create(:user) }
  let(:admin) { FactoryGirl.create(:admin) }


  it "should not show the upload form for a regular user" do
		log_in
		visit "/admin"
		#current_path.should == "/users/login"
		# page.should have_content "You are already signed in." 
		click_link "League info"
		click_link "Salary progressions"
		# page.should_not have_content "Import salary progressions" 

	end

	it "should show the upload form for an admin" do
		log_in
		click_link "League info"
		click_link "Salary progressions"
		page.should have_content "Import salary progressions"
	end

	it "should upload progression chart" do 
		log_in
		click_link "League info"
		click_link "Salary progressions"
		page.attach_file('file','spec/fixtures/files/dopr_salary_chart.csv')
		click_button "Import"
		page.should have_content "Salary chart imported."
		page.should have_content "328"
	end


end