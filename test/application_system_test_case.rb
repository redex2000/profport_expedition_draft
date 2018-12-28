require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :chrome, screen_size: [1400, 1400]

  def sign_in
    user = create(:cosmonaut)

    visit new_session_url

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_on 'Sign in'
  end

end
