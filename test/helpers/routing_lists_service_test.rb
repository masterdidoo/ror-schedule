require 'test_helper'

class RoutingListsServiceTest < ActiveSupport::TestCase
  test "test routing lists service create" do
    routing_list = RoutingList.new(delivery_date: Date.new(2015,10,10), delivery_shift: :afternoon)
    result = RoutingListsService.create(routing_list)
    assert_equal false, result

    routing_list = RoutingList.new(delivery_date: Date.new(2015,10,11), delivery_shift: :evening)
    result = RoutingListsService.create(routing_list)
    assert_equal true, result
    assert_equal drivers(:one), routing_list.driver
    assert_equal 4, routing_list.routing_steps.count

    steps = routing_list.routing_steps
    step = steps[0]
    assert_equal DateTime.new(2015,10,11,18), step.delivery_time
    assert_equal 1, step.index
    assert_equal addresses(:a1).name, step.routing_address
    assert_equal 2, step.load_orders.count
    assert_empty step.unload_orders

    step1 = steps[1]
    assert_equal DateTime.new(2015,10,11,18,1), step1.delivery_time
    assert_equal 2, step1.index

    step2 = steps[2]
    assert_equal DateTime.new(2015,10,11,18,2), step2.delivery_time
    assert_equal 3, step2.index

    if addresses(:a3).name != step1.routing_address
      step1 = steps[2]
      step2 = steps[1]
    end
    assert_equal addresses(:a3).name, step1.routing_address
    assert_empty step1.load_orders
    assert_equal 1, step1.unload_orders.count

    assert_equal addresses(:a2).name, step2.routing_address
    assert_equal 1, step2.load_orders.count
    assert_equal 1, step2.unload_orders.count

    step = steps[3]
    assert_equal DateTime.new(2015,10,11,18,3), step.delivery_time
    assert_equal 4, step.index
    assert_equal addresses(:a1).name, step.routing_address
    assert_empty step.load_orders
    assert_equal 1, step.unload_orders.count

    # assert_equal true, routing_list.routing_steps.all?{|s| !s.routing_address.nil?}
    # assert_not_nil RoutingList.find(routing_list.id)
    # assert_equal 9, RoutingStep.count
    #
    # routing_list.delete
    # assert_equal 1, RoutingList.count
    # # p RoutingStep.all
    # assert_equal 5, RoutingStep.count
  end

end