require 'spec_helper'
require "cancan/matchers" 

describe SalaryProgression do
	
	let(:user) { FactoryGirl.create(:user) }
	let(:admin) { FactoryGirl.create(:admin) }


	def log_in
  	visit '/users/login'
  	fill_in "Email", :with => user.email
  	fill_in "Password", :with => user.password
  	click_button "Sign in"
  end

  def admin_log_in
  	visit '/users/login'
  	fill_in "Email", :with => admin.email
  	fill_in "Password", :with => admin.password
  	click_button "Sign in"
  end

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
		#admin.role.should == "admin"
		# visit "/"
		page.should have_content("Log out")
		click_link "Admin" 
		current_path.should == "/admin"
		 
		page.should have_content "Administrative control" 
		# click_link "Admin" 
		#click_link "League info"
		#click_link "Salary progressions"
		#page.should have_content "Import salary progressions"
	end

	# it "should upload progression chart" do 

	# end
end