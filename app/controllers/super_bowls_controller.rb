class SuperBowlsController < ApplicationController
  # GET /super_bowls
  # GET /super_bowls.json
  def index
    @super_bowls = SuperBowl.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @super_bowls }
    end
  end

  # GET /super_bowls/1
  # GET /super_bowls/1.json
  def show
    @super_bowl = SuperBowl.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @super_bowl }
    end
  end

  # GET /super_bowls/new
  # GET /super_bowls/new.json
  def new
    @super_bowl = SuperBowl.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @super_bowl }
    end
  end

  # GET /super_bowls/1/edit
  def edit
    @super_bowl = SuperBowl.find(params[:id])
  end

  # POST /super_bowls
  # POST /super_bowls.json
  def create
    @super_bowl = SuperBowl.new(params[:super_bowl])

    respond_to do |format|
      if @super_bowl.save
        format.html { redirect_to @super_bowl, notice: 'Super bowl was successfully created.' }
        format.json { render json: @super_bowl, status: :created, location: @super_bowl }
      else
        format.html { render action: "new" }
        format.json { render json: @super_bowl.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /super_bowls/1
  # PUT /super_bowls/1.json
  def update
    @super_bowl = SuperBowl.find(params[:id])

    respond_to do |format|
      if @super_bowl.update_attributes(params[:super_bowl])
        format.html { redirect_to @super_bowl, notice: 'Super bowl was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @super_bowl.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /super_bowls/1
  # DELETE /super_bowls/1.json
  def destroy
    @super_bowl = SuperBowl.find(params[:id])
    @super_bowl.destroy

    respond_to do |format|
      format.html { redirect_to super_bowls_url }
      format.json { head :no_content }
    end
  end
end
