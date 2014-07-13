class SubListsController < ApplicationController
  before_action :set_sub_list, only: [:show, :edit, :update, :destroy]

  # GET /sub_lists
  # GET /sub_lists.json
  def index
    @sub_lists = SubList.all
  end

  # GET /sub_lists/1
  # GET /sub_lists/1.json
  def show
  end

  # GET /sub_lists/new
  def new
    @sub_list = SubList.new
  end

  # GET /sub_lists/1/edit
  def edit
  end

  # POST /sub_lists
  # POST /sub_lists.json
  def create
    @sub_list = SubList.new(sub_list_params)

    respond_to do |format|
      if @sub_list.save
        format.html { redirect_to @sub_list, notice: 'Sub list was successfully created.' }
        format.json { render :show, status: :created, location: @sub_list }
      else
        format.html { render :new }
        format.json { render json: @sub_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sub_lists/1
  # PATCH/PUT /sub_lists/1.json
  def update
    respond_to do |format|
      if @sub_list.update(sub_list_params)
        format.html { redirect_to @sub_list, notice: 'Sub list was successfully updated.' }
        format.json { render :show, status: :ok, location: @sub_list }
      else
        format.html { render :edit }
        format.json { render json: @sub_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sub_lists/1
  # DELETE /sub_lists/1.json
  def destroy
    @sub_list.destroy
    respond_to do |format|
      format.html { redirect_to sub_lists_url, notice: 'Sub list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub_list
      @sub_list = SubList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sub_list_params
      params.require(:sub_list).permit(:name, :description)
    end
end
