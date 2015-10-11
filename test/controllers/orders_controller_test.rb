require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  setup do
    @order = orders(:ord1)
  end

  test "should get index" do
    get :index
    assert_response :success
    orders = assigns(:orders)
    assert_not_nil orders
    assert_equal 1, orders.count
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post :create, order: { delivery_date: @order.delivery_date, delivery_shift: @order.delivery_shift, destination_point_id: @order.destination_point_id, handling_unit_quantity: @order.handling_unit_quantity, load_step_id: @order.load_step_id, number: @order.number, origin_point_id: @order.origin_point_id, unload_step_id: @order.unload_step_id, volume: @order.volume }
    end

    assert_redirected_to order_path(assigns(:order))
  end

  test "should show order" do
    get :show, id: @order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @order
    assert_response :success
  end

  test "should update order" do
    patch :update, id: @order, order: { delivery_date: @order.delivery_date, delivery_shift: @order.delivery_shift, destination_point_id: @order.destination_point_id, handling_unit_quantity: @order.handling_unit_quantity, load_step_id: @order.load_step_id, number: @order.number, origin_point_id: @order.origin_point_id, unload_step_id: @order.unload_step_id, volume: @order.volume }
    assert_redirected_to order_path(assigns(:order))
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete :destroy, id: @order
    end

    assert_redirected_to orders_path
  end
end
