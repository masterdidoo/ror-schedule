require 'test_helper'

class RoutingListTest < ActiveSupport::TestCase
  test "routing list" do
    assert_equal 1, RoutingList.count

    list = RoutingList.find routing_lists(:one).id
    assert_not_nil list
    assert_equal 5, list.routing_steps.count
  end
end
