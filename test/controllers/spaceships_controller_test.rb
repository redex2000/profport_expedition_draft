require 'test_helper'

class SpaceshipsControllerTest < ActionDispatch::IntegrationTest
  test 'show route' do
    assert_generates '/spaceships/1', controller: :spaceships, action: :show, id: 1
  end

  test 'create route' do
    assert_recognizes({ controller: 'spaceships', action: 'create' }, { path: 'spaceships', method: :post })
  end

  test 'update route' do
    assert_recognizes({ controller: 'spaceships', action: 'update', id: '1' }, { path: 'spaceships/1', method: :patch })
  end
end
