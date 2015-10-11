require 'test_helper'

class RoutingStepTest < ActiveSupport::TestCase
  test "routing step orders" do
    assert_equal 5, RoutingStep.count

    step = RoutingStep.find routing_steps(:rs1).id
    assert_equal 1, step.load_orders.count
    assert_equal 0, step.unload_orders.count
    test_same_points(step)

    step = RoutingStep.find routing_steps(:rs2).id
    assert_equal 2, step.load_orders.count
    assert_equal 1, step.unload_orders.count
    test_same_points(step)

    step = RoutingStep.find routing_steps(:rs3).id
    assert_equal 2, step.load_orders.count
    assert_equal 1, step.unload_orders.count
    test_same_points(step)

    step = RoutingStep.find routing_steps(:rs4).id
    assert_equal 0, step.load_orders.count
    assert_equal 1, step.unload_orders.count
    test_same_points(step)

    step = RoutingStep.find routing_steps(:rs5).id
    assert_equal 0, step.load_orders.count
    assert_equal 2, step.unload_orders.count
    test_same_points(step)
  end

  private
  def test_same_points(step)
    list = step.load_orders.map{|m| m.origin_point}.concat step.unload_orders.map{|m| m.destination_point}

    if (list.count > 1)
      assert_equal true, list.all? {|s| s == list.first}
    end
  end
end
