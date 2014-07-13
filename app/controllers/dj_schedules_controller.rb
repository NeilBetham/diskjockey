class DjSchedulesController < ApplicationController
  before_action :set_dj_schedule, only: [:show, :edit, :update, :destroy]

  # GET /dj_schedules
  # GET /dj_schedules.json
  def index
    @dj_schedules = DjSchedule.all
  end

  # GET /dj_schedules/1
  # GET /dj_schedules/1.json
  def show
  end

  # GET /dj_schedules/new
  def new
    @dj_schedule = DjSchedule.new
  end

  # GET /dj_schedules/1/edit
  def edit
  end

  # POST /dj_schedules
  # POST /dj_schedules.json
  def create
    @dj_schedule = DjSchedule.new(dj_schedule_params)

    respond_to do |format|
      if @dj_schedule.save
        format.html { redirect_to @dj_schedule, notice: 'Dj schedule was successfully created.' }
        format.json { render :show, status: :created, location: @dj_schedule }
      else
        format.html { render :new }
        format.json { render json: @dj_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dj_schedules/1
  # PATCH/PUT /dj_schedules/1.json
  def update
    respond_to do |format|
      if @dj_schedule.update(dj_schedule_params)
        format.html { redirect_to @dj_schedule, notice: 'Dj schedule was successfully updated.' }
        format.json { render :show, status: :ok, location: @dj_schedule }
      else
        format.html { render :edit }
        format.json { render json: @dj_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dj_schedules/1
  # DELETE /dj_schedules/1.json
  def destroy
    @dj_schedule.destroy
    respond_to do |format|
      format.html { redirect_to dj_schedules_url, notice: 'Dj schedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dj_schedule
      @dj_schedule = DjSchedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dj_schedule_params
      params.require(:dj_schedule).permit(:start_date, :stop_date)
    end
end
