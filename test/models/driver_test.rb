require 'test_helper'

class DriverTest < ActiveSupport::TestCase
  test "test two drivers" do
    assert_equal 2, Driver.count

    driver = Driver.find drivers(:one).id
    assert_equal Date.new(2000,1,1), driver.schedule
    assert_equal 'Driver 1', driver.name
    assert_equal 'Truck1', driver.truck.number

    driver = Driver.find drivers(:two).id
    assert_equal Date.new(2000,1,2), driver.schedule
    assert_equal 'Driver 2', driver.name
    assert_equal 'Truck2', driver.truck.number
  end
end
