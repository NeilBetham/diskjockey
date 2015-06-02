class DjApplicationsController < ApplicationController
  before_action :set_dj_application, only: [:show, :edit, :update, :destroy]

  # GET /dj_applications
  # GET /dj_applications.json
  def index
    @dj_applications = DjApplication.all
    authorize! :index, DjApplication
  end

  # GET /dj_applications/1
  # GET /dj_applications/1.json
  def show
    authorize! :show, @dj_application
  end

  # GET /dj_applications/new
  def new
    @dj_application = DjApplication.new
    authorize! :new, DjApplication
  end

  # GET /dj_applications/1/edit
  def edit
    authorize! :edit, @dj_application
  end

  # POST /dj_applications
  # POST /dj_applications.json
  def create
    @dj_application = DjApplication.new(dj_application_params)
    authorize! :create, DjApplication

    respond_to do |format|
      if @dj_application.save
        format.html { redirect_to @dj_application, notice: 'Dj application was successfully created.' }
        format.json { render :show, status: :created, location: @dj_application }
      else
        format.html { render :new }
        format.json { render json: @dj_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dj_applications/1
  # PATCH/PUT /dj_applications/1.json
  def update
    authorize! :update, @dj_application

    respond_to do |format|
      if @dj_application.update(dj_application_params)
        format.html { redirect_to @dj_application, notice: 'Dj application was successfully updated.' }
        format.json { render :show, status: :ok, location: @dj_application }
      else
        format.html { render :edit }
        format.json { render json: @dj_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dj_applications/1
  # DELETE /dj_applications/1.json
  def destroy
    authorize! :destroy, @dj_application

    @dj_application.destroy
    respond_to do |format|
      format.html { redirect_to dj_applications_url, notice: 'Dj application was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dj_application
      @dj_application = DjApplication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dj_application_params
      params.require(:dj_application).permit(:show_name, :bands_or_artists_played, :show_blurb, :training_time, :genre_array => [])
    end
end
