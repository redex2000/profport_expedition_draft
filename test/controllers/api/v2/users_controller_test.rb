require 'test_helper'

class Api::V2::UsersControllerTest < ActionDispatch::IntegrationTest
  test 'get token via sign in' do
    cosmonaut = create(:cosmonaut)
    Api::V2::UsersController
    hash_params = { user: { email: cosmonaut.email, password: cosmonaut.password } }.to_json
    patch sign_in_v2_users_url(format: :json), params: hash_params, headers: { 'Authorization' => "Token #{cosmonaut.auth_token}" }
    assert_response :success
    assert_equal cosmonaut.auth_token, JSON.parse(response.body)['token']
  end
end
