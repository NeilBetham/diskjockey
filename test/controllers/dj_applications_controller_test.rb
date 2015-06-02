require 'test_helper'

class DjApplicationsControllerTest < ActionController::TestCase
  setup do
    @dj_application = dj_applications(:one)
    login_as(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dj_applications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dj_application" do
    assert_difference('DjApplication.count') do
      post :create, dj_application: { bands_or_artists_played: @dj_application.bands_or_artists_played, show_blurb: @dj_application.show_blurb, show_name: @dj_application.show_name, training_time: @dj_application.training_time }
    end

    assert_redirected_to dj_application_path(assigns(:dj_application))
  end

  test "should show dj_application" do
    get :show, id: @dj_application
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dj_application
    assert_response :success
  end

  test "should update dj_application" do
    patch :update, id: @dj_application, dj_application: { bands_or_artists_played: @dj_application.bands_or_artists_played, show_blurb: @dj_application.show_blurb, show_name: @dj_application.show_name, training_time: @dj_application.training_time }
    assert_redirected_to dj_application_path(assigns(:dj_application))
  end

  test "should destroy dj_application" do
    assert_difference('DjApplication.count', -1) do
      delete :destroy, id: @dj_application
    end

    assert_redirected_to dj_applications_path
  end
end
