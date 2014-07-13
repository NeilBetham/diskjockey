class Api::ApiController < ApplicationController
  protect_from_forgery with: :null_session
  respond_to :json
  before_action :authorize

  private
    def authorize
      authorize_token || unauthorized
    end

    def authorize_token
      authenticate_with_http_token do |token, options|
        @token = Token.find_by(token: token)
        @token && @token.valid_till > Time.now
      end
    end

    def unauthorized
      render json: {:errors => ["Bad credentials"] }, status: 401
    end

    def current_user
      @current_user ||= @token.user if @token
    end

end
