require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  test "only two addresses in two cities" do
    assert_equal 5, Address.count

    address = Address.find addresses(:a1).id
    assert_equal 'MyString 1', address.raw_line
    assert_equal 'City1', address.city.name
    assert_equal 'US, State 1, City1, 664433, MyString 1', address.name

    address = Address.find addresses(:a2).id
    assert_equal 'MyString 2', address.raw_line
    assert_equal 'City2', address.city.name
    assert_equal 'US, State 2, City2, 443322, MyString 2', address.name
  end
end
