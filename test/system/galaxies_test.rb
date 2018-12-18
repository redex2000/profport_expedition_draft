require "application_system_test_case"

class GalaxiesTest < ApplicationSystemTestCase
  test "create galaxy" do
    visit galaxies_url
    click_on "New"

    fill_in "Title", with: "Млечный путь"
    click_on "Save"

    assert_content "Created"
    assert_content "Млечный путь"

  end
end
