class PlayersController < ApplicationController
  # require 'will_paginate/array'
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper
  # before_filter :require_login, :only => [:create, :edit, :update, :destroy, :new]
  load_and_authorize_resource :only => [:create, :edit, :update, :destroy, :new]
  
  before_filter :load_team


  # GET /players
  # GET /players.json
  def index
    
   @players = smart_listing_create  :players, 
                                    Player.active_players.text_search(params[:query]), 
                                    partial: "players/players_info_fields", 
                                    default_sort: {last_name: "asc"}, 
                                    page_sizes: [25, 50, 100, 500]
    
    # @players = Player.text_search(params[:query]).includes(:contracts).includes(:subcontracts).sort_by { |player| player.this_year_salary }.reverse
    @players_download = Player.active_players.order(:last_name)
    
    if current_user
      # gon.current_user_draft_rosters = DraftRoster.where("team_id = ?", current_user.team.id) unless @players.empty?
      @draft_rosters = current_user.team.draft_rosters
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @players }
      format.csv { send_data @players_download.to_csv }
      format.js
      format.xls
    end
  end

  # GET /players/1
  # GET /players/1.json
  def show
    @player = Player.find(params[:id])
    @contracts = @player.contracts.order("contract_start_year desc").includes(:subcontracts)
    @salary_progression = SalaryProgression.find_by_auction_value(@player.auction_value)

    if @player.is_contracted?
      @top_5_players_of_position = Player.where("position = ?", @player.position).sort_by { |player| player.auction_value }.reverse.first(5)
      @top_5_average = @player.average_salaries(@top_5_players_of_position)
      @next_step = @player.next_salary_step(@player.this_year_salary)
      @franchise_cost = @player.which_is_higher_franchise_cost(@top_5_average, @next_step)
    end


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @player }
    end
  end

  # GET /players/new
  # GET /players/new.json
  def new
    @player = Player.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @player }
    end
  end

  # GET /players/1/edit
  def edit
    @player = Player.find(params[:id])
    @player.contracts.build
       
  end

  # POST /players
  # POST /players.json
  def create
    @player = Player.new(params[:player])

    respond_to do |format|
      if @player.save
        @player.create_activity :create, owner: current_user
        format.html { redirect_to @player, notice: 'Player was successfully created.' }
        format.json { render json: @player, status: :created, location: @player }
      else
        format.html { render action: "new" }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /players/1
  # PUT /players/1.json
  def update
    @player = Player.find(params[:id])

    respond_to do |format|
      if @player.update_attributes(params[:player])
        @player.create_activity :update, owner: current_user
        format.html { redirect_to @player, notice: 'Player was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1
  # DELETE /players/1.json
  def destroy
    @player = Player.find(params[:id])
    @player.create_activity :destroy, owner: current_user
    @player.destroy

    respond_to do |format|
      format.html { redirect_to players_url }
      format.json { head :no_content }
    end
  end
  
  def import
    if params[:file].present?
      Player.import(params[:file])
      @player = Player.first # necessary to create the public_activity entry
      @player.create_activity :import, owner: current_user
      redirect_to players_url, notice: "Players imported."
    else
      redirect_to '/admin#players', flash: { alert: "Select a file, please." }
    end
  end

  def free_agents
    # @players = Player.text_search(params[:query]).free_agents.sort_by { |player| player.this_year_salary }.reverse # chain the text_search here
    
    @players = smart_listing_create  :players, 
                                    Player.active_players.text_search(params[:query]).free_agents,
                                    array: true, 
                                    partial: "players/players_info_fields", 
                                    #default_sort: {last_name: "asc"}, 
                                    #sort_attributes: [[ :last_name, "last_name" ], [:nfl_team, "nfl_team"], [:auction_value, "auction_value"]], 
                                    
                                    page_sizes: [25, 500]
    
    
    if current_user
      @draft_rosters = current_user.team.draft_rosters
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @players }
      format.js
      format.xls
    end
  end

  private
    def load_team
      @team = current_user.team if current_user
    end
end
