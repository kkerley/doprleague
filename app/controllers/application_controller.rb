class ApplicationController < ActionController::Base
  include PublicActivity::StoreController
  include ModifiedCurrentYear

  protect_from_forgery
  
  helper_method :current_members, 
                :past_members, 
                :current_philip_members, 
                :current_russell_members, 
                :current_user_inbox, 
                :current_user_pending_trades, 
                :current_user_team,
                :current_user_team_actions, 
                :current_user_team_budget,
                :current_user_team_cap_remainder, 
                :current_user_team_cap_spent, 
                :current_user_team_cap_spent_percentage, 
                :global_notification_count,
                :site_version

  # check_authorization

  before_filter :setup_beta

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to new_user_session_url, :alert => exception.message
  end

  def setup_beta
    if request.subdomain == "beta"
      prepend_view_path "app/views/beta"
      # other beta setup
    end
  end
  
  private

  def site_version
    '2.7.15'
  end

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

  # methods for the GM quick look
  def current_user_team
    current_user.team
  end

  def current_user_team_budget
    current_user_team.get_budget(current_year)
  end

  def current_user_team_cap_spent
    current_user_team.calculate_yearly_salary(current_year)
  end

  def current_user_team_cap_remainder
    current_user_team.remainder(current_user_team_cap_spent, current_user_team_budget.calculated_amount)
  end

  def current_user_team_cap_spent_percentage
    current_user_team.cap_spent_percentage(current_user_team_cap_spent.to_f, current_user_team_budget.calculated_amount.to_f)
  end

  def current_user_team_actions
    AnnualGmAction.find_by_team_id_and_year(current_user_team.id, current_year)
  end
end
