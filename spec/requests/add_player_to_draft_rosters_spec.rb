require 'spec_helper'

describe "AddPlayerToDraftRosters" do
	it "should have a user with a team" do
		user = Factory(:user)
		team = Factory(:team)
		dr = Factory(:draft_roster)
	end
end
