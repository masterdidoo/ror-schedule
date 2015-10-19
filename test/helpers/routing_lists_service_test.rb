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
    assert_equal DateTime.new(2015,10,11,18), steps[0].delivery_time
    assert_equal 1, steps[0].index
    assert_equal DateTime.new(2015,10,11,18,1), steps[1].delivery_time
    assert_equal 2, steps[1].index
    assert_equal DateTime.new(2015,10,11,18,2), steps[2].delivery_time
    assert_equal 3, steps[2].index
    assert_equal DateTime.new(2015,10,11,18,3), steps[3].delivery_time
    assert_equal 4, steps[3].index

    assert_equal true, routing_list.routing_steps.all?{|s| !s.routing_address.nil?}
    assert_not_nil RoutingList.find(routing_list.id)
    assert_equal 9, RoutingStep.count

    # routing_list.delete
    # assert_equal 1, RoutingList.count
    # p RoutingStep.all
    # assert_equal 5, RoutingStep.count
  end

end