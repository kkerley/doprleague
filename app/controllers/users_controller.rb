class UsersController < ApplicationController
  # before_filter :require_login, :only => [:create, :edit, :update, :destroy, :new]
  load_and_authorize_resource :only => [:create, :edit, :update, :destroy, :new]

  
  def index
    # @users = User.all
    # @current_members = User.current_members
    # @past_members = User.past_members

    # Nothing needed here due to helper methods for getting current and past members
    
    

    respond_to do |format|
      format.html
      format.json { render :json => @all_users_and_awards.as_json }
    end
  end
  
  def new
    @user = User.new
    @team = @user.build_team
  end
  
  def edit
    if current_user.id == @user.id || current_user.role == "admin"
      @user = User.find(params[:id])
    else
      redirect_to root_url, :alert => exception.message
    end
  end
  
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end
  
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        if current_user.role == "admin" 
          format.html { redirect_to({ :controller => :admin, :action => :index }, {notice: 'User was successfully updated.'}) }
        else
          format.html { redirect_to root_url, notice: 'User was successfully updated.' }
        end
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to({ :controller => :features, :action => :admin }, {notice: 'User was successfully deleted.'}) }
      format.json { head :no_content }
    end
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render :new
    end
  end 
  
end
