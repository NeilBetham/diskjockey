require 'test_helper'

class SongLogsControllerTest < ActionController::TestCase
  setup do
    @song_log = song_logs(:one)
    login_as(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:song_logs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create song_log" do
    login_as(:one)

    assert_difference('SongLog.count') do
      post :create, song_log: { album: @song_log.album, artist: @song_log.artist, cd_number: @song_log.cd_number, genre: @song_log.genre, location: @song_log.location, score: @song_log.score, song_name: @song_log.song_name, user_id: @song_log.user_id }
    end

    assert_redirected_to song_log_path(assigns(:song_log))
  end


  # TODO Setup fixtures too allow for checking of date time check code
  test "should not create song_log" do
    login_as(:two)

    assert_no_difference('SongLog.count') do
      post :create, song_log: { album: @song_log.album, artist: @song_log.artist, cd_number: @song_log.cd_number, genre: @song_log.genre, location: @song_log.location, score: @song_log.score, song_name: @song_log.song_name, user_id: @song_log.user_id }
    end

    assert_redirected_to root_path
  end

  test "should show song_log" do
    get :show, id: @song_log
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @song_log
    assert_response :success
  end

  test "should update song_log" do
    patch :update, id: @song_log, song_log: { album: @song_log.album, artist: @song_log.artist, cd_number: @song_log.cd_number, genre: @song_log.genre, location: @song_log.location, score: @song_log.score, song_name: @song_log.song_name, user_id: @song_log.user_id }
    assert_redirected_to song_log_path(assigns(:song_log))
  end

  test "should destroy song_log" do
    assert_difference('SongLog.count', -1) do
      delete :destroy, id: @song_log
    end

    assert_redirected_to song_logs_path
  end
end
