require 'test_helper'

class Api::TokenControllerTest < ActionController::TestCase
  def setup
    @controller = Api::TokenController.new
  end

  test "should get get" do
    post :get, email: 'MyString2@mtu.edu', password: 'password'
    assert_response :success
  end

  # test "should get destroy" do
  #   login_token
  #   delete :destroy
  #   assert_response :success
  # end

end
