require 'test_helper'

class SubListsControllerTest < ActionController::TestCase
  setup do
    @sub_list = sub_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sub_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sub_list" do
    assert_difference('SubList.count') do
      post :create, sub_list: { description: @sub_list.description, name: @sub_list.name }
    end

    assert_redirected_to sub_list_path(assigns(:sub_list))
  end

  test "should show sub_list" do
    get :show, id: @sub_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sub_list
    assert_response :success
  end

  test "should update sub_list" do
    patch :update, id: @sub_list, sub_list: { description: @sub_list.description, name: @sub_list.name }
    assert_redirected_to sub_list_path(assigns(:sub_list))
  end

  test "should destroy sub_list" do
    assert_difference('SubList.count', -1) do
      delete :destroy, id: @sub_list
    end

    assert_redirected_to sub_lists_path
  end
end
