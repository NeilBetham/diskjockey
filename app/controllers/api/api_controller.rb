class Api::ApiController < ApplicationController
  protect_from_forgery with: :null_session

  skip_before_action :verify_authenticity_token
  before_action :authenticate

  respond_to :json

  private
    def authenticate
      authenticate_token || unauthorized
    end

    def authenticate_token
      authenticate_with_http_token do |token, options|
        @token = Token.find_by(token: token)
        @token && @token.valid_till > Time.now
      end
    end

    def unauthorized
      render json: { errors: ['Bad credentials'] }, status: 401
    end

    def current_user
      @current_user ||= @token.user if @token
    end

end
