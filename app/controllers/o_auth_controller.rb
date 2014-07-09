class OAuthController < ApplicationController
  def authorize
    #TODO Redirect user to google o auth url
  end

  def callback
    #TODO Store recevied token and authorize user to use app
  end
end
