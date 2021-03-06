class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate
  before_action :authorize_mini_profiler

  # Not authorized so go to root
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end

  # Some ish went down... Logout and redirect to login
  rescue_from ActiveRecord::RecordNotFound do |exception|
    reset_session
    redirect_to login_url
  end

  private
    # Get current user
    def current_user
      @current_user ||= User.find(session[:user_id]) unless session[:user_id].nil?
    end
    helper_method :current_user

    # Check if session is authed
    def authenticate
      redirect_to login_url, danger: "Please Login" unless current_user
    end

    def current_ability
      @current_ability ||= Ability.new(current_user)
    end

    def authorize_mini_profiler
      if current_user && (can? :manage, :all)
        Rack::MiniProfiler.authorize_request
      end
    end
end
