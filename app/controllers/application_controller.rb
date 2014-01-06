class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_members
  
  private
  def not_authenticated
    redirect_to login_url, :alert => "First log in to view this page."
  end
  
  def current_members
  	User.current_members
  end

end
