class TeamsController < ApplicationController
  # before_filter :require_login, :only => [:create, :edit, :update, :destroy, :new]
  load_and_authorize_resource :only => [:create, :edit, :update, :destroy, :new]


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
    @players = @team.get_subcontract_players.uniq 
    @players_to_extend = @team.available_for_extension(@players)
    @players_to_franchise = @team.available_for_franchise(@players, @team)

    # Need to adjust this to only pull in players for the current year
    @qbs = @players.find_all { |player| player.position == "QB" if player.is_contracted? && player.this_year.team_id == @team.id }
    @rbs = @players.find_all { |player| player.position == "RB" if player.is_contracted? && player.this_year.team_id == @team.id }
    @wrs = @players.find_all { |player| player.position == "WR" if player.is_contracted? && player.this_year.team_id == @team.id }
    @tes = @players.find_all { |player| player.position == "TE" if player.is_contracted? && player.this_year.team_id == @team.id }
    @kickers = @players.find_all { |player| player.position == "K" if player.is_contracted? && player.this_year.team_id == @team.id }
    @defs = @players.find_all { |player| player.position == "DEF" if player.is_contracted? && player.this_year.team_id == @team.id }

    @total_payout_amount_to_date = Payout.all.count * 1200
    gon.all_users_and_awards = User.order(:id).includes(:awards)

    @total_cap_current_year = @team.calculate_yearly_salary(current_year)
    @total_cap_current_year_plus_1 = @team.calculate_yearly_salary(current_year.to_i + 1)
    @total_cap_current_year_plus_2 = @team.calculate_yearly_salary(current_year.to_i + 2)
    @total_cap_current_year_plus_3 = @team.calculate_yearly_salary(current_year.to_i + 3)
    @total_cap_current_year_plus_4 = @team.calculate_yearly_salary(current_year.to_i + 4)
    @total_cap_current_year_plus_5 = @team.calculate_yearly_salary(current_year.to_i + 5)

    @team_budget_current_year = @team.get_budget(current_year)
    @team_budget_current_year_plus_1 = @team.get_budget(current_year.to_i + 1)
    @team_budget_current_year_plus_2 = @team.get_budget(current_year.to_i + 2)
    @team_budget_current_year_plus_3 = @team.get_budget(current_year.to_i + 3)
    @team_budget_current_year_plus_4 = @team.get_budget(current_year.to_i + 4)
    @team_budget_current_year_plus_5 = @team.get_budget(current_year.to_i + 5)

    @team_remainder_current_year = @team.remainder(@total_cap_current_year, @team_budget_current_year.amount)
    @team_remainder_current_year_plus_1 = @team.remainder(@total_cap_current_year_plus_1, @team_budget_current_year_plus_1.amount)
    @team_remainder_current_year_plus_2 = @team.remainder(@total_cap_current_year_plus_2, @team_budget_current_year_plus_2.amount)
    @team_remainder_current_year_plus_3 = @team.remainder(@total_cap_current_year_plus_3, @team_budget_current_year_plus_3.amount)
    @team_remainder_current_year_plus_4 = @team.remainder(@total_cap_current_year_plus_4, @team_budget_current_year_plus_4.amount)
    @team_remainder_current_year_plus_5 = @team.remainder(@total_cap_current_year_plus_5, @team_budget_current_year_plus_5.amount)

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
