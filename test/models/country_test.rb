require 'test_helper'

class CountryTest < ActiveSupport::TestCase
  test "only one country US" do
    assert_equal 1, Country.count
    assert_equal 'US', Country.first.name
  end
end
