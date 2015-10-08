require 'test_helper'

class TruckTest < ActiveSupport::TestCase
  test "only two tracks with start in one city" do
    assert_equal 2, Truck.count

    truck = Truck.find trucks(:one).id
    assert_equal 'Truck1', truck.number
    assert_equal 'MyString 1', truck.start_address.raw_line
    assert_equal 'City1', truck.start_address.city.name

    truck = Truck.find trucks(:two).id
    assert_equal 'Truck2', truck.number
    assert_equal 'MyString 1', truck.start_address.raw_line
    assert_equal 'City1', truck.start_address.city.name
  end
end
