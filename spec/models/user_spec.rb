require 'spec_helper' 

describe User do
 
  let(:user) { FactoryGirl.create(:user) }


  ###################################################
  # DRY'd up methods                                #
  ###################################################


  def log_in
  	visit '/users/login'
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_button "Sign in"
  end

  def visit_standard_urls
    # "League info" dropdown links
    visit "/"
    click_link "League info"
    click_link "Constitution"
    click_link "League info"
    click_link "Facebook polls"
    click_link "League info"
    click_link "Salary progressions"
    click_link "League info"
    click_link "Contracts"
    click_link "League info"
    click_link "Payouts & awards"
    click_link "League info"
    click_link "All-time standings"
    click_link "League info"
    click_link "FAQs"
    click_link "League info"
    click_link "Events"
    click_link "League info"
    click_link "Super Bowls"

    click_link "NFL players"
  end


  ###################################################
  # The tests                                       #
  ###################################################


  it "should have 50 budgets for his team" do
    log_in
    user.team.budgets.count.should == 50
  end
  
  it "displays the user's team page" do
  	log_in
  	click_link "Hilarious Team Name"
  end

  it "should be able to visit all non-protected pages when not logged in" do
    visit_standard_urls
  end

  it "should be able to visit all pages without an error when logged in" do
    log_in
    page.should have_content("#{user.display_name}")
    visit_standard_urls
    visit "/teams/#{user.team.to_param}/draft_rosters"

    # page.should have_content("Log out")
    click_link "Admin" 
    current_path.should == "/admin"
     
    page.should have_content "Administrative control" 
  end

end