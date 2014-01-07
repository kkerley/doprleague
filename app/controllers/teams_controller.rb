class TeamsController < ApplicationController
  before_filter :require_login, :only => [:create, :edit, :update, :destroy, :new]
  # GET /teams
  # GET /teams.json
  def index
    # @teams = Team.all
    
    redirect_to "/members"

   # respond_to do |format|
    #  format.html # index.html.erb
      # format.json { render json: @teams }
   # end
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
    @team = Team.find(params[:id])
    @players = @team.get_subcontract_players.uniq # original way of getting only relevant subcontract information onto the pages
    # @players = @team.players.uniq
    # @all_contracts = @team.contracts.current_year_or_later
    # @current_contracts = @all_contracts.subcontracts

    # @players = @current_contracts.players.uniq


##############################################
# Redo all team#show view logic to incorporate the fact I can call @team.players

##############################################

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @team }
    end
  end

  # GET /teams/new
  # GET /teams/new.json
  def new
    @team = Team.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @team }
    end
  end

  # GET /teams/1/edit
  def edit
    @team = Team.find(params[:id])
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(params[:team])

    respond_to do |format|
      if @team.save
        format.html { redirect_to @team, notice: 'Team was successfully created.' }
        format.json { render json: @team, status: :created, location: @team }
      else
        format.html { render action: "new" }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /teams/1
  # PUT /teams/1.json
  def update
    @team = Team.find(params[:id])

    respond_to do |format|
      if @team.update_attributes(params[:team])
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team = Team.find(params[:id])
    @team.destroy

    respond_to do |format|
      format.html { redirect_to teams_url }
      format.json { head :no_content }
    end
  end
end
