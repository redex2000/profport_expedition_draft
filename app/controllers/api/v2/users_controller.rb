class Api::V2::UsersController < Api::V2::ApiController
  def sign_in
    user = User.find_by email: json.dig('user', 'email')
    if user&.valid_password?(json.dig('user', 'password'))
      render json: { token: user.auth_token }, status: 200
    else
      render json: { message: 'Неправильный логин/пароль' }, status: 403
    end
  end
end
