require 'test_helper'

class Owners::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get owners_users_index_url
    assert_response :success
  end

  test "should get show" do
    get owners_users_show_url
    assert_response :success
  end

  test "should get edit" do
    get owners_users_edit_url
    assert_response :success
  end

  test "should get update" do
    get owners_users_update_url
    assert_response :success
  end

end
