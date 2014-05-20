class SuperBowlsController < ApplicationController
  load_and_authorize_resource
  
  # GET /super_bowls
  # GET /super_bowls.json
  def index
    @super_bowls = SuperBowl.order("year desc")
    @current_sb = SuperBowl.current_super_bowl
    
    unless @current_sb.nil?
      @picks = @current_sb.super_bowl_picks

      if @current_sb.tie_breaker?
        @tied_teams = @current_sb.tied_teams
      end

      if current_user
        unless @picks.empty?
          @my_pick = @current_sb.find_my_pick(@current_sb, current_user.team.id)

          if @my_pick
            @current_user_submitted = true
          else
            @current_user_submitted = false
          end
        end
      end
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @super_bowls }
    end
  end

  # GET /super_bowls/1
  # GET /super_bowls/1.json
  def show
    @super_bowl = SuperBowl.find(params[:id])
    @current_sb = SuperBowl.current_super_bowl
    @picks = @super_bowl.super_bowl_picks

    if @super_bowl.tie_breaker?
      @tied_teams = @super_bowl.tied_teams
    end

    if @super_bowl == @current_sb
      @this_is_current = true 
    else 
      @this_is_current = false
    end

    if current_user
      unless @picks.empty?
        @my_pick = @super_bowl.find_my_pick(@super_bowl, current_user.team.id)

        if @my_pick
          @current_user_submitted = true
        else
          @current_user_submitted = false
        end
      end
    end
    
    # @picks.each do |p|
      # if p.team_id == current_user.team.id
        # @current_user_submitted = true
        # @your_pick = p
      # else
        # @current_user_submitted = false
      # end
    # end
    
    

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @super_bowl }
    end
  end

  # GET /super_bowls/new
  # GET /super_bowls/new.json
  def new
    @super_bowl = SuperBowl.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @super_bowl }
    end
  end

  # GET /super_bowls/1/edit
  def edit
    @super_bowl = SuperBowl.find(params[:id])
  end

  # POST /super_bowls
  # POST /super_bowls.json
  def create
    @super_bowl = SuperBowl.new(params[:super_bowl])

    respond_to do |format|
      if @super_bowl.save
        format.html { redirect_to @super_bowl, notice: 'Super bowl was successfully created.' }
        format.json { render json: @super_bowl, status: :created, location: @super_bowl }
      else
        format.html { render action: "new" }
        format.json { render json: @super_bowl.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /super_bowls/1
  # PUT /super_bowls/1.json
  def update
    @super_bowl = SuperBowl.find(params[:id])

    respond_to do |format|
      if @super_bowl.update_attributes(params[:super_bowl])
        format.html { redirect_to @super_bowl, notice: 'Super bowl was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @super_bowl.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /super_bowls/1
  # DELETE /super_bowls/1.json
  def destroy
    @super_bowl = SuperBowl.find(params[:id])
    @super_bowl.destroy

    respond_to do |format|
      format.html { redirect_to super_bowls_url }
      format.json { head :no_content }
    end
  end
end
