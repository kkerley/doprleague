require 'rack/test'

module Helpers
  def log_in(user)
  	visit '/users/login'
  	fill_in "Email", :with => user.email
  	fill_in "Password", :with => user.password
  	click_button "Sign in"
    # save_and_open_page
    # current_path.should == "/"
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

  def import_nfl_teams
    visit "/nfl_teams"
    @file = Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/files/dopr_NFL_teams.csv'), 'text/csv') 
    page.attach_file('file', @file)
    click_button "Import"
    # save_and_open_page
    page.should have_content "NFL teams imported."
    # save_and_open_page
  end
end