require 'test_helper'

class GalaxiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get galaxies_url
    assert_response :success
  end

  test "should get new" do
    get new_galaxy_url
    assert_response :success
  end

  test "should post create" do
    assert_difference "Galaxy.count", 1 do
      post galaxies_path, params: { galaxy: attributes_for(:galaxy) }
    end
  end
end
