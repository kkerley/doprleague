class TradesController < ApplicationController
  load_and_authorize_resource :only => [:create, :edit, :update, :destroy, :new]

  # GET /trades
  # GET /trades.json
  def index
    @trades = Trade.all
    @all_accepted_trades = Trade.accepted_trades

    @test = Trade.accepted_trades_stipulations(@all_accepted_trades)

    @stipulations_cap = Stipulation.cap_space.for_year(current_year)
    @stipulations_draft = Stipulation.draft_spots.for_year(current_year)
    @stipulations_players = Stipulation.player.for_year(current_year)
    @stipulations_other = Stipulation.other.for_year(current_year)
   

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @trades }
    end
  end

  # GET /trades/1
  # GET /trades/1.json
  def show
    @trade = Trade.find(params[:id])
    @stipulations = @trade.stipulations.order('trade_direction desc')
    @trader1 = Team.find(@trade.trader1_id)
    @trader2 = Team.find(@trade.trader2_id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @trade }
    end
  end

  # GET /trades/new
  # GET /trades/new.json
  def new
    @trade = Trade.new
    @trade.stipulations.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @trade }
    end
  end

  # GET /trades/1/edit
  def edit
    @trade = Trade.find(params[:id])
    @trader1 = Team.find(@trade.trader1_id)
    @trader2 = Team.find(@trade.trader2_id)
  end

  # POST /trades
  # POST /trades.json
  def create
    @trade = Trade.new(params[:trade])

    respond_to do |format|
      if @trade.save
        @recipient = Team.find(@trade.trader2_id).user
        @trade.create_activity :create, owner: current_user
        current_user.send_message(@recipient, "Hey, I sent you a trade proposal", "Trade proposal awaiting your approval")
        format.html { redirect_to @trade, notice: 'Trade was successfully created.' }
        format.json { render json: @trade, status: :created, location: @trade }
      else
        format.html { render action: "new" }
        format.json { render json: @trade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /trades/1
  # PUT /trades/1.json
  def update
    @trade = Trade.find(params[:id])

    respond_to do |format|
        if @trade.update_attributes(params[:trade])
          if @trade.is_accepted
            @trade.create_activity :update, owner: current_user
          end
          format.html { redirect_to @trade, notice: 'Trade was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @trade.errors, status: :unprocessable_entity }
        end
    end
  end

  # DELETE /trades/1
  # DELETE /trades/1.json
  def destroy
    @trade = Trade.find(params[:id])
    @trade.destroy

    respond_to do |format|
      format.html { redirect_to trades_url }
      format.json { head :no_content }
    end
  end
end
