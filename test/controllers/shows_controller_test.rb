require 'test_helper'

class ShowsControllerTest < ActionController::TestCase
  setup do
    @show = shows(:one)
    login_as(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shows)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create show" do
    assert_difference('Show.count') do
      post :create, show: { day_of_week: @show.day_of_week, name: @show.name, start_time: @show.start_time, stop_time: @show.stop_time, user_id: @show.user_id }
    end

    assert_redirected_to show_path(assigns(:show))
  end

  test "should show show" do
    get :show, id: @show
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @show
    assert_response :success
  end

  test "should update show" do
    patch :update, id: @show, show: { day_of_week: @show.day_of_week, name: @show.name, start_time: @show.start_time, stop_time: @show.stop_time, user_id: @show.user_id }
    assert_redirected_to show_path(assigns(:show))
  end

  test "should destroy show" do
    assert_difference('Show.count', -1) do
      delete :destroy, id: @show
    end

    assert_redirected_to shows_path
  end
end
