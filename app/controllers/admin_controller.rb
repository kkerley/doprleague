class AdminController < ApplicationController
  before_filter :verify_admin

  def index
  	@announcements = Feature.for_announcements
    @faqs = Feature.for_faqs
    @facebook_polls = Feature.for_polls
    @constitution_features = Feature.for_constitution
    @help_features = Feature.for_help + Feature.for_admin_help
    @super_bowls = SuperBowl.order("year desc")
    @users = User.all
    @standings = Standing.order(:year).includes(:team_records)
  end


  private

  def verify_admin
  	redirect_to root_url, alert: "You need to be an admin to access that page." unless current_user && current_user.is_admin?
  end
end
