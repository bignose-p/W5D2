require 'test_helper'

class UsersControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get users_controller_new_url
    assert_response :success
  end

  test "should get create" do
    get users_controller_create_url
    assert_response :success
  end

end
