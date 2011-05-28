require 'test_helper'

class RefDataTablesControllerTest < ActionController::TestCase
  setup do
    @ref_data_table = ref_data_tables(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ref_data_tables)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ref_data_table" do
    assert_difference('RefDataTable.count') do
      post :create, :ref_data_table => @ref_data_table.attributes
    end

    assert_redirected_to ref_data_table_path(assigns(:ref_data_table))
  end

  test "should show ref_data_table" do
    get :show, :id => @ref_data_table.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @ref_data_table.to_param
    assert_response :success
  end

  test "should update ref_data_table" do
    put :update, :id => @ref_data_table.to_param, :ref_data_table => @ref_data_table.attributes
    assert_redirected_to ref_data_table_path(assigns(:ref_data_table))
  end

  test "should destroy ref_data_table" do
    assert_difference('RefDataTable.count', -1) do
      delete :destroy, :id => @ref_data_table.to_param
    end

    assert_redirected_to ref_data_tables_path
  end
end
