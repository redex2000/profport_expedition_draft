require 'test_helper'

class Api::V2::ExpeditionsControllerTest < ActionDispatch::IntegrationTest
  test 'should update' do
    user = create(:cosmonaut)
    count = 10
    create_list(:expedition, count)
    @expedition = Expedition.first
    new_title = 'На Юпитер'
    updating_hash = { expedition: { title: new_title } }.to_json
    patch v2_expedition_path(@expedition, format: :json), headers: { 'Authorization' => "Token #{user.auth_token}" }, params: updating_hash
    assert_response :success
    assert_equal "Обновление прошло успешно", JSON.parse(response.body)["message"]
    assert_equal @expedition.reload.title, new_title
  end
end
