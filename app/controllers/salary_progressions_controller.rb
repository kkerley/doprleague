class SalaryProgressionsController < ApplicationController
  # before_filter :require_login, :only => [:create, :edit, :update, :destroy, :new]
  load_and_authorize_resource :only => [:create, :edit, :update, :destroy, :new]


  # GET /salary_progressions
  # GET /salary_progressions.json
  def index
    # @salary_progressions = SalaryProgression.all
    @salary_progressions = SalaryProgression.order(:auction_value) # necessary for to_csv to work properly for some reason

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @salary_progressions }
      format.csv { send_data @salary_progressions.to_csv }
    end
  end

  # GET /salary_progressions/1
  # GET /salary_progressions/1.json
  def show
    @salary_progression = SalaryProgression.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @salary_progression }
    end
  end

  # GET /salary_progressions/new
  # GET /salary_progressions/new.json
  def new
    @salary_progression = SalaryProgression.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @salary_progression }
    end
  end

  # GET /salary_progressions/1/edit
  def edit
    @salary_progression = SalaryProgression.find(params[:id])
  end

  # POST /salary_progressions
  # POST /salary_progressions.json
  def create
    @salary_progression = SalaryProgression.new(params[:salary_progression])

    respond_to do |format|
      if @salary_progression.save
        format.html { redirect_to @salary_progression, notice: 'Salary progression was successfully created.' }
        format.json { render json: @salary_progression, status: :created, location: @salary_progression }
      else
        format.html { render action: "new" }
        format.json { render json: @salary_progression.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /salary_progressions/1
  # PUT /salary_progressions/1.json
  def update
    @salary_progression = SalaryProgression.find(params[:id])

    respond_to do |format|
      if @salary_progression.update_attributes(params[:salary_progression])
        format.html { redirect_to @salary_progression, notice: 'Salary progression was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @salary_progression.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /salary_progressions/1
  # DELETE /salary_progressions/1.json
  def destroy
    @salary_progression = SalaryProgression.find(params[:id])
    @salary_progression.destroy

    respond_to do |format|
      format.html { redirect_to salary_progressions_url }
      format.json { head :no_content }
    end
  end
  
  def import
    SalaryProgression.import(params[:file])
    redirect_to salary_progressions_url, notice: "Salary chart imported."
  end
end
