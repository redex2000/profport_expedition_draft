class Api::ApiController < ApplicationController
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format.json? }
  skip_before_action :authenticate_user!
  before_action :auth_by_password

  include ActionController::HttpAuthentication::Basic::ControllerMethods

  private

  def auth_by_password
    result = authenticate_with_http_basic do |email, password|
      Rails.logger.debug "email #{email} password #{password}"
      user = User.find_by(email: email)
      user&.valid_password?(password)
    end
    render json: { error: 'Неправильный логин либо пароль!' }, status: 403 unless result
  end

end
