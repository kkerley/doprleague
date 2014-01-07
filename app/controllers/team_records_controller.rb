class TeamRecordsController < ApplicationController
  before_filter :require_login, :only => [:create, :edit, :update, :destroy, :new]
  # GET /team_records
  # GET /team_records.json
  def index
    @team_records = TeamRecord.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @team_records }
    end
  end

  # GET /team_records/1
  # GET /team_records/1.json
  def show
    @team_record = TeamRecord.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @team_record }
    end
  end

  # GET /team_records/new
  # GET /team_records/new.json
  def new
    @team_record = TeamRecord.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @team_record }
    end
  end

  # GET /team_records/1/edit
  def edit
    @team_record = TeamRecord.find(params[:id])
  end

  # POST /team_records
  # POST /team_records.json
  def create
    @team_record = TeamRecord.new(params[:team_record])

    respond_to do |format|
      if @team_record.save
        format.html { redirect_to @team_record, notice: 'Team record was successfully created.' }
        format.json { render json: @team_record, status: :created, location: @team_record }
      else
        format.html { render action: "new" }
        format.json { render json: @team_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /team_records/1
  # PUT /team_records/1.json
  def update
    @team_record = TeamRecord.find(params[:id])

    respond_to do |format|
      if @team_record.update_attributes(params[:team_record])
        format.html { redirect_to @team_record, notice: 'Team record was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @team_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /team_records/1
  # DELETE /team_records/1.json
  def destroy
    @team_record = TeamRecord.find(params[:id])
    @team_record.destroy

    respond_to do |format|
      format.html { redirect_to team_records_url }
      format.json { head :no_content }
    end
  end
end
