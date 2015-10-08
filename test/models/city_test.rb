require 'test_helper'

class CityTest < ActiveSupport::TestCase
  test "only two cities City1 and City2 in two states" do
    assert_equal 2, City.count

    city = City.find cities(:one).id
    assert_equal 'City1', city.name
    assert_equal 'State 1', city.state.name
    assert_equal 'US', city.state.country.name

    city = City.find cities(:two).id
    assert_equal 'City2', city.name
    assert_equal 'State 2', city.state.name
    assert_equal 'US', city.state.country.name
  end
end
