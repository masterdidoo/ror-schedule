require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test "orders" do
    assert_equal 5, Order.count

    order = Order.find orders(:ord1).id
    assert_equal '230203', order.number
    assert_equal Date.new(2015,10,10), order.delivery_date
    assert_equal 'afternoon', order.delivery_shift
    assert_equal 5.5, order.volume
    assert_equal 1, order.handling_unit_quantity

    assert_equal 'LTD Name', order.origin_point.name
    assert_equal 'MyString 1', order.origin_point.address.raw_line
    assert_equal '443-2233213', order.origin_point.phone

    assert_equal 'Client Name 1', order.destination_point.name
    assert_equal 'MyString 2', order.destination_point.address.raw_line
    assert_equal '442-0022225', order.destination_point.phone

    order = Order.find orders(:ord2).id
    assert_equal '230204', order.number
    assert_equal Date.new(2015,10,10), order.delivery_date
    assert_equal 'evening', order.delivery_shift
    assert_equal 4.5, order.volume
    assert_equal 5, order.handling_unit_quantity

    assert_equal 'Client Name 1', order.origin_point.name
    assert_equal 'MyString 2', order.origin_point.address.raw_line
    assert_equal '442-0022225', order.origin_point.phone

    assert_equal 'LTD Name', order.destination_point.name
    assert_equal 'MyString 1', order.destination_point.address.raw_line
    assert_equal '443-2233213', order.destination_point.phone
  end

  test "orders list" do
    order = Order.find orders(:ord2).id
    ds = order.delivery_shift
    assert_equal 'evening', ds

    list = Order.where(:delivery_date => Date.new(2015,10,10), :delivery_shift => Order.delivery_shifts[ds])
    assert_equal 4, list.count
  end
end
