class NflTeamsController < ApplicationController
  load_and_authorize_resource :only => [:create, :edit, :update, :destroy, :new]
  # GET /nfl_teams
  # GET /nfl_teams.json
  def index
    # @nfl_teams = NflTeam.all
    @afc = NflTeam.afc
    @nfc = NflTeam.nfc
    @all_teams = NflTeam.order(:city)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @nfl_teams }
      format.csv { send_data @all_teams.to_csv }
    end
  end

  # GET /nfl_teams/1
  # GET /nfl_teams/1.json
  def show
    @nfl_team = NflTeam.find(params[:id])
    @team_players = Player.where("nfl_team = ?", @nfl_team.shorthand)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @nfl_team }
    end
  end

  # GET /nfl_teams/new
  # GET /nfl_teams/new.json
  def new
    @nfl_team = NflTeam.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @nfl_team }
    end
  end

  # GET /nfl_teams/1/edit
  def edit
    @nfl_team = NflTeam.find(params[:id])
  end

  # POST /nfl_teams
  # POST /nfl_teams.json
  def create
    @nfl_team = NflTeam.new(params[:nfl_team])

    respond_to do |format|
      if @nfl_team.save
        format.html { redirect_to @nfl_team, notice: 'Nfl team was successfully created.' }
        format.json { render json: @nfl_team, status: :created, location: @nfl_team }
      else
        format.html { render action: "new" }
        format.json { render json: @nfl_team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /nfl_teams/1
  # PUT /nfl_teams/1.json
  def update
    @nfl_team = NflTeam.find(params[:id])

    respond_to do |format|
      if @nfl_team.update_attributes(params[:nfl_team])
        @nfl_team.create_activity :update, owner: current_user
        format.html { redirect_to @nfl_team, notice: 'Nfl team was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @nfl_team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nfl_teams/1
  # DELETE /nfl_teams/1.json
  def destroy
    @nfl_team = NflTeam.find(params[:id])
    @nfl_team.destroy

    respond_to do |format|
      format.html { redirect_to nfl_teams_url }
      format.json { head :no_content }
    end
  end

  def import
    if params[:file].present?
      NflTeam.import(params[:file])
      @nfl_team = NflTeam.first # necessary to create the public_activity entry
      @nfl_team.create_activity :import, owner: current_user
      redirect_to nfl_teams_url, notice: "NFL teams imported."
    else
      redirect_to nfl_teams_url, flash: { alert: "Select a file, please." }
    end
  end
end
