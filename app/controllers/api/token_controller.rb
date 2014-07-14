class Api::TokenController < Api::ApiController
  skip_before_action :authenticate, only: [:get]

  def get
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render json: user.tokens.create(valid_till: eval(CONFIG[:token_expire_time]))
    else
      head :unauthorized
    end
  end

  def destroy
    current_user.tokens.destroy_all
    head :no_content
  end
end
