require 'test_helper'

class DriversServiceTest < ActiveSupport::TestCase
  test "test drivers service get_driver_schedule" do
    assert_equal 1, DriversService.get_driver_schedule(Date.new(2015,10,10), RoutingList.delivery_shifts[:morning])
    assert_equal 0, DriversService.get_driver_schedule(Date.new(2015,10,10), RoutingList.delivery_shifts[:afternoon])
    assert_equal 1, DriversService.get_driver_schedule(Date.new(2015,10,10), RoutingList.delivery_shifts[:evening])

    assert_equal 0, DriversService.get_driver_schedule(Date.new(2015,10,11), RoutingList.delivery_shifts[:morning])
    assert_equal 1, DriversService.get_driver_schedule(Date.new(2015,10,11), RoutingList.delivery_shifts[:afternoon])
    assert_equal 0, DriversService.get_driver_schedule(Date.new(2015,10,11), RoutingList.delivery_shifts[:evening])
  end

  test "test drivers service get_available" do
    available = DriversService.get_available(Date.new(2015,10,10), :morning)
    assert_equal 1, available.count
    assert_equal drivers(:two), available.first

    assert_empty DriversService.get_available(Date.new(2015,10,10), :afternoon)

    available = DriversService.get_available(Date.new(2015,10,10), :evening)
    assert_equal 1, available.count
    assert_equal drivers(:two), available.first


    available = DriversService.get_available(Date.new(2015,10,11), :morning)
    assert_equal 1, available.count
    assert_equal drivers(:one), available.first

    available = DriversService.get_available(Date.new(2015,10,11), :afternoon)
    assert_equal 1, available.count
    assert_equal drivers(:two), available.first

    available = DriversService.get_available(Date.new(2015,10,11), :evening)
    assert_equal 1, available.count
    assert_equal drivers(:one), available.first
  end

end