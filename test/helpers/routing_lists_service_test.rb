require 'test_helper'

class RoutingListsServiceTest < ActiveSupport::TestCase
  test "test routing lists service create" do
    routing_list = RoutingList.new(delivery_date: Date.new(2015,10,10), delivery_shift: :morning)
    result = RoutingListsService.create(routing_list)
    assert_equal true, result
    assert_equal drivers(:two), routing_list.driver

    routing_list = RoutingList.new(delivery_date: Date.new(2015,10,10), delivery_shift: :afternoon)
    result = RoutingListsService.create(routing_list)
    assert_equal false, result

    routing_list = RoutingList.new(delivery_date: Date.new(2015,10,10), delivery_shift: :evening)
    result = RoutingListsService.create(routing_list)
    assert_equal true, result
    assert_equal drivers(:two), routing_list.driver

    routing_list = RoutingList.new(delivery_date: Date.new(2015,10,11), delivery_shift: :morning)
    result = RoutingListsService.create(routing_list)
    assert_equal true, result
    assert_equal drivers(:one), routing_list.driver

    routing_list = RoutingList.new(delivery_date: Date.new(2015,10,11), delivery_shift: :afternoon)
    result = RoutingListsService.create(routing_list)
    assert_equal true, result
    assert_equal drivers(:two), routing_list.driver

    routing_list = RoutingList.new(delivery_date: Date.new(2015,10,11), delivery_shift: :evening)
    result = RoutingListsService.create(routing_list)
    assert_equal true, result
    assert_equal drivers(:one), routing_list.driver
  end

end