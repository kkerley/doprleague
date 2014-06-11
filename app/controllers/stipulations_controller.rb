class StipulationsController < ApplicationController
  # GET /stipulations
  # GET /stipulations.json
  def index
    @stipulations = Stipulation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stipulations }
    end
  end

  # GET /stipulations/1
  # GET /stipulations/1.json
  def show
    @stipulation = Stipulation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @stipulation }
    end
  end

  # GET /stipulations/new
  # GET /stipulations/new.json
  def new
    @stipulation = Stipulation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @stipulation }
    end
  end

  # GET /stipulations/1/edit
  def edit
    @stipulation = Stipulation.find(params[:id])
  end

  # POST /stipulations
  # POST /stipulations.json
  def create
    @stipulation = Stipulation.new(params[:stipulation])

    respond_to do |format|
      if @stipulation.save
        format.html { redirect_to @stipulation, notice: 'Stipulation was successfully created.' }
        format.json { render json: @stipulation, status: :created, location: @stipulation }
      else
        format.html { render action: "new" }
        format.json { render json: @stipulation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /stipulations/1
  # PUT /stipulations/1.json
  def update
    @stipulation = Stipulation.find(params[:id])

    respond_to do |format|
      if @stipulation.update_attributes(params[:stipulation])
        format.html { redirect_to @stipulation, notice: 'Stipulation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @stipulation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stipulations/1
  # DELETE /stipulations/1.json
  def destroy
    @stipulation = Stipulation.find(params[:id])
    @stipulation.destroy

    respond_to do |format|
      format.html { redirect_to stipulations_url }
      format.json { head :no_content }
    end
  end
end
