require 'test_helper'

class DriverTest < ActiveSupport::TestCase
  test "test two drivers" do
    driver = Driver.find drivers(:one).id
    assert_equal 0, driver.schedule
    assert_equal 'Driver 1', driver.name
    assert_equal 'Truck1', driver.truck.number
    assert_equal [:morning, :evening], driver.get_available_schedules(DateTime.new(2015,10,1))
    assert_equal [:afternoon], driver.get_available_schedules(DateTime.new(2015,10,2))

    driver = Driver.find drivers(:two).id
    assert_equal 1, driver.schedule
    assert_equal 'Driver 2', driver.name
    assert_equal 'Truck2', driver.truck.number
    assert_equal [:afternoon], driver.get_available_schedules(DateTime.new(2015,10,1))
    assert_equal [:morning, :evening], driver.get_available_schedules(DateTime.new(2015,10,2))

    # service
    assert_equal 0, Driver.get_driver_schedule(DateTime.new(2015,10,1), :evening)
    assert_equal 0, Driver.get_driver_schedule(DateTime.new(2015,10,1), :morning)
    assert_equal 0, Driver.get_driver_schedule(DateTime.new(2015,10,2), :afternoon)

    assert_equal 1, Driver.get_driver_schedule(DateTime.new(2015,10,1), :afternoon)
    assert_equal 1, Driver.get_driver_schedule(DateTime.new(2015,10,2), :evening)
    assert_equal 1, Driver.get_driver_schedule(DateTime.new(2015,10,2), :morning)
  end
end
