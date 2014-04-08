class RosterSpotsController < ApplicationController
  # GET /roster_spots
  # GET /roster_spots.json
  def index
    @roster_spots = RosterSpot.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @roster_spots }
    end
  end

  # GET /roster_spots/1
  # GET /roster_spots/1.json
  def show
    @roster_spot = RosterSpot.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @roster_spot }
    end
  end

  # GET /roster_spots/new
  # GET /roster_spots/new.json
  def new
    @roster_spot = RosterSpot.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @roster_spot }
    end
  end

  # GET /roster_spots/1/edit
  def edit
    @roster_spot = RosterSpot.find(params[:id])
  end

  # POST /roster_spots
  # POST /roster_spots.json
  def create
    player = Player.find(params[:player_id])
    @draft_roster = DraftRoster.find(params[:draft_roster_id])
    @roster_spot = @draft_roster.roster_spots.build
    @roster_spot.player = player
    @roster_spot.draft_roster = @draft_roster

    respond_to do |format|
      if @roster_spot.save
        format.html { redirect_to players_path, notice: 'Roster spot was successfully created.' }
        format.json { render json: @roster_spot, status: :created, location: @roster_spot }
      else
        format.html { render action: "new" }
        format.json { render json: @roster_spot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /roster_spots/1
  # PUT /roster_spots/1.json
  def update
    @roster_spot = RosterSpot.find(params[:id])

    respond_to do |format|
      if @roster_spot.update_attributes(params[:roster_spot])
        format.html { redirect_to @roster_spot, notice: 'Roster spot was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @roster_spot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roster_spots/1
  # DELETE /roster_spots/1.json
  def destroy
    @roster_spot = RosterSpot.find(params[:id])
    @draft_roster = @roster_spot.draft_roster
    @team = @draft_roster.team
    @roster_spot.destroy

    respond_to do |format|
      format.html { redirect_to team_draft_roster_path(@team, @draft_roster) }
      format.json { head :no_content }
    end
  end

  def sort
    params[:roster_spot].each_with_index do |id, index|
      RosterSpot.update_all({ position: index + 1 }, { id: id })
    end
    render nothing: true
  end
end
