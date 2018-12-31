ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'


class ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods



  def sign_in(role)
    post user_session_path, params: { user: attributes_for(role) }
  end
end
