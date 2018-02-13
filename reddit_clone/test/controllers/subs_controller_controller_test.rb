require 'test_helper'

class SubsControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get subs_controller_new_url
    assert_response :success
  end

  test "should get create" do
    get subs_controller_create_url
    assert_response :success
  end

  test "should get index" do
    get subs_controller_index_url
    assert_response :success
  end

  test "should get show" do
    get subs_controller_show_url
    assert_response :success
  end

  test "should get edit" do
    get subs_controller_edit_url
    assert_response :success
  end

  test "should get update" do
    get subs_controller_update_url
    assert_response :success
  end

end
