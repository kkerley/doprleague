class SubcontractsController < ApplicationController
  # GET /subcontracts
  # GET /subcontracts.json
  def index
    @subcontracts = Subcontract.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @subcontracts }
    end
  end

  # GET /subcontracts/1
  # GET /subcontracts/1.json
  def show
    @subcontract = Subcontract.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @subcontract }
    end
  end

  # GET /subcontracts/new
  # GET /subcontracts/new.json
  def new
    @subcontract = Subcontract.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @subcontract }
    end
  end

  # GET /subcontracts/1/edit
  def edit
    @subcontract = Subcontract.find(params[:id])
  end

  # POST /subcontracts
  # POST /subcontracts.json
  def create
    @subcontract = Subcontract.new(params[:subcontract])

    respond_to do |format|
      if @subcontract.save
        format.html { redirect_to @subcontract, notice: 'Subcontract was successfully created.' }
        format.json { render json: @subcontract, status: :created, location: @subcontract }
      else
        format.html { render action: "new" }
        format.json { render json: @subcontract.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /subcontracts/1
  # PUT /subcontracts/1.json
  def update
    @subcontract = Subcontract.find(params[:id])

    respond_to do |format|
      if @subcontract.update_attributes(params[:subcontract])
        format.html { redirect_to @subcontract, notice: 'Subcontract was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @subcontract.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subcontracts/1
  # DELETE /subcontracts/1.json
  def destroy
    @subcontract = Subcontract.find(params[:id])
    @subcontract.destroy

    respond_to do |format|
      format.html { redirect_to subcontracts_url }
      format.json { head :no_content }
    end
  end
end
