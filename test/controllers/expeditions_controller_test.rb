require 'test_helper'

class ExpeditionsControllerTest < ActionDispatch::IntegrationTest
  test 'expeditions index view' do
    create(:cosmonaut)
    sign_in(:cosmonaut)

    get expeditions_url

    assert_select 'table.table' do
      assert_select 'th', 'Название'
    end
  end


  test 'get index' do
    create(:cosmonaut)
    sign_in(:cosmonaut)

    get expeditions_url
    assert_response :success
  end


  # test 'create expedition' do
  #   assert_difference 'Expedition.count', 1 do
  #     post expeditions_url, params: { expedition: attributes_for(:expedition) }
  #   end
  # end
  #
  #
  # test 'update expedition' do
  #   @expedition = create(:expedition)
  #   assert_difference 'Expedition.count', 0 do
  #     patch expedition_url(@expedition), params: { expedition: attributes_for(:expedition) }
  #   end
  # end
  #
  #
  # test 'should not update invalidl expedition' do
  #   @expedition = create(:expedition)
  #
  #   patch expedition_url(@expedition), params: { expedition: { title: '' } }
  #
  #   assert_equal 'Ошибка при сохранении', flash[:alert]
  # end
end