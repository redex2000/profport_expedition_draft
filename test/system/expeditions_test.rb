require "application_system_test_case"

class ExpeditionsTest < ApplicationSystemTestCase
  test 'visit index page' do
    visit expeditions_url

    assert_title 'Список экспедиций|Космическое агентство «ПрофПорт-Экспедиции»'
  end

  test 'create new expedition' do
    visit new_expedition_path

    fill_in 'Title', with: 'На Марс'

    click_on 'Save'

    assert_text 'Created'

    assert_select
  end
end
