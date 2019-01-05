class Api::ApiController < ApplicationController
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format.json? }
  skip_before_action :authenticate_user!
end
