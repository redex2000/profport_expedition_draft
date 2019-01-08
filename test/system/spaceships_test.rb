require "application_system_test_case"

class SpaceshipsTest < ApplicationSystemTestCase
  test 'create new expedition' do
    sign_in

    create(:expedition)
    expedition = create(:expedition, title: 'На Арктур')

    visit new_spaceship_path

    fill_in 'Title', with: 'Быстроход'
    fill_in 'Velocity', with: '100'
    find('#spaceship_expedition_id').find("option[value='#{expedition.id}']").select_option

    click_on 'Create'

    assert_text 'На Арктур'
  end
end
