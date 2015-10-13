require 'test_helper'

class RoutingListsControllerTest < ActionController::TestCase
  setup do
    @routing_list = routing_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:routing_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create routing_list" do
    assert_difference('RoutingList.count') do
      post :create, routing_list: { delivery_date: '2015-10-10', delivery_shift: :evening }
    end

    assert_redirected_to routing_list_path(assigns(:routing_list))
  end

  test "should show routing_list" do
    get :show, id: @routing_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @routing_list
    assert_response :success
  end

  test "should update routing_list" do
    patch :update, id: @routing_list, routing_list: { delivery_date: @routing_list.delivery_date, delivery_shift: @routing_list.delivery_shift, driver_id: @routing_list.driver_id, first_step_id: @routing_list.first_step_id }
    assert_redirected_to routing_list_path(assigns(:routing_list))
  end

  test "should destroy routing_list" do
    assert_difference('RoutingList.count', -1) do
      delete :destroy, id: @routing_list
    end

    assert_redirected_to routing_lists_path
  end
end
