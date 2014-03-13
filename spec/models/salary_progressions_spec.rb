require 'spec_helper'
require "cancan/matchers" 
require 'support/test_helper'

describe SalaryProgression do
	
	#let(:user) { FactoryGirl.create(:user) }
	#let(:admin) { FactoryGirl.create(:admin) }
	let!(:user) { Fabricate(:user) }

	before(:each) do
    login_user_post(user.email, user.password)
  end

	def log_in
  	visit '/login'
  	fill_in "email", :with => user.email
  	fill_in "password", :with => user.password
  	click_button "Log in"
  end

  def admin_log_in
  	visit '/login'
  	fill_in "email", :with => admin.email
  	fill_in "password", :with => admin.password
  	click_button "Log in"
  end

  it "should not show the upload form for a regular user" do
		log_in
		visit "/admin"
		current_path.should == "/login"
		click_link "League info"
		click_link "Salary progressions"
		page.should_not have_content "Import salary progressions" 

	end

	it "should show the upload form for an admin" do
		log_in
		
		# visit "/"
		# page.should have_content("Log out")
		visit "/admin"
		# current_path.should == "/login"
		 
		page.should have_content "Administrative control" 
		# click_link "Admin" 
		#click_link "League info"
		#click_link "Salary progressions"
		#page.should have_content "Import salary progressions"
	end

	# it "should upload progression chart" do 

	# end 
end