class UsersController < ApplicationController
  before_filter :require_login, :only => [:create, :edit, :update, :destroy, :new]
  
  def index
    # @users = User.all
    @current_members = User.current_members
    @past_members = User.past_members
  end
  
  def new
    @user = User.new
  end
  
  def edit
      @user = User.find(params[:id])
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
        format.html { redirect_to({ :controller => :features, :action => :admin }, {notice: 'User was successfully updated.'}) }
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
