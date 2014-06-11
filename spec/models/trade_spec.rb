require 'spec_helper'

describe Trade do
	before(:each) do
		DatabaseCleaner.clean
	  @user1 = FactoryGirl.create(:user)
	  @user2 = FactoryGirl.create(:user)

  	
  end

  it "creates users with budgets" do
  	# @user1.team.budgets should_not be_nil
  	# @user2.team.budgets should_not be_nil
  	@user1.display_name should_not be_nil
  end

end
