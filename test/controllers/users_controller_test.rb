require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    login_as(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { name: 'MyName' email: 'test@mtu.edu', phone: '333-333-3333', phone_carrier: 'verizon', employment_status: 'student', role: @user.role, password: 'password', password_confirmation: 'password'}
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    patch :update, id: @user, user: { name: @user.name, email: @user.email, phone: @user.phone, phone_carrier: @user.phone_carrier, employment_status: @user.employment_status, role: @user.role, password: 'password', password_confirmation: 'password' }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
