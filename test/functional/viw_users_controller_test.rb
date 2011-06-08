require 'test_helper'

class VwUsersControllerTest < ActionController::TestCase
  setup do
    @vw_user = vw_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vw_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vw_user" do
    assert_difference('VwUser.count') do
      post :create, :vw_user => @vw_user.attributes
    end

    assert_redirected_to vw_user_path(assigns(:vw_user))
  end

  test "should show vw_user" do
    get :show, :id => @vw_user.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @vw_user.to_param
    assert_response :success
  end

  test "should update vw_user" do
    put :update, :id => @vw_user.to_param, :vw_user => @vw_user.attributes
    assert_redirected_to vw_user_path(assigns(:vw_user))
  end

  test "should destroy vw_user" do
    assert_difference('VwUser.count', -1) do
      delete :destroy, :id => @vw_user.to_param
    end

    assert_redirected_to vw_users_path
  end
end
