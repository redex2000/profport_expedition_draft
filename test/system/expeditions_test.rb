require "application_system_test_case"

class ExpeditionsTest < ApplicationSystemTestCase
  test 'visit index page' do
    user = create(:cosmonaut)

    visit user_session_url

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    find('input[type="submit"]').click

    visit expeditions_url

    assert_title 'Список экспедиций|Космическое агентство «ПрофПорт-Экспедиции»'
  end

  test 'create new expedition' do
    visit new_expedition_path

    fill_in 'Title', with: 'На Марс'

    click_on 'Save'

    assert_text 'Created'
  end

  test 'destroy expedition' do

    sign_in

    create_list(:expedition, 5)

    visit expeditions_path


    accept_confirm do
      all('tbody tr')[0].all('td')[2].find('a').click
    end

    assert_match 'Удалено', find('.alert.alert-dismissible.alert-info.fade.show').text
  end
end
