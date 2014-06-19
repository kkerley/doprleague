class ApplicationController < ActionController::Base
  include PublicActivity::StoreController
  include ModifiedCurrentYear

  protect_from_forgery
  
  helper_method :current_members, :past_members, :current_philip_members, :current_russell_members, :current_user_inbox, :current_user_pending_trades, :global_notification_count

  # check_authorization

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to new_user_session_url, :alert => exception.message
  end
  
  private
  def not_authenticated
    redirect_to new_user_session_url, :alert => "Log in to view this page."
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

  def current_user_inbox
    current_user.mailbox.inbox.unread(current_user)
  end

  def current_user_pending_trades
    Trade.for_team(current_user.team.id).pending_trades
  end

  def global_notification_count
    current_user_inbox.count + current_user_pending_trades.count
  end
end
