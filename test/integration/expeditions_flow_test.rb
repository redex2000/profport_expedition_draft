require 'test_helper'

class ExpeditionsFlowTest < ActionDispatch::IntegrationTest
  test 'create new expedition' do
    get new_expedition_path

    assert_response :success

    assert_select "h3", "Создать экспедицию"

    post expeditions_path, params: { expedition: attributes_for(:expedition) }

    assert_response :redirect

    follow_redirect!

    assert_response :success

    assert_select "td > a", attributes_for(:expedition)[:title]
  end
end
