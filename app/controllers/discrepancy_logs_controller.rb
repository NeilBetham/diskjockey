class DiscrepancyLogsController < ApplicationController
  before_action :set_discrepancy_log, only: [:show, :edit, :update, :destroy]

  # GET /discrepancy_logs
  # GET /discrepancy_logs.json
  def index
    @discrepancy_logs = DiscrepancyLog.all
  end

  # GET /discrepancy_logs/1
  # GET /discrepancy_logs/1.json
  def show
  end

  # GET /discrepancy_logs/new
  def new
    @discrepancy_log = DiscrepancyLog.new
  end

  # GET /discrepancy_logs/1/edit
  def edit
  end

  # POST /discrepancy_logs
  # POST /discrepancy_logs.json
  def create
    @discrepancy_log = DiscrepancyLog.new(discrepancy_log_params)

    respond_to do |format|
      if @discrepancy_log.save
        format.html { redirect_to @discrepancy_log, notice: 'Discrepancy log was successfully created.' }
        format.json { render :show, status: :created, location: @discrepancy_log }
      else
        format.html { render :new }
        format.json { render json: @discrepancy_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /discrepancy_logs/1
  # PATCH/PUT /discrepancy_logs/1.json
  def update
    respond_to do |format|
      if @discrepancy_log.update(discrepancy_log_params)
        format.html { redirect_to @discrepancy_log, notice: 'Discrepancy log was successfully updated.' }
        format.json { render :show, status: :ok, location: @discrepancy_log }
      else
        format.html { render :edit }
        format.json { render json: @discrepancy_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /discrepancy_logs/1
  # DELETE /discrepancy_logs/1.json
  def destroy
    @discrepancy_log.destroy
    respond_to do |format|
      format.html { redirect_to discrepancy_logs_url, notice: 'Discrepancy log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discrepancy_log
      @discrepancy_log = DiscrepancyLog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def discrepancy_log_params
      params.require(:discrepancy_log).permit(:user_id, :song_name, :artist, :word, :cd_number, :button_pressed)
    end
end
