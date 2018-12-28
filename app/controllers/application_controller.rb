class ApplicationController < ActionController::Base
  PAGE_TITLE = "Космическое агентство «ПрофПорт-Экспедиции»"

  before_action :authenticate_user!
  include Pundit

end
