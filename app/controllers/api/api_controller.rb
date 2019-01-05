class Api::ApiController < ApplicationController
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format.json? }
  skip_before_action :authenticate_user!
  before_action :auth_by_token

  include ActionController::HttpAuthentication::Token::ControllerMethods

  private

  def auth_by_token
    result = authenticate_with_http_token do |token|
      User.find_by(auth_token: token).present?
    end
    render json: { error: 'Неправильный токен!' }, status: 403 unless result
  end

end
