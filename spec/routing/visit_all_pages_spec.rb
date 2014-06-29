require 'spec_helper'

describe "visiting every page" do
	let(:admin) { FactoryGirl.create(:admin) }

	it "can access all pages" do
    log_in admin
  end
end