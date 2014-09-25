class ContractsController < ApplicationController
  
  load_and_authorize_resource :only => [:create, :edit, :update, :destroy, :new]

  # GET /contracts
  # GET /contracts.json
  def index
    # @contracts = Contract.all  
    @contracts = Contract.page params[:page]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contracts }
    end
  end

  # GET /contracts/1
  # GET /contracts/1.json
  def show
    @contract = Contract.find(params[:id])
  
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @contract }
    end
  end

  # GET /contracts/new
  # GET /contracts/new.json
  def new
    @contract = Contract.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @contract }
    end
  end

  # GET /contracts/1/edit
  def edit
    @contract = Contract.find(params[:id])
  end

  # POST /contracts
  # POST /contracts.json
  def create
    @contract = Contract.new(params[:contract])

    respond_to do |format|
      if @contract.save
        # @contract.create_activity :create, owner: current_user
        format.html { redirect_to @contract, notice: 'Contract was successfully created.' }
        format.json { render json: @contract, status: :created, location: @contract }
      else
        format.html { render action: "new" }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /contracts/1
  # PUT /contracts/1.json
  def update
    @contract = Contract.find(params[:id])

    respond_to do |format|
      if @contract.update_attributes(params[:contract])
        # @contract.create_activity :update, owner: current_user
        format.html { redirect_to @contract, notice: 'Contract was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contracts/1
  # DELETE /contracts/1.json
  def destroy
    @contract = Contract.find(params[:id])
    # @contract.create_activity :destroy, owner: current_user
    @contract.destroy

    respond_to do |format|
      format.html { redirect_to contracts_url }
      format.json { head :no_content }
    end
  end


  def buyouts
    # uses helper methods
    @contracts = Contract.buyouts.includes(:subcontracts).page params[:page]
  end

  def extensions
    # uses helper methods
    @contracts = Contract.where('is_extended = ?', true).where('is_franchised != ?', true).where('is_bought_out != ?', true).includes(:subcontracts).page params[:page]
  end

  def franchises
    # uses helper methods
    @contracts = Contract.where('is_franchised = ?', true).where('is_extended != ?', true).where('is_bought_out != ?', true).includes(:subcontracts).page params[:page]
  end

  def extended_and_franchised
    # uses helper methods
    @contracts = Contract.where('is_extended = ?', true).where('is_franchised = ?', true ).where('is_bought_out != ?', true).includes(:subcontracts).page params[:page]
  end

  def dead_money
    # uses helper methods
    @contracts = Contract.where('is_dead_money = ?', true).includes(:subcontracts).page params[:page]
  end


end
