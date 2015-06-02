class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate, only: [:new, :create]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    authorize! :index, User
  end

  # GET /users/1
  # GET /users/1.json
  def show
    authorize! :show, @user
  end

  # GET /users/new
  def new
    @user = User.new
    authorize! :new, User

    if !can? :manage, User
      render 'new', layout: 'login'
    end
  end

  # GET /users/1/edit
  def edit
    authorize! :edit, @user
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    authorize! :create, User

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    authorize! :update, @user

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    authorize! :destroy, @user

    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      if can? :manage, @user
        params.require(:user).permit(:name, :email, :phone, :phone_carrier, :relevant_experience, :role, :employment_status, :station_staff, :password, :password_confirmation)
      else
        params.require(:user).permit(:name, :email, :phone, :phone_carrier, :relevant_experience, :employment_status, :station_staff, :password, :password_confirmation)
      end
    end
end
