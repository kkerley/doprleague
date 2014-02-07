class PlayersController < ApplicationController
  # before_filter :require_login, :only => [:create, :edit, :update, :destroy, :new]
  load_and_authorize_resource :only => [:create, :edit, :update, :destroy, :new]


  # GET /players
  # GET /players.json
  def index
    # @players = Player.order(:last_name)
    @players = Player.text_search(params[:query]).includes(:subcontracts).sort_by { |player| player.this_year_salary }.reverse
    @players_download = Player.order(:last_name)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @players }
      format.csv { send_data @players_download.to_csv }
      format.xls
    end
  end

  # GET /players/1
  # GET /players/1.json
  def show
    @player = Player.find(params[:id])
    @contracts = @player.contracts.order("contract_start_year desc").includes(:subcontracts)

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
    @player.destroy

    respond_to do |format|
      format.html { redirect_to players_url }
      format.json { head :no_content }
    end
  end
  
  def import
    Player.import(params[:file])
    redirect_to players_url, notice: "Players imported."
  end

  def free_agents
    @players = Player.text_search(params[:query]).free_agents.sort_by { |player| player.this_year_salary }.reverse # chain the text_search here
  end
end
