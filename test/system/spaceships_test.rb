require "application_system_test_case"

class SpaceshipsTest < ApplicationSystemTestCase
  test 'create new expedition' do
    sign_in

    create(:expedition)
    create(:expedition, title: 'На Арктур')

    visit new_spaceship_path

    fill_in 'Title', with: 'Быстроход'
    fill_in 'Velocity', with: '100'
    select 'На Арктур', from: 'Expedition'

    click_on 'Create'

    assert_text 'На Арктур'
  end
end