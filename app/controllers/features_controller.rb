class FeaturesController < ApplicationController
load_and_authorize_resource :only => [:create, :edit, :update, :destroy, :new, :admin]

  # GET /features
  # GET /features.json
  def index
    @announcements = Feature.for_announcements.published.page params[:announcements]
    @activities = PublicActivity::Activity.order("created_at desc").page params[:activities]
    
    
    # @all_features = Feature.homepage_list

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @features }
      format.js
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

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @feature }
    end
  end

  # GET /features/1/edit
  def edit
    @feature = Feature.find(params[:id])
  end

  # POST /features
  # POST /features.json
  def create
    @feature = Feature.new(params[:feature])
    @feature.user = current_user

    respond_to do |format|
      if @feature.save
        if @feature.is_published
          @feature.create_activity :create, owner: current_user
        end
        format.html { redirect_to( "/admin", {notice: 'Feature was successfully created.'}) }
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
        if @feature.is_published
          @feature.create_activity :update, owner: current_user
        end 
        format.html { redirect_to("/admin", {notice: 'Feature was successfully updated.'}) }
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
    @feature.create_activity :destroy, owner: current_user
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
    @articles = Feature.for_faqs.published
    # @jumbotron = Feature.for_faqs.jumbotron
  end 
  
  def constitution
    @articles = Feature.for_constitution.published
  end
  
  def polls
    @articles = Feature.for_polls.published
  end

  def help
    @articles = Feature.for_help.published + Feature.for_admin_help.published
  end
  
end