class ApplicationController < ActionController::Base
  PAGE_TITLE = "Космическое агентство «ПрофПорт-Экспедиции»"

  before_action :authenticate_user!
  helper_method :user_signed_in?

  private


  def authenticate_user!
    unless current_user.present?
      redirect_to root_path, alert: 'Необходимо войти в приложение!'
    end
  end


  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end


  def user_signed_in?
    current_user.present?
  end
end
