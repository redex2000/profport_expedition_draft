require 'test_helper'

class GalaxyTest < ActiveSupport::TestCase
  test "should save valid" do
    galaxy = build(:galaxy)
    assert galaxy.save
  end

  test "should not save invalid" do
    galaxy = build(:galaxy, title: nil)
    assert_not galaxy.save
  end
end
