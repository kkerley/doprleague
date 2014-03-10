require 'spec_helper' 

describe User do
 
  let(:user) { FactoryGirl.create(:user) }
 

  def log_in
  	visit '/login'
  	fill_in "email", :with => user.email
  	fill_in "password", :with => user.password
  	click_button "Log in"
  end


  
  it "displays the user's team page" do
  	log_in
    
  	click_link "Hilarious Team Name" 
  end

end