class SessionsController < ApplicationController
  def new
    # @projects = Feature.for_projects
  end

  def create
    # @projects = Feature.for_projects
      
    user = login(params[:email], params[:password], params[:remember_me])
    if user
      redirect_back_or_to root_url, :notice => "Logged in!"
    else
      # flash.now.alert = "Email or password was invalid."
      redirect_back_or_to root_url, :notice => "Email or password was invalid."
    end
  end
  
  def destroy
    logout
    redirect_to root_url, :notice => "Logged out!"
  end
end
