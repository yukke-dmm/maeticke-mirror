require 'test_helper'

class Owners::HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get owners_homes_top_url
    assert_response :success
  end

  test "should get about" do
    get owners_homes_about_url
    assert_response :success
  end

end
