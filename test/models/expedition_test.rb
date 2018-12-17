require 'test_helper'

class ExpeditionTest < ActiveSupport::TestCase
  test 'create valid expedition' do
    expedition = build(:expedition)
    assert expedition.save
  end

  test 'create spaceships' do
    expedition = create(:expedition, spaceships_amount: 10)
    assert_equal 10, expedition.spaceships.count
  end
end
