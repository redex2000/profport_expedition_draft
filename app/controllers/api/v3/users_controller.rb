class Api::V3::UsersController < Api::V3::ApiController
  skip_before_action :authenticate_request!, only: %I[sign_in]

  def sign_in
    user = User.find_for_database_authentication(email: json['user']['email'])
    if user&.valid_password?(json['user']['password'])
      render json: payload(user)
    else
      render json: {errors: ['Invalid Username/Password']}, status: :unauthorized
    end
  end

  private

  def payload(user)
    return nil unless user&.id
    {
        auth_token: JsonWebToken.encode({ user_id: user.id }),
        user: { id: user.id, email: user.email }
    }
  end
end
