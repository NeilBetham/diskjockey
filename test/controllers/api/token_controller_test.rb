require 'test_helper'

class Api::TokenControllerTest < ActionController::TestCase
  test "should get get" do
    get :get
    assert_response :success
  end

  test "should get destroy" do
    get :destroy
    assert_response :success
  end

end
