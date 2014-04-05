require 'spec_helper'

describe "RosterSpots" do
  describe "GET /roster_spots" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get roster_spots_path
      response.status.should be(200)
    end
  end
end
