class FeaturesController < ApplicationController
before_filter :require_login, :only => [:create, :edit, :update, :destroy, :new, :admin]

  # GET /features
  # GET /features.json
  def index
    @announcements = Feature.announcements_list.others.published
    @jumbotron = Feature.announcements_list.jumbotron
    @users = User.current_members
    
    # @all_features = Feature.homepage_list

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @features }
    end
  end

  # GET /features/1
  # GET /features/1.json
  def show
    @feature = Feature.find(params[:id])
    # @homepage_features = Feature.homepage_list.published


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @feature }
    end
  end

  # GET /features/new
  # GET /features/new.json
  def new
    @feature = Feature.new
    #@homepage_features = Feature.homepage_list.published

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @feature }
    end
  end

  # GET /features/1/edit
  def edit
    @feature = Feature.find(params[:id])
    # @homepage_features = Feature.homepage_list.published
  end

  # POST /features
  # POST /features.json
  def create
    @feature = Feature.new(params[:feature])
    @feature.user = current_user

    respond_to do |format|
      if @feature.save
        format.html { redirect_to({:action => :admin}, {notice: 'Feature was successfully created.'}) }
        format.json { render json: @feature, status: :created, location: @feature }
      else
        format.html { render action: "new" }
        format.json { render json: @feature.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /features/1
  # PUT /features/1.json
  def update
    @feature = Feature.find(params[:id])

    respond_to do |format|
      if @feature.update_attributes(params[:feature])
        format.html { redirect_to({:action => :admin }, {notice: 'Feature was successfully updated.'}) }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @feature.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /features/1
  # DELETE /features/1.json
  def destroy
    @feature = Feature.find(params[:id])
    @feature.destroy

    respond_to do |format|
      format.html { redirect_to({:action => :index}) }
      format.json { head :no_content }
    end
  end
  
  # def projects
    # @projects = Feature.for_projects.published
    # @jumbotron = @projects.jumbotron
    # @actual_projects = @projects.others
  # end 

  def faqs
    @faqs = Feature.faqs_list.others.published
    @jumbotron = Feature.for_faqs.jumbotron
  end 
  
  def constitution
    @constitution_features = Feature.for_constitution.others.published
  end
  
  def polls
    @polls_features = Feature.for_polls.others.published
  end
  
  def admin
    @announcements = Feature.for_announcements
    @faqs = Feature.for_faqs
    @facebook_polls = Feature.polls_list
    @constitution_features = Feature.for_constitution
    @users = User.all
  end
  
end