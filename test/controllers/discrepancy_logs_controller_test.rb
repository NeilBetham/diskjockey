require 'test_helper'

class DiscrepancyLogsControllerTest < ActionController::TestCase
  setup do
    @discrepancy_log = discrepancy_logs(:one)
    login_as(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:discrepancy_logs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create discrepancy_log" do
    assert_difference('DiscrepancyLog.count') do
      post :create, discrepancy_log: { artist: @discrepancy_log.artist, button_pressed: @discrepancy_log.button_pressed, cd_number: @discrepancy_log.cd_number, song_name: @discrepancy_log.song_name, user_id: @discrepancy_log.user_id, word: @discrepancy_log.word }
    end

    assert_redirected_to discrepancy_log_path(assigns(:discrepancy_log))
  end

  test "should show discrepancy_log" do
    get :show, id: @discrepancy_log
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @discrepancy_log
    assert_response :success
  end

  test "should update discrepancy_log" do
    patch :update, id: @discrepancy_log, discrepancy_log: { artist: @discrepancy_log.artist, button_pressed: @discrepancy_log.button_pressed, cd_number: @discrepancy_log.cd_number, song_name: @discrepancy_log.song_name, user_id: @discrepancy_log.user_id, word: @discrepancy_log.word }
    assert_redirected_to discrepancy_log_path(assigns(:discrepancy_log))
  end

  test "should destroy discrepancy_log" do
    assert_difference('DiscrepancyLog.count', -1) do
      delete :destroy, id: @discrepancy_log
    end

    assert_redirected_to discrepancy_logs_path
  end
end
