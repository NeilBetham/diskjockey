require 'test_helper'

class DjSchedulesControllerTest < ActionController::TestCase
  setup do
    @dj_schedule = dj_schedules(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dj_schedules)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dj_schedule" do
    assert_difference('DjSchedule.count') do
      post :create, dj_schedule: { start_date: @dj_schedule.start_date, stop_date: @dj_schedule.stop_date }
    end

    assert_redirected_to dj_schedule_path(assigns(:dj_schedule))
  end

  test "should show dj_schedule" do
    get :show, id: @dj_schedule
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dj_schedule
    assert_response :success
  end

  test "should update dj_schedule" do
    patch :update, id: @dj_schedule, dj_schedule: { start_date: @dj_schedule.start_date, stop_date: @dj_schedule.stop_date }
    assert_redirected_to dj_schedule_path(assigns(:dj_schedule))
  end

  test "should destroy dj_schedule" do
    assert_difference('DjSchedule.count', -1) do
      delete :destroy, id: @dj_schedule
    end

    assert_redirected_to dj_schedules_path
  end
end
