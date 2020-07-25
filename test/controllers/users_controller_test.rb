require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get quit" do
    get users_quit_url
    assert_response :success
  end

end
