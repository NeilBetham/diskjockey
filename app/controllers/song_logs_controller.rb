class SongLogsController < ApplicationController
  before_action :set_song_log, only: [:show, :edit, :update, :destroy]

  # GET /song_logs
  # GET /song_logs.json
  def index
    @song_logs = SongLog.all
  end

  # GET /song_logs/1
  # GET /song_logs/1.json
  def show
  end

  # GET /song_logs/new
  def new
    @song_log = SongLog.new
  end

  # GET /song_logs/1/edit
  def edit
  end

  # POST /song_logs
  # POST /song_logs.json
  def create
    @song_log = SongLog.new(song_log_params)

    respond_to do |format|
      if @song_log.save
        format.html { redirect_to @song_log, notice: 'Song log was successfully created.' }
        format.json { render :show, status: :created, location: @song_log }
      else
        format.html { render :new }
        format.json { render json: @song_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /song_logs/1
  # PATCH/PUT /song_logs/1.json
  def update
    respond_to do |format|
      if @song_log.update(song_log_params)
        format.html { redirect_to @song_log, notice: 'Song log was successfully updated.' }
        format.json { render :show, status: :ok, location: @song_log }
      else
        format.html { render :edit }
        format.json { render json: @song_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /song_logs/1
  # DELETE /song_logs/1.json
  def destroy
    @song_log.destroy
    respond_to do |format|
      format.html { redirect_to song_logs_url, notice: 'Song log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song_log
      @song_log = SongLog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def song_log_params
      params.require(:song_log).permit(:cd_number, :song_name, :artist, :genre, :album, :score, :location, :user_id)
    end
end
