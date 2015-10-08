require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  test "only two addresses in two cities" do
    assert_equal 2, Address.count

    address = Address.find states(:one).id
    assert_equal 'MyString 1', address.raw_line
    assert_equal 'City1', address.city.name

    address = Address.find states(:two).id
    assert_equal 'MyString 2', address.raw_line
    assert_equal 'City2', address.city.name
  end
end
