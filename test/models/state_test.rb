require 'test_helper'

class StateTest < ActiveSupport::TestCase
  test "only two states State 1 and State 2 with country US" do
    assert_equal 2, State.count

    state = State.find states(:one).id
    assert_equal 'State 1', state.name
    assert_equal 'US', state.country.name

    state = State.find states(:two).id
    assert_equal 'State 2', state.name
    assert_equal 'US', state.country.name
  end
end
