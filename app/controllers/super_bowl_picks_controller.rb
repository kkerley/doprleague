class SuperBowlPicksController < ApplicationController
  load_and_authorize_resource
  
  # GET /super_bowl_picks
  # GET /super_bowl_picks.json
  def index
    @super_bowl_picks = SuperBowlPick.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @super_bowl_picks }
    end
  end

  # GET /super_bowl_picks/1
  # GET /super_bowl_picks/1.json
  def show
    @super_bowl_pick = SuperBowlPick.find(params[:id])
    @nfl_team = NflTeam.find(@super_bowl_pick.nfl_team_id)
    @team = Team.find(@super_bowl_pick.team_id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @super_bowl_pick }
    end
  end

  # GET /super_bowl_picks/new
  # GET /super_bowl_picks/new.json
  def new
    @super_bowl_pick = SuperBowlPick.new
    @super_bowl = SuperBowl.current_super_bowl

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @super_bowl_pick }
    end
  end

  # GET /super_bowl_picks/1/edit
  def edit
    @super_bowl_pick = SuperBowlPick.find(params[:id])
    @super_bowl = SuperBowl.current_super_bowl
  end

  # POST /super_bowl_picks
  # POST /super_bowl_picks.json
  def create
    @super_bowl_pick = SuperBowlPick.new(params[:super_bowl_pick])

    respond_to do |format|
      if @super_bowl_pick.save
        format.html { redirect_to @super_bowl_pick, notice: 'Super bowl pick was successfully created.' }
        format.json { render json: @super_bowl_pick, status: :created, location: @super_bowl_pick }
      else
        format.html { render action: "new" }
        format.json { render json: @super_bowl_pick.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /super_bowl_picks/1
  # PUT /super_bowl_picks/1.json
  def update
    @super_bowl_pick = SuperBowlPick.find(params[:id])

    respond_to do |format|
      if @super_bowl_pick.update_attributes(params[:super_bowl_pick])
        format.html { redirect_to @super_bowl_pick, notice: 'Super bowl pick was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @super_bowl_pick.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /super_bowl_picks/1
  # DELETE /super_bowl_picks/1.json
  def destroy
    @super_bowl_pick = SuperBowlPick.find(params[:id])
    @super_bowl_pick.destroy

    respond_to do |format|
      format.html { redirect_to super_bowl_picks_url }
      format.json { head :no_content }
    end
  end
end
