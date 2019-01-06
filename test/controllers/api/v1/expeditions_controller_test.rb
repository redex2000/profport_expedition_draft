require 'test_helper'

class Api::V1::ExpeditionsControllerTest < ActionDispatch::IntegrationTest
  test 'should get forbidden' do
    get v1_expeditions_path(format: :json)
    assert_response :forbidden
  end

  test 'should get index' do
    user = create(:cosmonaut)
    count = 10
    create_list(:expedition, count)
    get v1_expeditions_path(format: :json), headers: { 'Authorization' => "Token #{user.auth_token}" }
    assert_response :success
    assert_equal count, JSON.parse(response.body)["data"].length
  end
end
