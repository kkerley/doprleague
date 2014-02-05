class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_members, :past_members, :current_philip_members, :current_russell_members

  # check_authorization

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to login_url, :alert => exception.message
  end
  
  private
  def not_authenticated
    redirect_to login_url, :alert => "Log in to view this page."
  end

  def current_members
  	User.current_members.includes(:team).includes(:awards)
  end

  def past_members
  	User.past_members.includes(:team).includes(:awards)
  end
  
  def current_philip_members
  	current_users = User.current_members.includes(:team).includes(:awards)
  	philip_teams = []

  	current_users.each do |user|
  	  if user.team.division == "Philip"
  	  	philip_teams << user
  	  end
  	end
  	philip_teams

    
  end

  def current_russell_members
  	current_users = User.current_members.includes(:team).includes(:awards)
  	russell_teams = []

  	current_users.each do |user|
  	  if user.team.division == "Russell"
  	  	russell_teams << user
  	  end
  	end
  	russell_teams
  end

end
