require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.create(:user) }
  

  it "should have 50 budgets for his team" do
    log_in
    user.team.budgets.count.should == 50
  end
  
  it "displays the user's team page" do
  	log_in
  	within('#li-user-first-name') do
      click_link user.first_name
    end
    # current_path should == "/teams/#{user.team.to_param}"
  end

  it "should be able to visit all non-protected pages when not logged in" do
    visit_standard_urls
  end

  it "should be able to visit all pages without an error when logged in" do
    log_in
  
    page.should have_content("#{user.display_name}")
    
    visit_standard_urls
    
    within('#li-user-first-name') do
      click_link user.first_name
    end
  
    page.should have_content "#{user.team.team_name} managed by #{user.display_name}"
    
   
    click_link "Admin" 
    current_path.should == "/admin"
    page.should have_content "Administrative control"
  end



end