require 'test_helper'

class DashboardControllerTest < ActionController::TestCase
  setup do
    login_as(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
  end
end
