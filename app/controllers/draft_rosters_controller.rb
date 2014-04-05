class DraftRostersController < ApplicationController

  load_and_authorize_resource
  before_filter :load_team

  # GET /draft_rosters
  # GET /draft_rosters.json
  def index
    @draft_rosters = @team.draft_rosters.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @draft_rosters }
    end
  end

  # GET /draft_rosters/1
  # GET /draft_rosters/1.json
  def show
    @draft_roster = DraftRoster.find(params[:id])
    @team = @draft_roster.team
    @players = @draft_roster.players.order("position")
    @roster_spots = @draft_roster.roster_spots.order("position")

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @draft_roster }
    end
  end

  # GET /draft_rosters/new
  # GET /draft_rosters/new.json
  def new
    @draft_roster = DraftRoster.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @draft_roster }
    end
  end

  # GET /draft_rosters/1/edit
  def edit
    @draft_roster = DraftRoster.find(params[:id])
  end

  # POST /draft_rosters
  # POST /draft_rosters.json
  def create
    @draft_roster = DraftRoster.new(params[:draft_roster])

    respond_to do |format|
      if @draft_roster.save
        format.html { redirect_to team_draft_roster_path(@team, @draft_roster), notice: 'Draft roster was successfully created.' }
        format.json { render json: @draft_roster, status: :created, location: @draft_roster }
      else
        format.html { render action: "new" }
        format.json { render json: @draft_roster.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /draft_rosters/1
  # PUT /draft_rosters/1.json
  def update
    @draft_roster = DraftRoster.find(params[:id])

    respond_to do |format|
      if @draft_roster.update_attributes(params[:draft_roster])
        format.html { redirect_to team_draft_roster_path(@team, @draft_roster), notice: 'Draft roster was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @draft_roster.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /draft_rosters/1
  # DELETE /draft_rosters/1.json
  def destroy
    @draft_roster = DraftRoster.find(params[:id])
    @draft_roster.destroy

    respond_to do |format|
      format.html { redirect_to team_draft_rosters_path(@team) }
      format.json { head :no_content }
    end
  end

  private
    def load_team
      @team = Team.find(params[:team_id])
    end
end
